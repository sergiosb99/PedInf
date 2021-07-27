### ¡Bienvenido al repositorio de PedInf!

PedInf es un sistema inteligente de ayuda a la decisión para el diagnóstico y tratamiento de enfermedades infecciosas pedíatricas, apoyado en la ingeniería del conocimiento y el análisis de datos.

![Logo PedInf](https://1.bp.blogspot.com/-K5Qy_2IKebU/YKgnnIuW8pI/AAAAAAAABSM/oDRMyAB9iK4wmBoWJJJp72ey-UyP_qMEQCLcBGAsYHQ/s501/Captura.PNG)

Te recomiendo que le eches un ojo a nuestra [wiki](https://github.com/sergiosb99/PedInf/wiki), en la cual podrás encontrar información sobre el proyecto.

### Jerarquía de archivos

```
├── SistemaExperto      <- Contiene el sistema experto desarrollado a través de la ingeniería del conocimiento.
|   ├── BaseConocimiento.clp         <- Base de conocimiento del sistema experto para el entorno CLIPS.
│   ├── BaseHechos.clp               <- Conjunto de hechos que sirven como paso de prueba del sistema.
│   └── LEEME.txt                    <- Archivo de información.
├── AnalisisDatos       <- Contiene el material del proceso de análisis de datos desarrollado en el proyecto.
|   ├── Web_scraping                 <- Contiene el material usado en el proceso de web scraping.
│   |   ├── CodigosHTML                 <- Contiene los códigos HTML guardados en archivos de texto simple. 
|   |   |   ├── Bronquiolitis.txt
|   |   |   ├── ...
|   |   |   └── TosFerina.txt
|   |   ├── WebScraping.py              <- Algoritmo de web scraping automático desarrollado.
|   |   ├── dataset.csv                 <- Archivo CSV resultante del proceso de web scraping.
|   |   └── LEEME.txt                   <- Archivo de información.
|   ├── DataLake                     <- Contiene todos los conjuntos de datos que conforman el data lake.
│   |   ├── AirPollutionPerCountry.csv      
|   |   ├── ...
|   |   └── WaterAndHygienePerCountry.csv
|   ├── Seleccion_de_datos           <- Contiene el desarrollo de la seleccion de datos del Proceso KDD.
|   |   ├── Cuadernos                   <- Contiene los cuadernos Jupyter desarrollados en esta fase.
|   |   |   ├── Seleccion_de_Datos_Casos_Clinicos.ipynb
|   |   |   └── Seleccion_de_Datos_Datos_OMS.ipynb
|   |   ├── Datos_seleccionados         <- Contiene los conjuntos de datos resultantes de esta fase.
|   |   |   ├── casos_infecciosas.csv
|   |   |   └── oms_data.csv
|   |   └── LEEME.txt
|   ├── Preproceso_de_datos          <- Contiene el desarrollo del preprocesado de datos del Proceso KDD.
|   |   ├── Cuadernos                   <- Contiene los cuadernos Jupyter desarrollados en esta fase.
|   |   |   ├── Preproceso_de_Datos_Casos_Clinicos.ipynb
|   |   |   └── Preproceso_de_Datos_Datos_OMS.ipynb
|   |   ├── Datos_preprocesados         <- Contiene los conjuntos de datos resultantes de esta fase.
|   |   |   ├── casos_clinicos_preprocesado.csv
|   |   |   └── oms_data_preprocesado.csv
|   |   └── LEEME.txt
|   └── Mineria_de_datos             <- Contiene el desarrollo de minería de datos del Proceso KDD.
|       ├── Mineria_de_Datos_Casos_Clinicos.ipynb
|       ├── Mineria_de_Datos_Datos_OMS.ipynb
|       ├── ArbolDecision.png
|       └── LEEME.txt
├── Interfaz            <- Contiene la interfaz desarrollada para facilitar el acceso al conocimiento extraído.  
|   ├── Presentacion                 <- Capa de presentación de la interfaz.
|   |   ├── pedinf_main.ui
|   |   ├── pedinf_help.ui
|   |   ├── pedinf_logo.png
|   |   ├── favicon.png
|   |   └── imagenes.qrc
|   ├── PedInf.py                    <- Capa de dominio de la interfaz.
|   └── BaseConocimientoClipspy.clp  <- Base de conocimiento acorde a la sintaxis de Clipspy.                                             
└── README.md           <- Archivo de información
```

En este proyecto, gracias a la ingeniería del conocimiento, se podrá extraer, conceptualizar y representar el conocimiento necesario para desarrollar un sistema experto de diagnóstico de enfermedades infecciosas, capaz también de aportar un tratamiento para paliar la enfermedad diagnósticada.

Por otro lado, se hace uso del análisis de datos para corroborar el buen hacer del sistema experto, además de conocer cuales son las causas que permiten la expansión de las enfermedades infecciosas en el planeta, trabajando con diferentes indicadores médicos de cada páis.

Todo el conocimiento extraído, podrá ser acesible para todo el mundo gracias al desarrollo de una interfaz que permita al usuario rellenar los datos necesarios de forma sencilla, creando internamente el entorno de razonamiento.

![Logo](https://1.bp.blogspot.com/-7iEvUFeVOVY/YPW4xGRcwdI/AAAAAAAABVc/Rzw2fJYas3s7EjZuj6mYcIl0lHtVGRgzACLcBGAsYHQ/s1600/esi_uclm.png)
