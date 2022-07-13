<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<canvas id="canvas1" width="300px" height="300px"></canvas>
<canvas id="canvas2" width="300px" height="300px"></canvas>



<script src="https://rawgit.com/mrdoob/three.js/dev/build/three.js"></script>
<script src="https://rawgit.com/mrdoob/three.js/dev/examples/js/loaders/GLTFLoader.js"></script>

<script src="https://cdn.rawgit.com/takahirox/THREE.ZipLoader/v0.0.1/build/ziploader.min.js"></script>
<script src="https://unpkg.com/three@0.141.0/examples/js/controls/OrbitControls.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script>
var camera, scene, renderer;
var image;

init();
animate();

//add textureloader

function init() {

  renderer = new THREE.WebGLRenderer( {alpha: true});
	renderer.setSize(window.innerWidth/2, window.innerWidth/2); //handle pixel density stuff (currently being set in CSS
  // renderer.setPixelRatio( window.devicePixelRatio );
   renderer.setPixelRatio(2);
  // console.log(window.devicePixelRatio );
	document.body.appendChild( renderer.domElement );

	scene = new THREE.Scene();
  camera = new THREE.OrthographicCamera( -10, 10, 10,  -10, - 10, 10); 
  
	// camera.position.set( 0, 0, 0 );


	// controls = new THREE.OrbitControls( camera, document.getElementById("controller") );
	// controls.minDistance = 1;
    // controls.enablePan = false;
  // controls.enableZoom = false;
  // controls.minPolarAngle = 0;

    // image = document.createElement( 'img' );
   
  // document.body.appendChild( image );
  
//       image2 = document.createElement( 'img' );
   
//   document.body.appendChild( image2 );


    // var texture = new THREE.Texture( image );
  var texture = new THREE.TextureLoader().load( '<c:url value="/forthree/metausout.png"/>' );
    var texture2 = new THREE.TextureLoader().load( '<c:url value="/forthree/metausmiddle.png"/>' );
  // var texture = new THREE.SVGLoader().load( 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/39255/face.svg' );
  // texture.anisotropy = renderer.capabilities.getMaxAnisotropy();
  // texture.anisotropy = renderer.maxAnisotropy;
  // texture.magFilter = THREE.NearestFilter;
// texture.minFilter = THREE.LinearMipMapLinearFilter;
  
    // var texture2 = new THREE.Texture( image2 );
  
//     image.addEventListener( 'load', function ( event ) { texture.needsUpdate = true; } );
  
//       image2.addEventListener( 'load', function ( event ) { texture2.needsUpdate = true; } );

	var material = new THREE.MeshBasicMaterial( {
		map: texture
	} );
  
  	var material2 = new THREE.MeshBasicMaterial( {
		map: texture2
	} );
  material.transparent = true;
  material2.transparent = true;
    // material2.opacity = 0.5;
     // material.opacity = 0.5;
  
//   material2.map.transparent = true;
//   material2.map.opacity = 0.5;

	var geometry = new THREE.SphereGeometry(9.98, 50, 50 );
  mesh = new THREE.Mesh( geometry, material);
var geometry2 = new THREE.SphereGeometry( 10, 50, 50 );
   mesh2 = new THREE.Mesh( geometry2, material2);
	// scene.add( mesh );
   mesh2.rotation.y= -Math.PI/2;
    mesh.rotation.y= -Math.PI/2;
  scene.add( mesh2 );
  	scene.add( mesh );
}

function animate() {
	requestAnimationFrame( animate );
	render();
}

function render() {
	renderer.render( scene, camera );
  mesh2.rotation.y -=0.0009;
   mesh.rotation.y +=0.0009;
}

// image.crossOrigin = "anonymous";
// image2.crossOrigin = "";
// image.src = 'http://maxim.is/test/outer.svg';
// image2.src = 'https://s33.postimg.cc/rourh7anz/tester.png';
// image.src = 'https://s33.postimg.cc/kvuekp6xb/Artboard.png';

Math.radians = function(degrees) {
  return degrees * Math.PI / 180;
};

 var offset = $( "canvas" ).offset();

$( "old" ).on( "mousemove", function() {
  // pos = ((360*(event.pageX - window.innerWidth/2)/window.innerWidth)* Math.PI / 180) - Math.PI/2;
    pos = (((360*(event.pageX - window.innerWidth/2)/window.innerWidth)* Math.PI / 180)/2) - Math.PI/2;
  
   pos2 = ((360*(event.pageY - window.innerHeight/8)/window.innerHeight)* Math.PI / 180) - Math.PI/2;
  // pos = (event.pageX / 2 / window.innerWidth) - 0.5;
  // mesh.rotation.set(0, pos, 0); //add parallax here
 
  // mesh2.material.map.offset.set(-pos, 0);

  // mesh.material.map.offset.set(-pos/2, 0);

  mesh2.rotation.y=-pos - Math.PI;
    mesh.rotation.y=pos;
  // mesh2.rotation.x=-pos2;
   mesh2.rotation.x=pos2/10;
   mesh.rotation.x=pos2/10;
  
  
   // mesh.rotation.z=10;

});

 $(document).on("mousemove touchmove touchstart", function( e ) {

        e.preventDefault();

        var touchstart = e.type === 'touchstart' || e.type === 'touchmove',
            e = touchstart ? e.originalEvent : e,
            pageX = touchstart ? e.targetTouches[0].pageX : e.pageX,
            pageY = touchstart ? e.targetTouches[0].pageY : e.pageY;

     
    pos = (((360*(event.pageX - window.innerWidth/2)/window.innerWidth)* Math.PI / 180)/2) - Math.PI/2;
  
   pos2 = ((360*(event.pageY - window.innerHeight/8)/window.innerHeight)* Math.PI / 180) - Math.PI/2;
     
   mesh2.rotation.y=-pos - Math.PI;
    mesh.rotation.y=pos;

   mesh2.rotation.x=pos2/10;
   mesh.rotation.x=pos2/10;
 });
</script>


</body>
</html>