path_to_file <- file.path("Cytometry Carlos","04_IntroToTidyverse","data", "Dataset.csv")
Data <- read.csv(path_to_file, check.names = F) #check.names avoids column names to be modified when they contain special characters or spaces
??glimpse #Checks where this function is located within all our installed packages
dplyr::glimpse(Data) #Summary of the table, including dimensions
# Pipe operators
## usar |> en vez de %>%, son prácticamente intercambiables
# Funciones
## select() ya me la sé
## relocate() sirve para reordenar una columna
Data |> relocate(Tcells, .after = bid) |> head(5)
## rename() ya me la sé
## pull() sirve para sacar los valores de una columna a un vector/lista
Data |> pull(Date) |> head(10)
## Se puede combinar con unique() para sacar qué valores diferentes hay
Data |> pull(Date) |> unique()
## filter() ya me la sé, aunque es mejor usar %in% en vez de ==
Data |> filter(Condition %in% "PPD") |> head(10)
Data |> filter(Condition %in% c("PPD", "SEB")) |> head(10)
conditions <- c("PPD", "SEB")
Data |> filter(Condition %in% conditions) |> head(10) #mejor definir antes la condición sobre la que filtrar
Data |> filter(!Condition %in% conditions) |> head(10) #con el signo de exclamación, invertimos el filtro para seleccionar las filas que no lo cumplen
## mutate() me la sé más o menos xd
TidyData <- Data |> filter(Condition %in% "Ctrl") |> filter(timepoint %in% "0") |>
     select(bid, timepoint, Condition, Date, Tcells_count, CD45_count) |>
      rename(specimen=bid, condition=Condition) |> relocate(Date, .after=specimen)
TidyData <- TidyData |> mutate(Tcells_ProportionCD45 = Tcells_count / CD45_count)
## arrange() o arrange(desc()) sirve para ordenar las filas numéricamente según la columna que queramos