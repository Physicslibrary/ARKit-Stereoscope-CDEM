# ARKit-Stereoscope-CDEM (under construction)
Explore Canadian Digital Elevation Model with Blender, Gimp, and ARKit.

This project will show how to use Blender to make 3D meshes of GeoTIF files from Government of Canada:

https://open.canada.ca/data/en/dataset/7f245e4d-76c2-4caa-951a-45d1d2051333

On that webpage, select https://maps.canada.ca/czs/index-en.html to access "Geospatial-Data Extraction tool".

We will be using Thor Peak located in Auyuittuq National Park, Nunavut as an example. The mountain has a vertical drop of 1250m (google "thor peak" or "mount thor" to see images, especially images with people near the mountain to get a sense of scale).

1. Type "thor peak" for a location:

<img src="images/1.png" width="640">

2. As an example, zoom out until the Map Scale is 5km:

<img src="images/2.png" width="640">

3. Visualize CDEM:

<img src="images/3.png" width="640">

4. Select "Current Map Extent":

<img src="images/4.png" width="640">

<img src="images/5.png" width="640">

Make note of the dimensions of the map. In this case, 46.4km horizontal and 37.2km vertical (no built in tools, used a real ruler). 
The dimensions of the polygon coordinates may be useful (the first four pairs of number are the coordinates of the rectangle starting from the bottom left, going counterclockwise, the last pair of number is the same as the first).

Enter email address to get a zipped file. Unzip file, get folders and DEM.tif. DEM.tif will be used to displace a grid mesh in Blender. However, Blender 2.79b quits when reading DEM.tif as a texture.

DEM.tif looks fine in GIMP.

<img src="images/6.png" width="640">

Hard to see, navigate to "Colors", "Levels...", and "Auto Input Levels".

<img src="images/7.png" width="640">

Cancel "Levels". GIMP can also display metadata. Select "Image", "Metadata", and "View Metadata".

<img src="images/8.png" width="640">

Close (metadata may be useful in the future).

Select "File", "Export as...", and new file as DEM2.tif (for example).



Height map is hard to read so get a reference.

https://open.canada.ca/data/en/dataset/7f245e4d-76c2-4caa-951a-45d1d2051333

Press "View on Map" to get the Open Maps Data Viewer.


Thor Peak is about 1640m and Weasel River is at 120m.


In Blender, make a cube of dimensions 4km x 10m x 1520m and adjust the grid's Z dimension until it is about the same as the height of the cube.

Before.

After.







# Software

GIMP 2.10.8 (https://www.gimp.org/)<br>
Blender 2.79b (https://www.blender.org/)

# Hardware

# Credits

# References

https://en.wikipedia.org/wiki/GeoTIFF

https://en.wikipedia.org/wiki/Mount_Thor



