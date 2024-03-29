# Host Plant Information For Monarch (*Danaus plexippus*) Species Status Assessment
## Southwest Milkweed Range Map With Forecast
### Christopher Olson, Dharma Hoy, Roland Berg, and Sammy Kutsch

### Host Plant Species: Horsetail Milkweed (*Asclepias subverticillata*)

### Species Taxonomy
Class: Magnoliopsida

Order: Gentianales

Family: Apocynaceae

Genus: Asclepias

Species: *Asclepias subverticillata*

### Horsetail Milkweed Life History and Ecology
 Found in "sandy or rocky plains and desert flats and slopes; common along roadsides" (wildflower.org) and "disturbed areas, ditches, and streams" (xerces.org). *A. subverticillata* does well in dry, well draining areas, and are resistant to draught once established. Horsetail milkweed is "is a larval food plant for both [Queen and Monarch butterflies]. It is also visited by wasps, such as the tarantula hawk" (desertmuseum.org). This species of milkweed is particularly poisonous to livestock like horses because it contains a neurotoxin. Flowers near grazing pasture are therefore commonly removed with herbicides.

## Project Archive: [ZENODO DOI](https://zenodo.org/record/6480435#.YmhI7y2z1QJ)
## Project Repository: [Spidertail-Mapping](https://github.com/BiodiversityDataScienceCorp/Spidertail-Mapping)

## Data
### Data Sources for Occurence and Distribution Modeling
 Our data was pulled from GBIF and iNaturalist, two sources that allow for data to be crowdsourced and accessed by anyone interested in using it for analysis. Github is a database that allows for researchers from around the world to upload their data for use in other projects, while iNaturalist contains mostly citizen sighting recordings.
 The climate data used for the Species Distribution Model and Species Forecast Model are from [WorldClim](http://www.worldclim.org)
### Data Query and Cleaning Process
We queried our data with the following initial argument: occ(query='Asclepias subverticillata', from=c('gbif','inat'), limit=5000). We queried both gbif and inaturalist, and included all data instead of filtering for a certain time frame to maximize the number of occurences for our maps.
In our data cleaning process we removed any data from the data set for which the occurrence status equaled absent, data where the occurrence number equaled 0, and data where the location data (latitude/longitude) is not provided. We combined the data from two sources after cleaning.

## Species Occurrence Map
![Map of Occurences of Horsetail Milkweed across the Southwestern United States and Mexico](output/OccuranceMap.jpg)

## Species Distribution Modeling
The map below shows current species occurrence data in the North American southwest, as well as a prediction of species distribution based on current climate data. In other words, all regions in black are areas with environmental conditions that are suitable for horsetail milkweeds. The red dots show locations where milkweeds have actually been found
### Methods
This map was created with the help of Jeff Oliver and Jeremy McWilliams. We followed along with their demonstrations of how to create a species distribution model, and then created our own.
![Map of Predicted Current Horsetail Distribution](output/horsetail-single-current-sdm.jpg)

## Species Distribution Forecast Estimation
 The map below shows current species occurrence data in the North American southwest, and predicts future species distribution based on climate forecast models. These climate models predict that the regions in black are areas that will have environmental conditions suitable for horsetail milkweeds in (What year?).
### Climate Data
 The climate data used was tied to the WorldClim package used for creating our model. This r package uses spatially interpolated gridded data from 1950 to 2000, along with paleo climate data. It also incorporates monthly open-source weather station data. The data provided is primarily monthly total precipitation, monthly mean temperature, monthly mean maximum and minimum temperatures, and 19 other derived bioclimatic variables used for ecological niche modeling.
### Methods
This map was created with the help of Jeff Oliver and Jeremy McWilliams. We followed along with their demonstrations of how to create a species distribution model, and then created our own.
![Map of Predicted Horsetail Distirbution Under and Average Future Climate Model](output/horsetail-single-future-sdm.jpg)

## Summary of Findings
 The current and future species distribution models (SDMs) above paint a picture of how horsetail milkweed habitats will change over time. In general, they predict that habitat will shrink and move north and west. In the current SDM, occurrences (red dots) and suitable habitat (black regions) almost entirely overlap. In the future SDM, many occurrences no longer overlap with predicted suitable habitat. Therefore according to our model, at least some populations will not survive changing climate conditions in their current locations. Similarly, our model predicts that areas that were once inhospitable to horesetails milkweed will be become potential habitat in the future.

In Arizona specifically, our model predicts that horsetail milkweed habitat will shrink somewhat in the NW, grow somewhat in the NE, and shrink dramatically in the SE.

In general, the implications for Monarch butterflies and their conservation are straightforward. Given that Monarch larvae rely on milkweed for habitat, Monarch distributions and population levels will change as milkweeed populations change. Horsetail milkweed does well in dry climates and drought prone areas, and so it important to consider as a tool as climates generally become drier.

## References:
Integrated Taxonomic Information System. [itis.gov](https://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=30308#null)

Lady Bird Johnson Wildflower Center. [wildflower.org](https://www.wildflower.org/plants/result.php?id_plant=ASSU2)

"WorldClim". The Climate Workspace. [glisaclimate.org](https://glisaclimate.org/resource/worldclim)

Xerces Society. [xerces.org](https://www.xerces.org/sites/default/files/publications/19-017.pdf)

New Mexico State University. [aces.nmsu.edu](https://aces.nmsu.edu/pubs/_b/B709/welcome.html)
