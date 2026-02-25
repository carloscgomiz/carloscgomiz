path_to_data_folder <- file.path("Cytometry Carlos/03_InsideFCSFile/data")
fcsfiles <- list.files(path = path_to_data_folder, pattern = ".fcs", full.names = T)

library(flowCore)
firstfile <- fcsfiles[1]
flowframe <- read.FCS(firstfile)
