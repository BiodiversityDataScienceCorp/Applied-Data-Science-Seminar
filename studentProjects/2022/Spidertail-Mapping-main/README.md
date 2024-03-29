## Overview
This project aims to support Monarch butterfly conservation by modeling a species of milkweed in the southwest of North America. Using publicly available occurence data of the horsetail milkweed species (*Asclepius subverticillata*) from GBIF and iNaturalist, as well as and future climate data, we forecast current and future distribution of the horsetail milkweed. These deliverables are contained in this [Species Status Assessment (SSA)](main/SSA-Asclepias-subverticillata.md)

Some code described below is borrowed from Jeff Oliver [https://github.com/jcoliver/biodiversity-sdm-lesson](https://github.com/jcoliver/biodiversity-sdm-lesson).

## Dependencies
The following additional R packages are required (these will be installed by running the the setup script, `src/setup.R`):

+ spocc
+ sp
+ raster
+ maptools
+ rdgal
+ dismo
+ sf
+ tidyverse

## Structure
### SSA-Asclepias-subverticillata.md: Host Plant Information For Monarch (Danaus plexippus) Species Status Assessment
### data
  + **wc2-5**: climate data at 2.5 minute resolution from [WorldClim](http://www.worldclim.org) (_note_: this folder is not under version control, but will be created by running the setup script (`scripts/setup.R`))
  + **cmip5**: forcast climate data at 2.5 minute resolution from [WorldClim](http://www.worldclim.org). These data were originally downloaded from the WorldClim website, but stored in the `.RData` format for ease of use. The data are for the year 2070, based on the GFDL-ESM2G model with an RCP of 4.5 CO<sub>2</sub>. For an examination of different forecast models, see [McSweeney et al. 2015](https://link.springer.com/article/10.1007/s00382-014-2418-8).
  + **horsetail.csv**: data harvested from [GBIF](https://www.gbif.org/) and [iNaturalist](https://www.inaturalist.org) for _Asclepias subverticillata_. This dataset is not under version control, but will be harvested by running src/occuranceMap.R
### output (contents are not under version control): populated with maps when the scripts below are run.
### src: directory containing R scripts for gathering occurrence data, running forecast models, and creating map outputs.
  + **futureSpeciesDistributionModel.R**: contains the code that runs horsetail-future-sdm-single.R and produces the future species distribution model map
  + **horsetail-future-sdm-single.R**: contains the code that creates a future species distribution model map using projected climate data; to execute, run src/futureSpeciesDistributionModel.R
  + **horsetail-sdm-single.R**: contains the code that creates a current species distribution model map; to execute, run src/speciesDistributionModel.R
  + **occuranceMap.R**: contains the code that will create an occurence map using GBIF and iNaturalist data; run this script itself
  + **project.Rproj**: This code was created in a R project, the details of this are shown here.
  + **sdm-functions.R**: contains code that produces the species distribution models themselves; both horsetail-sdm-single.R and horsetail-future-sdm-single.R call on this file, no need to run on its own
  + **setup.R**: contains code that installs necessary packages and and downloads climate data. Run this script first
  + **speciesDistributionModel.R**: contains the code that runs horsetail-sdm-single.R and produces the current species distribution model map

## Running the code
Instructions to clone this repository, run the code, and replicate the output.
 1. Copy the URL to this Spidertail-Mapping Github repository by clicking on the green "Code" button above
 2. Clone the repository by opening a "New Project from Git Repository" in rstudio or rstudio.cloud and pasting the URL
 3. Run scripts in the src folder in the following order:
    1) setup.R
    2) occuranceMap.R (this creates the species occurence map)
    3) speciesDistributionModel.R (this creates a current species distribution model map)
    4) futureSpeciesDistributionModel.R (this creates a future species distribution model map)
 4. Browse the output folder for the three maps you just created
