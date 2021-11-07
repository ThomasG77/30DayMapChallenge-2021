

wget https://planet.openstreetmap.org/pbf/planet-latest.osm.pbf.torrent
aria2c -x 4 planet-latest.osm.pbf.torrent

osmium tags-filter -o planet-latest-fire-hydrant.osm.pbf planet-latest.osm.pbf n/emergency=fire_hydrant
osmium tags-filter -o planet-latest-amenity-fire-station.osm.pbf planet-211101.osm.pbf /amenity=fire_station
