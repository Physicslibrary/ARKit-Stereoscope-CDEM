# ARKit-Stereoscope-CDEM

Explore Canadian Digital Elevation Model with Blender, Gimp, and ARKit.

<img src="images/0.jpg" width="640">

This project shows how to use Blender to make 3D meshes of GeoTIF files from the Government of Canada:

https://open.canada.ca/data/en/dataset/7f245e4d-76c2-4caa-951a-45d1d2051333

(This tutorial assumes users are familiar with Blender (www.blender.org, youtube, books) and shows some steps to make textured 3D mesh from GeoTIF.)

# Hardware

Tested on Apple 2018 9.7" iPad (A9 CPU or higher for ARKit).

The OWL Stereoscopic Viewer(£15.00) from [The London Stereoscopic Company Ltd](https://www.londonstereo.com/)

In addition to viewing 3D models with 6DOF tracking, it can also be used in a browser to view stereoscopic images from [Library of Congress](http://www.loc.gov/pictures/collection/stereo/) or [New York Public Library](https://stereo.nypl.org/).

For more current images, [London Stereoscopic Company Ltd](https://www.londonstereo.com/3-D-gallery1.html).
   
<img src="images/owl-viewer.jpg" width="640">

It is advisable to get a protective silicon case for the iPad to minimize the stereoscope sliding on the screen. The stereoscopic viewer is held in place by the user to allow switching between viewing and programming Playgrounds. With "Portrait Orientation Lock" on, this should be the most comfortable position to hold the iPad with the viewer and looking around virtual objects.

# Software

Apple iOS Swift Playgrounds 3.0.

Swift Playgrounds lets kids ages >4 program their iPad directly to experiment with ARKit and Scenekit.

Go to https://github.com/Physicslibrary/ARKit-Stereoscope-Hipparcos for more info on "Enable Results".

GIMP 2.10.8 (optional) (https://www.gimp.org/)<br>

Blender 2.79b (optional) (https://www.blender.org/)

Note - GIMP and Blender are not available on iOS. They are used on other platforms to create content for Playgrounds.

# Installation

With Swift Playgrounds 3.0 update, the file structure has changed from 2.2.

To keep things simple, a source file learn.swift is available for pasting into Playgrounds. Resources for the program will either be made available or links provided.

Unzip thor_peak.zip in Apple Files app or a third-party file manager (eg. GoodReader).

Open a new "Blank" template in iOS Swift Playgrounds. Copy and paste the texts of learn.swift.

Press "+" on upper right and select the third icon (folded paper). Insert thor_peak.obj, thor_peak.png, and TychoSkymap.t5_04096x02048.jpg.

Before "Run My Code", turn off "Enable Results".

Note - The orientation of Tycho Catalog Skymap has NOT been adjusted for viewing at Auyuittuq National Park.

# GeoTIF to 3D mesh tutorial

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

Measure the dimensions of the map. In this case, 46.4km horizontal and 37.2km vertical (no built in tools, used a real ruler). 
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

In Modifier Displace, set Midlevel to 0, dimensions X = 46.4km, Y = 37.2km, Z = 1km, and "View Clip: Start: 1m End: 100km".

<img src="images/14.png" width="640">

Grey height map is hard to read so get a reference.

https://open.canada.ca/data/en/dataset/7f245e4d-76c2-4caa-951a-45d1d2051333

Press "View on Map" to get the Open Maps Data Viewer. Hide CDEM layer. Look for "thor peak".

<img src="images/15.png" width="640">

<img src="images/16.png" width="640">

<img src="images/17.png" width="640">

Thor Peak is ~1640m and Weasel River is ~120m.

<img src="images/18.png" width="640">

In Blender, add a mesh cube of dimensions 4km x 10m x 1520m and adjust Grid's Z dimension until it is about the same as the height as Cube.

Before.

<img src="images/19.png" width="640">

After.

<img src="images/20.png" width="640">

Add a sun lamp to the scene and preview.

<img src="images/21.png" width="640">

Use shift-f in Blender to fly (WASD with mouse, mouse scroll wheel to change speed) around the mountain.

https://docs.blender.org/manual/en/latest/editors/3dview/navigate/walk_fly.html

Can stop here without going further as Blender can be used to view the mountain. The 3D grid can be exported to an .obj file for use in other programs such as iOS Swift Playgrounds, Unity, or Unreal. However, the exported file will be ~100MB which will not work for mobile app Swift Playgrounds.

Next is generate a texture map (from a high-poly mesh) and decimate/export the high-poly mesh to a low-poly mesh.

Orient the mountain so the user is at a certain position facing a certain direction (on a river facing Thor Peak). One way to do this is add Cube.001 at (0,0,0) and then adjust Grid until Cube.001 is at a specific position and orientation (direction of Cube.001 green arrow).

<img src="images/22.png" width="640">

<img src="images/23.png" width="640">

(Note - in Playgrounds, the position is correct but orientation is not, probably need to know how Blender export objects and how Scenekit read them)

Create a new view to "UV/Image Editor" and make a new 2048x2048 image called thor.

<img src="images/24.png" width="640">

Select the Grid and enter "Edit Mode".

<img src="images/25.png" width="640">

"UV Unwrap", "Project from View", and back to "Object Mode".

<img src="images/26.png" width="640">

<img src="images/27.png" width="640">

<img src="images/28.png" width="640">

Switch a view to "Node Editor", add a new material, add a new image texture, and set image texture to thor.

<img src="images/29.png" width="640">

<img src="images/30.png" width="640">

<img src="images/31.png" width="640">

Bake image texture of selected object.

<img src="images/32.png" width="640">

<img src="images/33.png" width="640">

Save texture as thor_peak.png.

<img src="images/34.png" width="640">

Next is to reduce size of Grid ~1M vertices. On the right, select "Modifiers" and "Decimate".

<img src="images/35.png" width="640">

<img src="images/36.png" width="640">

Change Ratio from 1.0 to 0.05. The result is a mesh ~52k vertices.

<img src="images/37.png" width="640">

Export to thor_peak.obj. File thor_peak.obj ~11MB (Note - Ratio=0.1 ~22MB file but didn't work well with Playgrounds)

<img src="images/38.png" width="160">


# Credits

thor_peak.obj and thor_peak.png were created from GeoTIFF files generated from:

https://maps.canada.ca/czs/index-en.html

https://www.canada.ca/en/transparency/terms.html

TychoSkymap.t5_04096x02048.jpg<br>
NASA/Goddard Space Flight Center Scientific Visualization Studio<br>
https://svs.gsfc.nasa.gov/3572

# References

https://en.wikipedia.org/wiki/GeoTIFF

https://en.wikipedia.org/wiki/Mount_Thor

https://johnflower.org/tutorial/make-mountains-blender-heightmaps

Thank to John Flower for creating an excellent tutorial.

Youtube on Blender.

https://www.youtube.com/watch?v=sB09T--_ZvU

https://www.youtube.com/watch?v=0r-cGjVKvGw

<br>
Copyright (c) 2019 Hartwell Fong

