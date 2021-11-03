# Berlin wall

## Data

Berlin wall data visible at https://www.openstreetmap.org/relation/6651797#map=13/52.5701/13.3760

To convert to GeoJSON, do the following (you need to do `npm i query-overpass -g` and need Node.js):

    echo 'relation(6651797);(._;>>;);out;' | query-overpass >| berlin-wall.geojson

Add WMS background from https://isk.geobasis-bb.de/mapproxy/dop20c_sentinel/service/wms in QGIS

## In QGIS

QGIS project in `berlin-old-delimitations.qgz` file

Edited the GeoJSON data to "Merge selected features" and get only one line

    ffmpeg -framerate 1 -pattern_type glob -i '*.png' -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -c:v libx264 -pix_fmt yuv420p -r 25 out.mp4

Video at https://youtu.be/7w1zmde3w6w
