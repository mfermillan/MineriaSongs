# MineriaSongs

**Obtener datos y preparar entorno**

- Importar NRC_lexicon (archivo local)
- Run Instalaciones 
- Run Librerias
- Run Credenciales
- Run Acceso
- Run GetData.R
- Run word_emotions_functions.R
- Run get_data()
- Crear carpeta de “Graficas” dentro del proyecto

**Graficar información del grupo o artista**
- Consumir función song_emotion
  - Datos que recibe
    - band_df : dataframe
      - Del grupo que se quiera analizar
    - Plot_name : string
      - eg: “camilo”
    - lg: string 
      - “es” o vacio : cuando la canción es en español
      - “en” : cuando la canción es en inglés.

**Agregar un nuevo grupo**
1. Para agregar un nuevo grupo se debe obtener el id del grupo en genius (PruebaGenius)
2. Agregar el id del grupo a la función GetData
3. Obtener la discografía de Genius (lyrics) y de spotify (fulldata), y hacer un merge 

Función para sacar la información del grupo

```song_emotion(band_df:dataset, plot_name:string, lg:string -> "es"(default))```

Ejemplo:

```song_emotion(StreetlightFull, "streetlight_emotions", "en")```


