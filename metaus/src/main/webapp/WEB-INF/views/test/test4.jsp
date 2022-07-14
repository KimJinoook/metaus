<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp" %>


       <!-- ===== Start of Main Search Section ===== -->
    <section class="ptb120" style="height:92%; padding-top:50px; background:url(<c:url value='/forthree/indexTestBack.png'/>); padding-left:0px;">

        <!-- Start of Wrapper -->
        <div class="container wrapper" style="width:67%">


            <div class="col-md-7 col-xs-12 text-left" style="padding-left:0px; margin-left: 0px; padding-top:120px" >
                
                    <h1 class="text-black" style="font-size: 80px; font-family: fantasy;">Where the world builds MetaVerse</h1>
                	<br>

                <p class="text-black" style="font-family: 'Noto Sans KR'; font-size:22px; width:90%; text-align: justify;" >수많은 크리에이터들과 회사가 메타어스와 함께 가상세계를 구축합니다. 다양한 종류의 3D모델을 제공하며, 당신의 메타버스 진출을 지원합니다.</p>
                <br>
                <form class="job-search-form row" action="#" method="get">
                <!-- Start of category input -->
                <div class="col-md-7 col-sm-12 search-categories">
                    <label for="search-categories">Category</label>
                    <select name="search-categories" class="selectpicker" id="search-categories" data-live-search="true"  data-size="5" data-container="body">
                        <option value="1">기업의뢰 찾기</option>
                        <option value="2">크리에이터 찾기</option>
                    </select>
                </div>


                <!-- Start of submit input -->
                <div class="col-md-4 col-sm-12 search-submit">
                    <button type="submit" class="btn btn-blue btn-effect btn-large"><i class="fa fa-search"></i>search</button>
                </div>
				<br>
				</form>
                
                
            </div>


            <div id="canvas1" class="col-md-4 col-xs-12"  id="canvas1">
                
            </div>
                
        </div>
        <!-- End of Wrapper -->

    </section>
    <!-- ===== End of Main Search Section ===== -->

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
	//renderer.setSize(window.innerWidth/2, window.innerWidth/2); //handle pixel density stuff (currently being set in CSS
	renderer.setSize(550, 550); //handle pixel density stuff (currently being set in CSS
  // renderer.setPixelRatio( window.devicePixelRatio );
   renderer.setPixelRatio(2);
  // console.log(window.devicePixelRatio );
	document.querySelector('#canvas1').appendChild( renderer.domElement );


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


 <!-- ===== Start of Popular Categories Section ===== -->
    <section class="ptb80" id="categories3" style="background-color: white;">
        <div class="container">

            <div class="section-title">
                <h2>3D 모델 카테고리</h2>
            </div>

            <div class="row nomargin">
                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/accounting.svg" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="#">accountance</a>
                            <p>(9 open positions)</p>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->

                
                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/banking.svg" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="#">banking</a>
                            <p>(9 open positions)</p>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->

                
                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/design.svg" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="#">design & art</a>
                            <p>(36 open positions)</p>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->

                
                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/insurance.svg" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="#">insurance</a>
                            <p>(6 open positions)</p>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->
            </div>

            
            <div class="row nomargin">
                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/laptop.svg" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="#">IT engineer</a>
                            <p>(22 open positions)</p>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->

                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/healthcare.svg" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="#">healthcare</a>
                            <p>(14 open positions)</p>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->

                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/marketing.svg" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="#">marketing</a>
                            <p>(7 open positions)</p>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->

                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/management.svg" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="#">management</a>
                            <p>(4 open positions)</p>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->
            </div>

            <div class="col-md-12 mt60 text-center">
                <a href="<c:url value='/pd/pd'/>" class="btn btn-blue btn-effect nomargin">전체보기</a>
            </div>

        </div>
    </section>
    <!-- ===== End of Popular Categories Section ===== -->





    



