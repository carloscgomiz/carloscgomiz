path_to_data_folder <- file.path("Cytometry Carlos/03_InsideFCSFile/data")
fcsfiles <- list.files(path = path_to_data_folder, pattern = ".fcs", full.names = T, recursive = T)

library(flowCore)
rawfile <- fcsfiles[3]
unmixedfile <- fcsfiles[2]

# Problem 1
raw <- read.FCS(rawfile, transformation = F, truncate_max_range = F)
unmixed <- read.FCS(unmixedfile, transformation = F, truncate_max_range = F)

raw@parameters@data
unmixed@parameters@data

keywords_raw <- raw@description
keywords_unmixed <- unmixed@description

# Problem 2
convfile <- fcsfiles[1]
conv <- read.FCS(convfile, transformation = F, truncate_max_range = F)
conv@parameters@data
keywords_conv <- conv@description

