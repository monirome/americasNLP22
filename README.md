# AmericasNLP challenge

Como tengo organizado el cesvima... dentro de la carpeta PROJECT estan: 
- americasNLP: aqui es donde tengo clonado este respositorio de github
- Quechua: estan los audios de este idioma, manifest y archivos necesarios para fairseq y el script file.py que es el que los genera. 
- bribri: ...
- guarani: ...
- kotiria: ...
- waikhana: ...

------------------------------------------------------------------------------------------------------------

1. Cargar datos de los idiomas. En cada una de las carpetas de idiomas añadir el script de python files.py donde se generan los archivos train y dev. [este archivo no se encuentra en el repositorio es adhoc] 
2. Ejecutar install_bash.sh . Este instala las apps y librerias de python necesarias, kenlm, OpenBLAS, fftw y fairseq 
3. Revisar dentro de config las rutas de cada uno de los finetuning_XXX.yaml
4. Ejecutar un job_XXX.sh 

