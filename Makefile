

# http://worldmap.harvard.edu/data/geonode:DSMW_RdY
# download the geosjon
#world-soils.geojson:
#	curl
#http://worldmap.harvard.edu/download/wfs/821/json?outputFormat=json&service=WFS&request=GetFeature&format_options=charset%3AUTF-8&typename=geonode%3ADSMW_RdY&version=1.0.0

	
worldsoils.topojson:
	topojson -o worldsoils.topojson worldsoils.json
	
worldsoilssample50.topojson:
	topojson -o worldsoilssample50.topojson --simplify-proportion 0.5 worldsoils.json

worldsoilssample25.topojson:
	topojson -o worldsoilsaample25.topojson --simplify-proportion 0.25 worldsoils.json

worldsoilssample5.topojson:
	topojson -o worldsoilsaample05.topojson --simplify-proportion 0.05 worldsoils.json

worldsoilsample1.topojson:
	topojson -o worldsoilsaample01.topojson --simplify-proportion 0.01 worldsoils.json

worldsoilsample2.topojson:
	topojson -o worldsoilssimple2.topojson \
	         --simplify-proportion 0.01  \
			 --projection mercator \
			 --width 1200 \
			 --height 700 \
			 worldsoils.json 

worldshp.json:
	ogr2ogr \
	  -f GeoJSON \
	  worldshp.json \
	  DSMW_RdY/DSMW_RdY.shp
	
all: worldsoils.topojson worldsoilssample50.topojson worldsoilssample25.topojson \
	worldsoilsample1.topojson worldsoilsample2.topojson