## Problem 1: 
# Plug in an external hard-drive or USB into your computer. 
# Manually, create a folder within called “TargetFolder”. 
# Try to programmatically specify the file path to identify the folders and files present on your external drive. 
# Then, try to copy your .fcs files from their current folder on your desktop to the TargetFolder on your drive using R. 
# Remember, just copy, no deletion, you need to walk before you can run :D
usb <- file.path("D:", "Target Folder")
list.files(path = usb) #No files yet
data.dir <- file.path("Cytometry Carlos", "02_FilePaths", "data")
adultfiles <- list.files(data.dir, pattern = "\\_N", recursive = F, full.names = T)
file.copy(from = adultfiles, to = usb)
# Made it in my first try!!!

## Problem 2
# In this session, we used list.files with the full.names argument, as well as the basename() function to identify specific files. 
# But what if you wanted a particular directory?
# Run list.files with recursive set to TRUE, and then search online to find an R function that would retrieve the “” directory.
allfiles <- list.files(data.dir, recursive = T, full.names = T)
dir3 <- dirname(allfiles[3]) #for instance, we get the directory from file number 3
alldirs <- dirname(allfiles) #or we get the vector containing the directory of each file

## Problem 3
# R packages often come with internal datasets, that are typically used for use in the help documentation examples. 
# These can be accessed through the use of the system.file() function. See an example below.
# Using what we have learned about file.path navigation, search your way down the file.directory of the FlowSOM and flowWorkspace packages, and identify any .fcs files that are present for use in the documentation.
flowsom <- system.file(package = "FlowSOM")
flowws <- system.file(package = "flowWorkspace")
list.files(path = c(flowws, flowsom), pattern = ".fcs", recursive = T, full.names = T)