<!-- ===== Start of Latest Job Section ===== -->
    <section class="search-jobs ptb80" id="version3">
        <div class="container">

            <div class="section-title">
                <h2>latest jobs</h2>
            </div>

            <!-- Start of Row -->
            <div class="row">

                <!-- Start of Job Post Main -->
                <div class="col-md-12 job-post-main">

                    <!-- Start of Job Post Wrapper -->
                    <div class="job-post-wrapper mt20">

                        <!-- ===== Start of Single Job Post 1 ===== -->
                        <div class="single-job-post row shadow-hover">
                            <!-- Job Company -->
                            <div class="col-md-2 col-xs-3">
                                <div class="job-company">
                                    <a href="#">
                                        <img src="images/companies/envato.svg" alt="">
                                    </a>
                                </div>
                            </div>

                            <!-- Job Title & Info -->
                            <div class="col-md-8 col-xs-6 ptb20">
                                <div class="job-title">
                                    <a href="job-page.html">php senior developer</a>
                                </div>

                                <div class="job-info">
                                    <span class="company"><i class="fa fa-building-o"></i>Envato</span>
                                    <span class="location"><i class="fa fa-map-marker"></i>Melbourn, Australia</span>
                                </div>
                            </div>

                            <!-- Job Category -->
                            <div class="col-md-2 col-xs-3 ptb30">
                                <div class="job-category">
                                    <a href="javascript:void(0)" class="btn btn-green btn-small btn-effect">full time</a>
                                </div>
                            </div>
                        </div>
                        <!-- ===== End of Single Job Post 1 ===== -->


                        <!-- ===== Start of Single Job Post 2 ===== -->
                        <div class="single-job-post row shadow-hover mt30">
                            <!-- Job Company -->
                            <div class="col-md-2 col-xs-3">
                                <div class="job-company">
                                    <a href="#">
                                        <img src="images/companies/google.svg" alt="">
                                    </a>
                                </div>
                            </div>

                            <!-- Job Title & Info -->
                            <div class="col-md-8 col-xs-6 ptb20">
                                <div class="job-title">
                                    <a href="#">department head</a>
                                </div>

                                <div class="job-info">
                                    <span class="company"><i class="fa fa-building-o"></i>Google</span>
                                    <span class="location"><i class="fa fa-map-marker"></i>Berlin, Germany</span>
                                </div>
                            </div>

                            <!-- Job Category -->
                            <div class="col-md-2 col-xs-3 ptb30">
                                <div class="job-category">
                                    <a href="javascript:void(0)" class="btn btn-purple btn-small btn-effect">part time</a>
                                </div>
                            </div>
                        </div>
                        <!-- ===== End of Single Job Post 2 ===== -->


                        <!-- ===== Start of Single Job Post 3 ===== -->
                        <div class="single-job-post row shadow-hover mt30">
                            <!-- Job Company -->
                            <div class="col-md-2 col-xs-3">
                                <div class="job-company">
                                    <a href="#">
                                        <img src="images/companies/facebook.svg" alt="">
                                    </a>
                                </div>
                            </div>

                            <!-- Job Title & Info -->
                            <div class="col-md-8 col-xs-6 ptb20">
                                <div class="job-title">
                                    <a href="#">graphic designer</a>
                                </div>

                                <div class="job-info">
                                    <span class="company"><i class="fa fa-building-o"></i>Facebook</span>
                                    <span class="location"><i class="fa fa-map-marker"></i>london, uk</span>
                                </div>
                            </div>

                            <!-- Job Category -->
                            <div class="col-md-2 col-xs-3 ptb30">
                                <div class="job-category">
                                    <a href="javascript:void(0)" class="btn btn-blue btn-small btn-effect">freelancer</a>
                                </div>
                            </div>
                        </div>
                        <!-- ===== End of Single Job Post 3 ===== -->


                        <!-- ===== Start of Single Job Post 4 ===== -->
                        <div class="single-job-post row shadow-hover mt30">
                            <!-- Job Company -->
                            <div class="col-md-2 col-xs-3">
                                <div class="job-company">
                                    <a href="#">
                                        <img src="images/companies/envato.svg" alt="">
                                    </a>
                                </div>
                            </div>

                            <!-- Job Title & Info -->
                            <div class="col-md-8 col-xs-6 ptb20">
                                <div class="job-title">
                                    <a href="#">senior UI & UX designer</a>
                                </div>

                                <div class="job-info">
                                    <span class="company"><i class="fa fa-building-o"></i>Envato</span>
                                    <span class="location"><i class="fa fa-map-marker"></i>Melbourn, Australia</span>
                                </div>
                            </div>

                            <!-- Job Category -->
                            <div class="col-md-2 col-xs-3 ptb30">
                                <div class="job-category">
                                    <a href="javascript:void(0)" class="btn btn-orange btn-small btn-effect">intership</a>
                                </div>
                            </div>
                        </div>
                        <!-- ===== End of Single Job Post 4 ===== -->


                        <!-- ===== Start of Single Job Post 5 ===== -->
                        <div class="single-job-post row shadow-hover mt30">
                            <!-- Job Company -->
                            <div class="col-md-2 col-xs-3">
                                <div class="job-company">
                                    <a href="#">
                                        <img src="images/companies/twitter.svg" alt="">
                                    </a>
                                </div>
                            </div>

                            <!-- Job Title & Info -->
                            <div class="col-md-8 col-xs-6 ptb20">
                                <div class="job-title">
                                    <a href="#">senior health advisor</a>
                                </div>

                                <div class="job-info">
                                    <span class="company"><i class="fa fa-building-o"></i>twitter</span>
                                    <span class="location"><i class="fa fa-map-marker"></i>New York, USA</span>
                                </div>
                            </div>

                            <!-- Job Category -->
                            <div class="col-md-2 col-xs-3 ptb30">
                                <div class="job-category">
                                    <a href="javascript:void(0)" class="btn btn-red btn-small btn-effect">temporary</a>
                                </div>
                            </div>
                        </div>
                        <!-- ===== End of Single Job Post 5 ===== -->

                    </div>
                    <!-- End of Job Post Wrapper -->

                    <!-- Start of Pagination -->
                    <div class="col-md-12 text-center mt40">
                        <a href="search-jobs-3.html" class="btn btn-blue btn-effect">show more</a>
                    </div>
                    <!-- End of Pagination -->

                </div>
                <!-- End of Job Post Main -->

            </div>
            <!-- End of Row -->

        </div>
    </section>
    <!-- ===== End of Latest Job Section ===== -->




    <!-- ===== Start of CountUp Section ===== -->
    <section class="ptb40" id="countup">
        <div class="container">

            <!-- 1st Count up item -->
            <div class="col-md-3 col-sm-3 col-xs-12">
                <span class="counter" data-from="0" data-to="743"></span>
                <h4>members</h4>
            </div>

            <!-- 2nd Count up item -->
            <div class="col-md-3 col-sm-3 col-xs-12">
                <span class="counter" data-from="0" data-to="579"></span>
                <h4>jobs</h4>
            </div>

            <!-- 3rd Count up item -->
            <div class="col-md-3 col-sm-3 col-xs-12">
                <span class="counter" data-from="0" data-to="251"></span>
                <h4>resumes</h4>
            </div>

            <!-- 4th Count up item -->
            <div class="col-md-3 col-sm-3 col-xs-12">
                <span class="counter" data-from="0" data-to="330"></span>
                <h4>companies</h4>
            </div>

        </div>
    </section>
    <!-- ===== End of CountUp Section ===== -->







<%@ include file="../inc/footer.jsp" %>