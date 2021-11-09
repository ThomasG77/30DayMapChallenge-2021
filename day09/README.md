# Day 9, monochrome

## Data

Get data

```
wget https://cadastre.data.gouv.fr/data/etalab-cadastre/2021-07-01/geojson/communes/44/44109/cadastre-44109-parcelles.json.gz
unp cadastre-44109-parcelles.json.gz
```

Conversion

```
ogr2ogr -f GPKG cadastre-44109-parcelles.gpkg -nln parcelles -t_srs "EPSG:2154" cadastre-44109-parcelles.json
```

## Manual operations

Style in QGIS project
Change HSL (0 to 359) every 10 except last value (359)
Export images

Combine to GIF with or keep them separated

```
convert -dispose previous -loop 0 -delay 100 $(ls *.png) monochromes.gif
```

