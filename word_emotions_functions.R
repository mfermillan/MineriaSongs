song_emotion<-function(band_df, plot_name, lg="es"){
  
  # contar el numero de veces que una palabra es usada en cada canción
  Song_tf_idf <- band_df %>%
    unnest_tokens(word, track_lyrics) %>%
    count(track_name, word, sort = TRUE) #Contar valores unicos de estas 2 variables

  
  total_words <- Song_tf_idf %>% 
    group_by(track_name) %>% 
    summarize(total = sum(n))
  
  Song_tf_idf <- left_join(Song_tf_idf, total_words)
  
  if(lg=="es"){
    custom_stop_words <- bind_rows(stop_words,
                                 data_frame(word = tm::stopwords("spanish"),
                                 lexicon = "custom"))
    lg="Spanish (es)"
  }
  if(lg=="en"){
    #Stop words
    data(stop_words)
    custom_stop_words <- stop_words
    lg="English (en)...1"
  }
  if(lg=="nor"){
    custom_stop_words <- bind_rows(stop_words,
                                   data_frame(word = tm::stopwords("norwegian"),
                                              lexicon = "custom"))
    lg="Norwegian (no)"
  }

  Song_tf_idf <- Song_tf_idf %>%
    bind_tf_idf(word, track_name, n) #calcula y une el tf y el idf de una tidy text
  Song_tf_idf #palabras extremandamente comunes
  
  Song_tf_idf %>%
    select(-total) %>% #excluir el total
    arrange(desc(tf_idf))
  
  Song_tf_idf <- Song_tf_idf %>%
    anti_join(custom_stop_words) %>% anti_join(mystopwords)
  
  Song_tf_idf %>%
    count(word, sort = TRUE) 
  mystopwords <- tibble(word = c("produced", "by","relese","date"))
  
  keeps <- c(lg,"Positive",	"Negative",	"Anger",	"Anticipation",	"Disgust",	"Fear","Joy",	"Sadness", "Surprise",	"Trust")
  es_lexicon <- NRC_Lexicon[keeps]
  Song_tf_idf <- merge(Song_tf_idf, es_lexicon, by.x = "word", by.y = lg)
  
  #Empieza Grafica de spotify
  band_df<- band_df %>%
    select(track_name,valence,energy, album_name)
  
  Song_spoty <- left_join(Song_tf_idf,band_df, by="track_name", all.x=true)
    Song_spoty %>% 
      ggplot(.,(aes(valence, energy, color=album_name))) +
      stat_summary(fun = sum, geom = "pointrange", position = "dodge")+ 
      #theme(legend.position = "none")+
      scale_x_continuous(limits = c(0, 1))+ 
      scale_y_continuous(limits = c(0, 1))+ 
      geom_text(aes(label = track_name), nudge_y = 0.015, check_overlap = TRUE) + 
      geom_vline(xintercept = 0.5)+
      geom_hline(yintercept=0.5)+
      geom_label(
        label="Feliz y Alegre", 
        x=0.9,
        y=1,
        label.padding = unit(0.55, "lines"), 
        label.size = 0.35,
        color = "black",
        fill="#F8DE7E"
      )+
      geom_label(
        label="Tristeza, depresión", 
        x=0.1,
        y=0,
        label.padding = unit(0.55, "lines"), 
        label.size = 0.3,
        color = "black",
        fill="#7285a5"
      )+
      geom_label(
        label="Relajado, Pacifico", 
        x=0.9,
        y=0,
        label.padding = unit(0.55, "lines"), 
        label.size = 0.35,
        color = "black",
        fill="#89cfef"
      )+
      geom_label(
        label="Enojo, Euforia", 
        x=0.1,
        y=1,
        label.padding = unit(0.55, "lines"), 
        label.size = 0.35,
        color = "black",
        fill="#ed2939"
      )
    ggsave(paste0('Graficas/',plot_name,'.png'), width = 15, height = 8)
  #Termina Grafica Spotify 
  
  #empieza grafica general por artista
  Song_tf_idf %>%  gather(key, value, -word, -track_name, -n, -total, -tf,-idf, -tf_idf) %>%
    ggplot(.,(aes(area=value, fill = key, color=key))) +
    geom_treemap()+
    ggtitle(plot_name)
  ggsave(paste0('Graficas/',plot_name,'_full.png'))
  #termina grafica general por artista
  
  #empieza grafica por canción
  np=ceiling(n_distinct(Song_tf_idf$track_name)/9)
  for(i in 1:np){
    Song_tf_idf %>%
      group_by(track_name) %>%
      slice_max(tf_idf, n = 10) %>% #selecciona los maximos valores de la variable
      ungroup() %>%
      gather(key, value, -word, -track_name, -n, -total, -tf,-idf, -tf_idf) %>%
      filter(.,value>0) %>%
      ggplot(.,(aes(area=value, fill = key, color=key))) +
      geom_treemap()+
      ggtitle(plot_name) +
      facet_wrap_paginate(~track_name, scales='free', ncol = 3, nrow = 3, page = i)
    ggsave(paste0('Graficas/',plot_name,'_page_', i, '.jpg'))
  }
  #termina grafica por canción
  
  
}





