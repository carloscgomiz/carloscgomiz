week2 <- file.path("Cytometry Carlos", "02_FilePaths")
dir.create(path = file.path(week2, "data", "target"))
dir.create(path = file.path(week2, "data", "target2"))
# Copy first two .fcs files from data to both target and target2 folders
list.files(path = file.path(week2, "data"), full.names = F, recursive = F)
list.files(path = file.path(week2, "data"), full.names = F, recursive = F, pattern = ".fcs")
files <- list.files(path = file.path(week2, "data"), full.names = F, recursive = F, pattern = ".fcs")

library(stringr) # Librería para trabajar con strings
str_detect(files, "INF")
Infants <- files[str_detect(files, "INF")]

# Crear una carpeta SÓLO si no existe (bucle if)
target3 <- file.path(week2, "data", "target3")
dir.exists(target3) #dir.exists devuelve TRUE si ese directorio existe
if (!dir.exists(target3)){
  dir.create(target3)
}

# Copiar files a otra carpeta
# file.copy(from = Infants, to = target3) no funciona porque no encuentra los archivos, necesitamos la dirección entera
filesfull <- list.files(path = file.path(week2, "data"), full.names = T, recursive = F, pattern = ".fcs") # Cambiamos full.names a T
Infants <- filesfull[str_detect(filesfull, "INF")] # Volvemos a crear el objeto Infants
file.copy(from = Infants, to = target3)
list.files(target3, full.names = F) # Comprobamos que los archivos, efectivamente, se han copiado

