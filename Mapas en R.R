library(readr)
library(rnaturalearth)
library(sf)
library(ggplot2)
library(viridis)
library(patchwork)
library(elevatr)
library(raster)
library(terra)
library(chirps)
library(pacman)


map1 <- ne_countries(type = "countries", country = "Mexico", scale = "medium", returnclass = "sf")
map2 <- ne_states("Mexico", returnclass = "sf")
p1 <- ggplot(map1) + geom_sf()
p2 <- ggplot(map2) + geom_sf()
p1 + p2



map <- ne_countries(type = "countries", country = "Mexico", scale = "medium", returnclass = "sf")
d <- get_elev_raster(locations = map, z = 9, clip = "locations")
terra::plot(rast(d), plg = list(title = "Elevación (m)"))

 
location <- data.frame(long = -96.7236500, lat = 17.0654200)
d <- get_chirps(location, dates = c("2022-01-01", "2022-12-31"), server = "ClimateSERV")
ggplot(d, aes(x = date, y = chirps)) + geom_line() + labs(y = "Precipitacion (mm)")





Datos_cercas <- read_csv("Datos cercas.csv")

crs_dd <- 4326

examp_sf <- sf::st_as_sf(Datos_cercas, coords = c("Y", "X"), crs = crs_dd)

df_elev_epqs <- get_elev_point(examp_sf, prj = crs_dd, src = "epqs")
df_elev_epqs


elevation_df <- get_elev_raster(examp_sf, prj = crs_dd, z = 13)

plot(elevation_df)

plot(examp_sf, add = TRUE, col = "black", pch = 19, max.plot = 1)

writeRaster(elevation_df,'datos_1.tif',options=c('TFW=YES'))





Datos_lejos <- read_csv("Datos lejos.csv")

crs_dd <- 4326

examp_sf2 <- sf::st_as_sf(Datos_lejos, coords = c("Y", "X"), crs = crs_dd)

df_elev_epqs <- get_elev_point(examp_sf2, prj = crs_dd, src = "epqs")
df_elev_epqs


elevation_df2 <- get_elev_raster(examp_sf2, prj = crs_dd, z = 13)

plot(elevation_df2)

plot(examp_sf2, add = TRUE, col = "black", pch = 19, max.plot = 1)

writeRaster(elevation_df2,'datos_2.tif',options=c('TFW=YES'))



pacman::p_load(sf,raster)

ras=raster('C:/Users/PC/Downloads/para mate/Oaxaca_r15m.tif')
area=read_sf('C:/Users/PC/Downloads/para mate/Shapes/Shapefile - Estados/OAXACA.shp')

area_cor=ras%>% crop(area) %>% mask(area)

plot(area_cor)

writeRaster(area_cor,'area_cor.tif',options=c('TFW=YES'))


ras2=raster('C:/Users/PC/Downloads/para mate/Shapes/bio4/bio4/Geotiff/bio4.tif')

area_cor2=ras2%>% crop(area) %>% mask(area)

plot(area_cor2)


writeRaster(area_cor2,'area_cor2.tif',options=c('TFW=YES'))


ras3=raster('C:/Users/PC/Downloads/para mate/Shapes/bio13/bio13/Geotiff/bio13.tif')

area_cor3=ras3%>% crop(area) %>% mask(area)

plot(area_cor3)

writeRaster(area_cor3,'area_cor3.tif',options=c('TFW=YES'))




ras4=raster('C:/Users/PC/Downloads/para mate/Shapes/MesOcurreTmax/MesOcurreTmax/Geotiff/MesOcurreTmax.tif')

area_cor4=ras4%>% crop(area) %>% mask(area)

plot(area_cor4)


writeRaster(area_cor4,'area_cor4.tif',options=c('TFW=YES'))



ras5=raster('C:/Users/PC/Downloads/para mate/Shapes/MPIECHAM5B2_50prec_12/MPIECHAM5B2_50prec_12/Geotiff/MPIECHAM5B2_50prec_12.tif')

area_cor5=ras5%>% crop(area) %>% mask(area)

plot(area_cor5)


writeRaster(area_cor5,'area_cor5.tif',options=c('TFW=YES'))





ras6=raster('C:/Users/PC/Downloads/para mate/Shapes/TempMinExtrAbs/TempMinExtAbs/Geotiff/TempMinExtAbs.tif')

area_cor6=ras6%>% crop(area) %>% mask(area)

plot(area_cor6)


writeRaster(area_cor6,'area_cor6.tif',options=c('TFW=YES'))










