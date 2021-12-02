get_data <- function(){
  
  
  Wardruna<- get_discography_lyrics(artist_id = '359744', cores = 10) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(Wardruna) <- c("track_name","track_lyrics")
  WardrunaFull <- get_discography('Wardruna', access_token) 
  WardrunaFull <-merge(x=WardrunaFull,y=Wardruna,by="track_name")
  
  
  #Aleks Syntek
  AleksSyntek<- get_discography_lyrics(artist_id = '350509', cores = 10) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(AleksSyntek) <- c("track_name","track_lyrics")
  AleksSyntekFull <- get_discography('Aleks Syntek', access_token) 
  AleksSyntekFull <-merge(x=AleksSyntekFull,y=AleksSyntek,by="track_name")
  
  #Bad Religion
  BadReligion<- get_discography_lyrics(artist_id = '27995', cores = 10) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(BadReligion) <- c("track_name","track_lyrics")
  BadReligionFull <- get_discography('Bad Religion', access_token) 
  BadReligionFull <-merge(x=BadReligionFull,y=BadReligion,by="track_name")
    
  #Luismi
  LuisMi<- get_discography_lyrics(artist_id = '354376', cores = 10) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(LuisMi) <- c("track_name","track_lyrics")
  LuisMiFull <- get_discography('Luis Miguel', access_token) 
  LuisMiFull <-merge(x=LuisMiFull,y=LuisMi,by="track_name") 
  
  #Bullets and Octane
  BulletandOct<- get_discography_lyrics(artist_id = '350928', cores = 2) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(BulletandOct) <- c("track_name","track_lyrics")
  BulletandOctFull <- get_discography('Bullets And Octane', access_token) 
  BulletandOctFull <-merge(x=BulletandOctFull,y=BulletandOct,by="track_name") 
  
  #Reik
  Reik<- get_discography_lyrics(artist_id = '346373', cores = 2) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(Reik) <- c("track_name","track_lyrics")
  ReikFull <- get_discography('Reik', access_token) 
  ReikFull <-merge(x=ReikFull,y=Reik,by="track_name")
  
  #Caloncho
  Caloncho<- get_discography_lyrics(artist_id = '405344', cores = 2) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(Caloncho) <- c("track_name","track_lyrics")
  CalonchoFull <- get_discography('Caloncho', access_token) 
  CalonchoFull <-merge(x=CalonchoFull,y=Caloncho,by="track_name")
  
  #Camilo
  camilo<- get_discography_lyrics(artist_id = '1371843', cores = 2) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(camilo) <- c("track_name","track_lyrics")
  camiloFull <- get_discography('camilo', access_token) 
  camiloFull <-merge(x=camiloFull,y=camilo,by="track_name")
  
  #cuarteto de nos
  cuarteto<-get_discography_lyrics(artist_id = '195427', cores = 2) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(cuarteto) <- c("track_name","track_lyrics")
  cuartetoFull <-get_discography('cuarteto de nos', access_token) 
  cuartetoFull <-merge(x=cuartetoFull,y=cuarteto,by="track_name")
  
  #pxndx
  panda<-get_discography_lyrics(artist_id = '980228', cores = 2) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(panda) <- c("track_name","track_lyrics")
  pandaFull<-get_discography('pxndx', access_token) 
  pandaFull <-merge(x=pandaFull,y=panda,by="track_name")
  
  #moderatto
  moderatto<-get_discography_lyrics(artist_id = '344544', cores = 2) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(moderatto) <- c("track_name","track_lyrics")
  moderattoFull<-get_discography('moderatto', access_token)
  moderattoFull<-merge(x=moderattoFull,y=moderatto,by="track_name")
  
  #moenia
  moenia<-get_discography_lyrics(artist_id = '453399', cores = 2) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(moenia) <- c("track_name","track_lyrics")
  moeniaFull<-get_discography('moenia', access_token) 
  moeniaFull<-merge(x=moeniaFull,y=moenia,by="track_name")
  
  #Rata Blanca
  ratablanca<-get_discography_lyrics(artist_id = '357017', cores = 4) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(ratablanca) <- c("track_name","track_lyrics")
  ratablancaFull<-get_discography('rata blanca', access_token) 
  ratablancaFull<-merge(x=ratablancaFull,y=ratablanca,by="track_name")
  
  #Streetlight Manifesto
  Streetlight<-get_discography_lyrics(artist_id = '49970', cores = 2) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(Streetlight) <- c("track_name","track_lyrics")
  StreetlightFull<-get_discography('streetlight manifesto', access_token)
  StreetlightFull<-merge(x=StreetlightFull,y=Streetlight,by="track_name")
  
  #Redhotchilipeppers
  redhot<-get_discography_lyrics(artist_id = '1460', cores = 4) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(redhot) <- c("track_name","track_lyrics")
  redhotFull<-get_discography('red hot chili peppers', access_token) 
  redhotFull<-merge(x=redhotFull,y=redhot,by="track_name")
  
  #The darkness
  darkness<-get_discography_lyrics(artist_id = '22667', cores = 2) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(darkness) <- c("track_name","track_lyrics")
  darknessFull<-get_discography('the darkness', access_token)
  darknessFull<-merge(x=darknessFull,y=darkness,by="track_name")
  
  #mago de oz
  mago<-get_discography_lyrics(artist_id = '212232', cores = 10) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(mago) <- c("track_name","track_lyrics")
  magoFull<-get_discography('mago de oz', access_token) 
  magoFull<-merge(x=magoFull,y=mago,by="track_name")
  
  #metallica
  metallica<-get_discography_lyrics(artist_id = '10662', cores = 15) %>% map(~as_tibble(.)) %>% bind_rows(.id="track_name") 
  colnames(metallica) <- c("track_name","track_lyrics")
  metallicaFull<-get_discography('metallica', access_token) 
  metallicaFull<-merge(x=metallicaFull,y=metallica,by="track_name")
}
