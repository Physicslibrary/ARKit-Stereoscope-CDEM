/*

ARKit-Stereoscope-CDEM

https://physicslibrary.github.io/ARKit-Stereoscope-CDEM/
 
MIT License

Copyright (c) 2019 Hartwell Fong

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.



Apr 29, 2019.

Explore Canadian Digital Elevation Model with Blender, GIMP, and ARKit.

Hardware:

Tested on Apple 2018 9.7" iPad (A9 CPU or higher for ARKit)

The OWL Stereoscope Viewer is from The London Stereoscopic Ltd
 
https://www.londonstereo.com

Thank to Dr. Brian May for developing an amazingly simple tool that can be used with the 9.7" iPad.

Software:
 
Apple iOS Swift Playgrounds 3.0
ARKit and SceneKit (set up scene, read 3D files, attact a virtual camera for lefteye to ARKit iPad 
camera righteye to make a stereoscope, 6DOF tracking).

https://www.apple.com/ca/swift/playgrounds/

If frame rate < 60Hz, hold iPad still, press HOME button, return to Swift Playgrounds.

This playground doesn't look for a flat plane to put virtual objects on, instead the initial position 
of the iPad is the world origin when "Run My Code" is pressed.

All virtual objects are positioned and oriented according to this world origin (with righteye.debugOptions on, 
the world origin is an XYZ or RGB axis)
 
Credits
thor_peak.obj and thor_peak.png were computed from GeoTIFF files generated from the 
Government of Canada https://maps.canada.ca/index-en.html

TychoSkymap.t5_04096x02048.jpg
NASA/Goddard Space Flight Center Scientific Visualization Studio
https://svs.gsfc.nasa.gov/3572

*/

import ARKit
import PlaygroundSupport

var righteye = ARSCNView()
righteye.scene = SCNScene()
righteye.scene.background.contents = UIImage(named: "TychoSkymapII.t5_04096x02048.jpg")
righteye.showsStatistics = true
righteye.automaticallyUpdatesLighting = false
righteye.autoenablesDefaultLighting = false

var lefteye = SCNView()
lefteye.scene = righteye.scene
lefteye.showsStatistics = true
lefteye.autoenablesDefaultLighting = false

let config = ARWorldTrackingConfiguration()
righteye.session.run(config)

/*
 righteye.debugOptions = [
 ARSCNDebugOptions.showFeaturePoints,
 ARSCNDebugOptions.showWorldOrigin
 ]*/    // comment out to turn off

var box = SCNScene(named: "thor_peak.obj")!
let node = box.rootNode.childNodes[0]
node.position = SCNVector3(x: 0, y: -1, z: 0)
node.eulerAngles = SCNVector3(0, 0, 0)
let size = 1
node.scale = SCNVector3(size, size, size)
righteye.scene.rootNode.addChildNode(node)

let material = node.geometry?.firstMaterial
material?.emission.contents = UIImage(named: "thor_peak.png")

// to see wireframe, comment out the two lines above and uncomment the three lines below
/*
node.geometry?.firstMaterial?.fillMode = .lines
node.geometry?.firstMaterial?.emission.contents = UIColor.white
node.geometry?.firstMaterial?.isDoubleSided = true
 */

var ipd = -0.064 // interpupillary distance (meter)
var cameraNode = SCNNode()
let camera = SCNCamera()  // make a camera for left eye
camera.xFov = 39  // camera.* depends on righteye.frame
camera.yFov = 50
camera.zFar = 1000
camera.zNear = 0.01
cameraNode.camera = camera
cameraNode.position = SCNVector3(ipd,0,0)
righteye.pointOfView?.addChildNode(cameraNode)

lefteye.pointOfView = cameraNode

lefteye.isPlaying = true

var imageView = UIImageView()

lefteye.frame = CGRect(x: 0, y: 0, width: 344, height: 380
)
imageView.addSubview(lefteye)

righteye.frame = CGRect(x: 344, y: 0, width: 344, height: 380)
imageView.addSubview(righteye)

PlaygroundPage.current.wantsFullScreenLiveView = true
PlaygroundPage.current.liveView = imageView

// in last line, change imageview to righteye for one view (no stereoscope)


