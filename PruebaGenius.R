install.packages('rgenius')
install.packages("knitr")

Sys.setenv(GENIUS_API_TOKEN='EQsA-LnmAXf3Taz7nudtukE3ahHCuHttJ_nxYGD2J74A5s6XA8bmDlwnsgL2n9hL')
library(rgenius)

artista <- search_genius_artist(artist_name = 'Wardruna')
artista
