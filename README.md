# ARKit-Stereoscope-CDEM (under construction)
Explore Canadian Digital Elevation Model with Blender, Gimp, and ARKit.

This project will show how to use Blender to make 3D meshes of GeoTIF files from Government of Canada:

https://open.canada.ca/data/en/dataset/7f245e4d-76c2-4caa-951a-45d1d2051333

(This tutorial assumes users are familiar with Blender (www.blender.org, youtube, books) and shows some steps to make textured 3D mesh from GeoTIF.)

# Software

GIMP 2.10.8 (https://www.gimp.org/)<br>
Blender 2.79b (https://www.blender.org/)

# Hardware

# GeoTIF to 3D mesh

On the Government of Canada's webpage, select https://maps.canada.ca/czs/index-en.html to access "Geospatial-Data Extraction tool".

We will be using Thor Peak located in Auyuittuq National Park, Nunavut as an example. The mountain has a vertical drop of 1250m (google "thor peak" or "mount thor" to see images, especially images with people near the mountain to get a sense of scale).

1. Type "thor peak" for a location:

<img src="images/1.png" width="640">

2. Zoom out until the Map Scale is 5km:

<img src="images/2.png" width="640">

3. Visualize CDEM:

<img src="images/3.png" width="640">

4. Select "Current Map Extent":

<img src="images/4.png" width="640">

<img src="images/5.png" width="640">

Make note of the dimensions of the map. In this case, 46.4km horizontal and 37.2km vertical (no built in tools, used a real ruler). 
The dimensions of the polygon coordinates may be useful for computing the dimensions of the map instead (the first four pairs of number are coordinates of the rectangle starting from the bottom left, going counterclockwise, the last pair of number is the same as the first).

Enter email address to get a zipped file. Unzip file, get folders and DEM.tif. DEM.tif will be used to displace a grid mesh in Blender. However, Blender 2.79b quits when reading DEM.tif as a texture.

DEM.tif looks fine in GIMP.

<img src="images/6.png" width="640">

Hard to see, navigate to "Colors", "Levels...", and "Auto Input Levels".

<img src="images/7.png" width="640">

Cancel "Levels". GIMP can also display metadata. Select "Image", "Metadata", and "View Metadata".

<img src="images/8.png" width="640">

Close (metadata may be useful in the future).

Select "File", "Export as...", and new file as DEM2.tif.

Open Blender, on the top, set to "Cycles Render", on the right, set Units to "Kilometers", Length to "Metric", and Unit Scale to 1000. Add a grid and subdivide to 1024.

<img src="images/9.png" width="640">

<img src="images/10.png" width="640">

On the right, select Texture and open DEM2.tif and set "Image Mapping Extensions: Extend".

<img src="images/11.png" width="640">

Add Modifier Displace.

<img src="images/12.png" width="640">

Browse and select texture loaded earlier.

<img src="images/13.png" width="640">

In Modifier Displace, set Midlevel to 0, dimensions X = 46.4km, Y = 37.2km, and Z = 1km.

<img src="images/14.png" width="640">

Grey height map is hard to read so get a reference.

https://open.canada.ca/data/en/dataset/7f245e4d-76c2-4caa-951a-45d1d2051333

Press "View on Map" to get the Open Maps Data Viewer. Hide CDEM layer. Look for "thor peak".

<img src="images/15.png" width="640">

<img src="images/16.png" width="640">

<img src="images/17.png" width="640">

Thor Peak is about 1640m and Weasel River is at 120m.

<img src="images/18.png" width="640">

In Blender, make a cube of dimensions 4km x 10m x 1520m and adjust the grid's Z dimension until it is about the same as the height of the cube.

Before.

<img src="images/19.png" width="640">

After.

<img src="images/20.png" width="640">

Add a sun lamp to the scene and preview.

<img src="images/21.png" width="640">

Use shift-f in Blender to fly (WASD with mouse, mouse scroll wheel to change speed) around the mountain.

https://docs.blender.org/manual/en/latest/editors/3dview/navigate/walk_fly.html

Next is generate a texture map and decimate/export the 3D mesh as .obj file for iOS Swift Playgrounds.





# Credits

thor.obj and thor.png are created from geotiff files generated from:

https://maps.canada.ca/czs/index-en.html

https://www.canada.ca/en/transparency/terms.html

# References

https://en.wikipedia.org/wiki/GeoTIFF

https://en.wikipedia.org/wiki/Mount_Thor

https://johnflower.org/tutorial/make-mountains-blender-heightmaps

Thank to John for creating an excellent tutorial.<br><br>

Copyright (c) 2019 Hartwell Fong

