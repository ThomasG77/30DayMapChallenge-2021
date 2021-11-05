# "Le miel et les abeilles": les ruches en France métropolitaine

Day 4 of #30DayMapChallenge

We made proportiona hexagons instead of circle. We used a SVG symbol

My SVG can be set only by width or height. Width is the equivalent of Vertex to Vertex https://hexagoncalculator.apphb.com

We borrowed code from above link with exact code https://github.com/willegetz/hexcalc/blob/master/MvcApplication1/Scripts/Custom/HexCalcs.js


JS (Area to Vertex to Vertex)

    Math.sqrt(2 * 5000) * Math.sqrt(Math.sqrt(3)) / 3 * 2

QGIS (Area to Vertex to Vertex)

    sqrt(2 * "tot_ruches") * sqrt(sqrt(3)) / 3 * 2

Then, we apply proportional calculation to resize to lower size the hexagons.

## QGIS project

[ruches-abeilles-2016.qgz](ruches-abeilles-2016.qgz)

## Dataset

Data extracted from PDF `Stat_apiculture-1.pdf` using Excalibur https://excalibur-py.readthedocs.io/en/master/ (because there was the count of beehives instead of bee colony). I was unable to find out exactly where I retrieved it (some months ago...)

We then processed the files using ruches.ipynb (Jupyter Notebook).

You can also look at data from https://www.mesdemarches.agriculture.gouv.fr/demarches/particulier/effectuer-une-declaration-55/article/declarer-des-ruches?id_rubrique=55 (French speaking page)

## Credits image

https://fr.m.wikipedia.org/wiki/Fichier:Regular_hexagon.svg
Compass generator https://watabou.itch.io/compass-rose-generator

Unused images:

https://www.publicdomainpictures.net/fr/view-image.php?image=358291&picture=fond-de-nid-d39abeille-ruche-miel
https://commons.wikimedia.org/wiki/File:Revisando_las_larvas_de_una_colmenas.jpg
https://commons.wikimedia.org/wiki/File:Newlands_bees_019.JPG

**Caution**: we had some remaining files from a first project
