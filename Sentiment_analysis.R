#Instalaciones
install.packages('spotifyr')
install.packages("remotes")
install.packages("genius")
install.packages('tm')
install.packages("treemapify")
install.packages("ggplot2")
install.packages("ggforce")
install.packages("treemap")

#Librerias
library(spotifyr)
library(tidyr)
library(dplyr)
library(rgenius)
library(purrr)
library(ggplot2) # Crear graficos basados en datos
library(tidytext) # stop words
library(forcats)
library(treemapify)
library(treemap)

#credenciales
Sys.setenv(SPOTIFY_CLIENT_ID = '83c1f5403e0041af94284639b5ef0aa2')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '89f47a4d82c349819ba0139f91f7a5e4')
Sys.setenv(GENIUS_API_TOKEN='EQsA-LnmAXf3Taz7nudtukE3ahHCuHttJ_nxYGD2J74A5s6XA8bmDlwnsgL2n9hL')

#Acceso
access_token <- get_spotify_access_token()
#Obtener datasets de la información de los grupos
get_data()

#band_df:dataset, plot_name:string, lg:string -> "es"(default)
song_emotion(camiloFull, "Camilo_emotions")
song_emotion(cuartetoFull, "cuartetodenos_emotions")
song_emotion(magoFull, "mago_emotions")
song_emotion(moderattoFull, "moderatto_emotions")
song_emotion(moeniaFull, "moenia_emotion")
song_emotion(pandaFull, "panda_emotions")
song_emotion(ratablancaFull, "ratablanca_emotions")
song_emotion(darknessFull, "darkness_emotions", "en")
song_emotion(StreetlightFull, "streetlight_emotions", "en")
song_emotion(redhotFull, "redhotchilipeppers_emotions", "en")
song_emotion(metallicaFull, "metallica_emotions", "en")
song_emotion(AleksSyntekFull, "AleksSyntek_emotions")
song_emotion(BadReligionFull, "BadReligion_emotions", "en")
song_emotion(LuisMiFull, "LuisMi_emotions")
song_emotion(BulletandOctFull, "BulletandOct_emotions", "en")
song_emotion(ReikFull, "Reik_emotions")
song_emotion(CalonchoFull, "Caloncho_emotions")


song_emotion(WardrunaFull, "Wardruna", "nor")


