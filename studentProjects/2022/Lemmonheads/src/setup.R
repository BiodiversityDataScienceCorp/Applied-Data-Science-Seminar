# Setup script for required data and package installation
# Jeffrey C. Oliver
# jcoliver@email.arizona.edu
# 2017-11-02

# install packages:
required <- c("raster", "sp", "dismo", "maptools", "spocc", "rgdal", "sf","tidyverse","maps")
install.packages(required)

# load packages:
library("raster")
library("sp")
library("dismo")
library("maptools")
library("spocc")
library("rgdal")
library("sf")
library("tidyverse")
library("maps")

# load current climate data
if(file.exists("data")){
  dir.create("data/wc2-5")
}else{
  dir.create("data")
  dir.create("data/wc2-5")
}

url<-"https://climatedata.watzekdi.net/bio_2-5m_bil.zip"
destfile<-"data/wc2-5/bio_2-5m_bil.zip"

message("Downloading climate data from WorldClim")
download.file(url, destfile)
message("Extracting current climate data (this may take a moment)")
unzip(zipfile = "data/wc2-5/bio_2-5m_bil.zip", exdir="data/wc2-5/")
file.remove("data/wc2-5/bio_2-5m_bil.zip")


# load future climate data

future<-c("forecast1.zip","forecast2.zip","forecast3.zip","forecast4.zip")

#loops through the future vector, downloads and unzips each file
for (file in future){
  urlFuture<-paste("https://climatedata.watzekdi.net/",file, sep = "")
  destfileFuture<-file
  download.file(urlFuture, destfileFuture)
  message("Extracting future climate data (this may take a moment)")
  unzip(zipfile = file, exdir=".")
  file.remove(file)
}

################################################################################
# Download climate data

# Make sure data directory is writable
if (file.access(names = "data") != 0) {
  stop(paste0("You do not have sufficient write access to data directory.\n"))
}

# Make sure raster package was installed and load it
if (!require(package = "raster")) {
  stop("Setup requires the raster package, which does not appear to be available.\n")
}

# Download bioclim data
message("Downloading climate data from WorldClim")
bioclim.data <- getData(name = "worldclim",
                        var = "bio",
                        res = 2.5, # Could try for better resolution, 0.5, but would then need to provide lat & long...
                        path = "data/")

# Unzip forecast data
message("Extracting forecast climate data (this may take a moment)")
forecast.archives <- list.files(path = "data/cmip5/2_5m", 
                                pattern = "*.zip$",
                                full.names = TRUE)
forecast.data <- lapply(X = forecast.archives, FUN = unzip)
# unzip(zipfile = "data/cmip5/2_5m/forecast-data.zip")

# NOPE archive is too big (> 100 MB) for GitHub. But there might be a solution
# GitHub large file storage https://git-lfs.github.com/
# Better yet, just make a few (4?) smaller archives

# Downloading of forecast data deprecated to avoid dependency on troublesome 
# rgdal. Instead use 
#   `forecast.data <- raster::stack(x = "data/cmip5/2_5m/forecast-raster.gri")`
# when forecast data are needed
# Download forecast data
# See https://link.springer.com/article/10.1007/s00382-014-2418-8
# for recommendations of the model to use
# forecast.data <- getData(name = "CMIP5", # forecast
#                          var = "bio", # bioclim
#                          res = 2.5,
#                          path = "data/",
#                          model = "GD", # GFDL-ESM2G
#                          rcp = "45", # CO2 increase 4.5
#                          year = 70) # 2070
# For those interested, the workaround was:
#  1. With rgdal installed, use the getData code as above
#  2. With the `bioclim.data` object in memory, run 
#      `names(forecast.data) <- names(bioclim.data)`
#  3. Save the file as a raster using `raster::writeRaster` with default 
#      format (.gri)
#  4. Compress the resultant .gri and .grd files via
#     `zip(zipfile = "data/cmip5/2_5m/forecast-data.zip", 
#          files = c("data/cmip5/2_5m/forcast-raster.grd", 
#                    "data/cmip5/2_5m/forcast-raster.gri"))`
#  6. Include that zip archive under version control, but not the .gri and .grd
#      files
#  5. Update this file (scripts/setup.R) to unzip the archive, inflating the 
#      .grd and .gri files (directory structure was preserved by `zip` command)

# Clean up workspace
rm(required, successful, unsuccessful, bioclim.data, forecast.archives, forecast.data)

message("Setup complete.")