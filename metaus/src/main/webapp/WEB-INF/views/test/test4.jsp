<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp" %>

<section class="main overlay-black" style="height:90%">

        <!-- Start of Wrapper -->
        <div class="container wrapper">
            <h1 class="capitalize text-center text-white">your career starts now</h1>

            <!-- Start of Form -->
            <form class="job-search-form row pt40" action="#" method="get">

                <!-- Start of keywords input -->
                <div class="col-md-3 col-sm-12 search-keywords">
                    <label for="search-keywords">Keywords</label>
                    <input type="text" name="search-keywords" id="search-keywords" placeholder="Keywords">
                </div>

                <!-- Start of category input -->
                <div class="col-md-3 col-sm-12 search-categories">
                    <label for="search-categories">Category</label>
                    <select name="search-categories" class="selectpicker" id="search-categories" data-live-search="true" title="Any Category" data-size="5" data-container="body">
                        <option value="1">Accountance</option>
                        <option value="2">Banking</option>
                        <option value="3">Design & Art</option>
                        <option value="4">Developement</option>
                        <option value="5">Insurance</option>
                        <option value="6">IT Engineer</option>
                        <option value="7">Healthcare</option>
                        <option value="8">Marketing</option>
                        <option value="9">Management</option>
                    </select>
                </div>

                <!-- Start of location input -->
                <div class="col-md-4 col-sm-12 search-location">
                    <label for="search-location">Location</label>
                    <input type="text" name="search-location" id="search-location" placeholder="Location">
                </div>

                <!-- Start of submit input -->
                <div class="col-md-2 col-sm-12 search-submit">
                    <button type="submit" class="btn btn-blue btn-effect btn-large"><i class="fa fa-search"></i>search</button>
                </div>

            </form>
            <!-- End of Form -->

            <div class="extra-info pt20">
                <span class="text-left text-white"><b>36</b> job offers for <b>you.</b></span>
                <a href="#" class="capitalize pull-right text-white">advanced search</a>
            </div>
			
        </div>
<div id="canvas1" style="z-index: 0;position:relative;" >
                           <!-- <img class="img-fluid" src="img/hero.png" alt=""> -->
                     </div>
        <!-- End of Wrapper -->

    </section>

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
<section class="ptb80" id="categories">
    <div class="container">

        <div class="section-title">
            <h2>What is Meta Us? &nbsp; </h2>
        </div>

        <div class="row nomargin">
            <!-- Start of Category div -->
            <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                <div class="category ptb30">

                    <!-- Icon -->
                    <div class="category-icon">
                        <i class="fa fa-line-chart"></i>
                    </div>

                    <!-- Category Info - Title -->
                    <div class="category-info pt30">
                        <a href="#">업무 향상성</a>

                    </div>

                    <!-- Category Description -->
                    <div class="category-descr">
                        <span>빠르고 간편하지만 효율성을 놓치는 법이 없습니다.</span>
                    </div>

                </div>
            </div>
            <!-- End of Category div -->

            <!-- Start of Category div -->
            <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                <div class="category ptb30">

                    <!-- Icon -->
                    <div class="category-icon">
                        <i class="fa fa-university"></i>
                    </div>

                    <!-- Category Info - Title -->
                    <div class="category-info pt30">
                        <a href="#">멀리서도 가까이&nbsp;</a>

                    </div>

                    <!-- Category Description -->
                    <div class="category-descr">
                        <span>만나지 못 해서 생기는 소통의 빈 공간을 메타어스가 보조해줍니다. 가상 공간에서의 커뮤니티를 이용해보세요.</span>
                    </div>

                </div>
            </div>
            <!-- End of Category div -->

            <!-- Start of Category div -->
            <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                <div class="category ptb30">

                    <!-- Icon -->
                    <div class="category-icon">
                        <i class="fa fa-pencil"></i>
                    </div>

                    <!-- Category Info - Title -->
                    <div class="category-info pt30">
                        <a href="#">생산성</a>
                        <p>(36 open positions)</p>
                    </div>

                    <!-- Category Description -->
                    <div class="category-descr">
                        <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard
                            dummy text since 1500s.</span>
                    </div>

                </div>
            </div>
            <!-- End of Category div -->

            <!-- Start of Category div -->
            <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                <div class="category ptb30">

                    <!-- Icon -->
                    <div class="category-icon">
                        <i class="fa fa-umbrella"></i>
                    </div>

                    <!-- Category Info - Title -->
                    <div class="category-info pt30">
                        <a href="#">편리함</a>
                        <p>(6 open positions)</p>
                    </div>

                    <!-- Category Description -->
                    <div class="category-descr">
                        <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard
                            dummy text since 1500s.</span>
                    </div>

                </div>
            </div>
            <!-- End of Category div -->
        </div>


        <div class="row pt40 nomargin">
            <!-- Start of Category div -->
            <div class="section-title">
                <h2> We're here for You! </h2>&nbsp;</h2>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">

                <div class="category ptb30">

                    <!-- Icon -->
                    <div class="category-icon">
                        <i class="fa fa-desktop"></i>
                    </div>

                    <!-- Category Info - Title -->
                    <div class="category-info pt30">
                        <a href="#">프리랜서</a>
                        <p>(22 open positions)</p>
                    </div>

                    <!-- Category Description -->
                    <div class="category-descr">
                        <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard
                            dummy text since 1500s.</span>
                    </div>

                </div>
            </div>
            <!-- End of Category div -->

            <!-- Start of Category div -->
            <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                <div class="category ptb30">

                    <!-- Icon -->
                    <div class="category-icon">
                        <i class="fa fa-line-chart"></i>
                    </div>

                    <!-- Category Info - Title -->
                    <div class="category-info pt30">
                        <a href="#">기업&nbsp;</a>
                        <p>(14 open positions)</p>
                    </div>

                    <!-- Category Description -->
                    <div class="category-descr">
                        <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard
                            dummy text since 1500s.</span>
                    </div>

                </div>
            </div>
            <!-- End of Category div -->

            <!-- Start of Category div -->
            <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                <div class="category ptb30">

                    <!-- Icon -->
                    <div class="category-icon">
                        <i class="fa fa-heart"></i>
                    </div>

                    <!-- Category Info - Title -->
                    <div class="category-info pt30">
                        <a href="#">학생</a>
                        <p>(7 open positions)</p>
                    </div>

                    <!-- Category Description -->
                    <div class="category-descr">
                        <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard
                            dummy text since 1500s.</span>
                    </div>

                </div>
            </div>
            <!-- End of Category div -->

            <!-- Start of Category div -->
            <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                <div class="category ptb30">

                    <!-- Icon -->
                    <div class="category-icon">
                        <i class="fa fa-lightbulb-o"></i>
                    </div>

                    <!-- Category Info - Title -->
                    <div class="category-info pt30">
                        <a href="#">그 외의 모두들.&nbsp;</a>
                        <p>(4 open positions)</p>
                    </div>

                    <!-- Category Description -->
                    <div class="category-descr">
                        <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard
                            dummy text since 1500s.</span>
                    </div>

                </div>
            </div>
            <!-- End of Category div -->
        </div>

        <div class="col-md-12 mt60 text-center">
            <a href="search-jobs-1.html" class="btn btn-blue btn-effect nomargin">browse all</a>
        </div>

    </div>
</section>
<!-- ===== End of Popular Categories Section ===== -->





<!-- ===== Start of Signup & Video Section ===== -->
<section id="signup-video">
    <div class="container-fluid">
        <div class="row">

            <!-- Start of Signup Column -->
            <div class="col-md-6 signup-sec ptb80 text-center">

                <div class="col-md-8 col-md-offset-2">

                    <!-- Section Title -->
                    <div class="section-title">
                        <h5 class="text-white">멀리서라도 바로 옆에 있는 것 같은 존재감.&nbsp;&nbsp;</h5>
                    </div>

                    <p class="text-white mt20">Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                    <a href="register.html" class="btn btn-purple btn-effect mt80">signup now!</a>


                </div>


            </div>
            <!-- End of Signup Column -->


            <!-- Start of Video Column -->
            <div class="col-md-6 video-sec overlay-gradient">
                <a href="http://vimeo.com/99876106" class="popup-video"><i class="fa fa-play"></i></a>
            </div>
            <!-- End of Video Column -->

        </div>
    </div>
</section>
<!-- ===== End of Signup & Video Section ===== -->





<!-- ===== Start of Job Post Section ===== -->
<section class="ptb80" id="job-post">
    <div class="container">

        <!-- Start of Job Post Main -->
        <div class="col-md-8 col-sm-12 col-xs-12 job-post-main">
            <h2 class="capitalize"><i class="fa fa-briefcase">&nbsp;(모집 중인 공고들 추가 예정)&nbsp;</i></h2>

            <!-- Start of Job Post Wrapper -->
            <div class="job-post-wrapper mt60">

                <!-- Start of Single Job Post 1 -->
                <div class="single-job-post row nomargin">
                    <!-- Job Company -->
                    <div class="col-md-2 col-xs-3 nopadding">
                        <div class="job-company">
                            <a href="company-page-1.html">
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
                            <span class="company"><i class="fa fa-building-o"></i>envato</span>
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
                <!-- End of Single Job Post 1 -->

                <!-- Start of Single Job Post 2 -->
                <div class="single-job-post row nomargin">
                    <!-- Job Company -->
                    <div class="col-md-2 col-xs-3 nopadding">
                        <div class="job-company">
                            <a href="company-page-1.html">
                                <img src="images/companies/google.svg" alt="">
                            </a>
                        </div>
                    </div>

                    <!-- Job Title & Info -->
                    <div class="col-md-8 col-xs-6 ptb20">
                        <div class="job-title">
                            <a href="job-page.html">department head</a>
                        </div>

                        <div class="job-info">
                            <span class="company"><i class="fa fa-building-o"></i>google</span>
                            <span class="location"><i class="fa fa-map-marker"></i>berlin, germany</span>
                        </div>
                    </div>

                    <!-- Job Category -->
                    <div class="col-md-2 col-xs-3 ptb30">
                        <div class="job-category">
                            <a href="javascript:void(0)" class="btn btn-purple btn-small btn-effect">part time</a>
                        </div>
                    </div>
                </div>
                <!-- End of Single Job Post 2 -->

                <!-- Start of Single Job Post 3 -->
                <div class="single-job-post row nomargin">
                    <!-- Job Company -->
                    <div class="col-md-2 col-xs-3 nopadding">
                        <div class="job-company">
                            <a href="company-page-1.html">
                                <img src="images/companies/facebook.svg" alt="">
                            </a>
                        </div>
                    </div>

                    <!-- Job Title & Info -->
                    <div class="col-md-8 col-xs-6 ptb20">
                        <div class="job-title">
                            <a href="job-page.html">graphic designer</a>
                        </div>

                        <div class="job-info">
                            <span class="company"><i class="fa fa-building-o"></i>facebook</span>
                            <span class="location"><i class="fa fa-map-marker"></i>london, UK</span>
                        </div>
                    </div>

                    <!-- Job Category -->
                    <div class="col-md-2 col-xs-3 ptb30">
                        <div class="job-category">
                            <a href="javascript:void(0)" class="btn btn-blue btn-small btn-effect">freelancer</a>
                        </div>
                    </div>
                </div>
                <!-- End of Single Job Post 3 -->

                <!-- Start of Single Job Post 4 -->
                <div class="single-job-post row nomargin">
                    <!-- Job Company -->
                    <div class="col-md-2 col-xs-3 nopadding">
                        <div class="job-company">
                            <a href="company-page-1.html">
                                <img src="images/companies/envato.svg" alt="">
                            </a>
                        </div>
                    </div>

                    <!-- Job Title & Info -->
                    <div class="col-md-8 col-xs-6 ptb20">
                        <div class="job-title">
                            <a href="job-page.html">senior UI & UX designer</a>
                        </div>

                        <div class="job-info">
                            <span class="company"><i class="fa fa-building-o"></i>envato</span>
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
                <!-- End of Single Job Post 4 -->

                <!-- Start of Single Job Post 5 -->
                <div class="single-job-post row nomargin">
                    <!-- Job Company -->
                    <div class="col-md-2 col-xs-3 nopadding">
                        <div class="job-company">
                            <a href="company-page-1.html">
                                <img src="images/companies/twitter.svg" alt="">
                            </a>
                        </div>
                    </div>

                    <!-- Job Title & Info -->
                    <div class="col-md-8 col-xs-6 ptb20">
                        <div class="job-title">
                            <a href="job-page.html">senior health advisor</a>
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
                <!-- End of Single Job Post 5 -->

            </div>
            <!-- End of Job Post Wrapper -->

            <!-- Start of Pagination -->
            <ul class="pagination list-inline text-center">
                <li class="active"><a href="javascript:void(0)">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">Next</a></li>
            </ul>
            <!-- End of Pagination -->

        </div>
        <!-- End of Job Post Main -->


        <!-- Start of Job Post Sidebar -->
        <div class="col-md-4 col-xs-12 job-post-sidebar">
            <h2 class="capitalize"><i class="fa fa-star"></i>golden jobs</h2>

            <!-- Start of Featured Job Widget -->
            <div class="featured-job widget mt60">

                <!-- Start of Company Logo -->
                <div class="company">
                    <img src="images/companies/cloudify.svg" alt="">
                </div>
                <!-- End of Company Logo -->

                <!-- Start of Featured Job Info -->
                <div class="featured-job-info">

                    <!-- Job Title -->
                    <div class="job-title">
                        <h5 class="uppercase pull-left">ui designer</h5>
                        <a href="javascript:void(0)" class="btn btn-green btn-small btn-effect pull-right">full
                            time</a>
                    </div>

                    <!-- Job Info -->
                    <div class="job-info pt5">
                        <span id="company"><i class="fa fa-building-o"></i>cloudify</span>
                        <span id="location"><i class="fa fa-map-marker"></i>london, uk</span>
                    </div>

                    <p class="mt20"> Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>

                    <!-- View Job Button -->
                    <div class="text-center mt20">
                        <a href="job-page.html" class="btn btn-purple btn-small btn-effect">view job</a>
                    </div>
                </div>
                <!-- End of Featured Job Info -->

            </div>
            <!-- End of Featured Job Widget -->

            <!-- Start of Upload Resume Widget -->
            <div class="upload-resume widget mt40 text-center">
                <h4 class="capitalize">upload your resume</h4>
                <p class="mtb10"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                    Ipsum has been the industry...</p>

                <a href="submit-resume.html" class="btn btn-blue btn-effect mt10">upload resume</a>
            </div>
            <!-- End of Upload Resume Widget -->
        </div>
        <!-- End of Job Post Sidebar -->

    </div>
</section>
<!-- ===== End of Job Post Section ===== -->





<!-- ===== Start of CountUp Section ===== -->
<section class="ptb40" id="countup">
    <div class="container">

        <!-- 1st Count up item -->
        <div class="col-md-3 col-sm-3 col-xs-12">
            <span class="counter" data-from="0" data-to="743"></span>
            <h4>이루어진 인연들&nbsp;</h4>
        </div>

        <!-- 2nd Count up item -->
        <div class="col-md-3 col-sm-3 col-xs-12">
            <span class="counter" data-from="0" data-to="579"></span>
            <h4>사용중인 사람들&nbsp;</h4>
        </div>

        <!-- 3rd Count up item -->
        <div class="col-md-3 col-sm-3 col-xs-12">
            <span class="counter" data-from="0" data-to="251"></span>
            <h4>월 평균 동시 접속자&nbsp;&nbsp;</h4>
        </div>

        <!-- 4th Count up item -->
        <div class="col-md-3 col-sm-3 col-xs-12">
            <span class="counter" data-from="0" data-to="330"></span>
            <h4>( 공란 )&nbsp;</h4>
        </div>
    </div>
</section>
<!-- ===== End of CountUp Section ===== -->





<!-- ===== Start of Testimonial Section ===== -->
<section class="ptb80" id="testimonials">
    <div class="container">

        <!-- Section Title -->
        <div class="section-title">
            <h2 class="text-white">한 줄 평을 남기기</h2>
        </div>


        <!-- Start of Owl Slider -->
        <div class="owl-carousel testimonial">

            <!-- Start of Slide item -->
            <div class="item">
                <div class="review">
                    <blockquote> 코로나 때문에 업무를 보러기기 어려운 상황에서도 메터어스 덕분에 성공적인 업무 미팅을 이끌어 낼 수 있었습니다. </blockquote>
                </div>
                <div class="customer">
                    <img src="images/clients/client1.jpg" alt="">
                    <h4 class="uppercase pt20">기업 사용자</h4>
                </div>
            </div>
            <!-- End Slide item -->

            <!-- Start of Slide item -->
            <div class="item">
                <div class="review">
                    <blockquote>요즘 같이 만나기 조심스러운 상황에서 적절한 대처 방법인 것 같아요 :)</blockquote>
                </div>
                <div class="customer">
                    <img src="images/clients/client2.jpg" alt="">
                    <h4 class="uppercase pt20">VOD수강자</h4>
                </div>
            </div>
            <!-- End Slide item -->

            <!-- Start of Slide item -->
            <div class="item">
                <div class="review">
                    <blockquote>직장 동료들을 오랫 동안 못 봐왔었는데, 덕분에 가까이에 있는 듯한 느낌을 받았어요.</blockquote>
                </div>
                <div class="customer">
                    <img src="images/clients/client3.jpg" alt="">
                    <h4 class="uppercase pt20">기업 사용자</h4>
                </div>
            </div>
            <!-- End Slide item -->

        </div>
        <!-- End of Owl Slider -->

    </div>
</section>
<!-- ===== End of Testimonial Section ===== -->





<!-- ===== Start of Latest News Section ===== -->
<section id="latest-news">
    <div class="container">

        <!-- Section Title -->
        <div class="section-title">
            <h2>latest news</h2>
        </div>

        <!-- Start of Blog Post -->
        <div class="col-md-4 col-xs-12">
            <div class="blog-post">
                <!-- Blog Post Image -->
                <div class="blog-post-thumbnail">
                    <a href="blog-post.html" class="hover-link">
                        <img src="images/blog/blog1.jpg" alt="">
                    </a>
                </div>

                <!-- Blog Post Info -->
                <div class="post-info">
                    <a href="blog-post.html">메타버스의 추억.&nbsp;</a>

                    <div class="post-details">
                        <span class="date"><i class="fa fa-calendar"></i>September 7, 2016</span>
                        <span class="comments"><i class="fa fa-comment"></i>0 Comments</span>
                    </div>

                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                        been the industry's standard dummy t ext ever since the 1500s....</p>

                </div>

                <!-- Read More Button -->
                <a href="blog-post.html" class="btn btn-blue btn-small btn-effect">read more</a>

            </div>
        </div>
        <!-- End of Blog Post -->

        <!-- Start of Blog Post -->
        <div class="col-md-4 col-xs-12">
            <div class="blog-post">
                <!-- Blog Post Image -->
                <div class="blog-post-thumbnail">
                    <a href="blog-post.html" class="hover-link">
                        <img src="images/blog/blog2.jpg" alt="">
                    </a>
                </div>

                <!-- Blog Post Info -->
                <div class="post-info">
                    <a href="blog-post.html">만나기 어려운 이 시국.</a>

                    <div class="post-details">
                        <span class="date"><i class="fa fa-calendar"></i>September 7, 2016</span>
                        <span class="comments"><i class="fa fa-comment"></i>0 Comments</span>
                    </div>

                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                        been the industry's standard dummy t ext ever since the 1500s....</p>

                </div>

                <!-- Read More Button -->
                <a href="blog-post.html" class="btn btn-blue btn-small btn-effect">read more</a>

            </div>
        </div>
        <!-- End of Blog Post -->

        <!-- Start of Blog Post -->
        <div class="col-md-4 col-xs-12">
            <div class="blog-post">
                <!-- Blog Post Image -->
                <div class="blog-post-thumbnail">
                    <a href="blog-post.html" class="hover-link">
                        <img src="images/blog/blog3.jpg" alt="">
                    </a>
                </div>

                <!-- Blog Post Info -->
                <div class="post-info">
                    <a href="blog-post.html">정말 이상하리만치 옆에 있는 것 같은 메타...</a>

                    <div class="post-details">
                        <span class="date"><i class="fa fa-calendar"></i>September 7, 2016</span>
                        <span class="comments"><i class="fa fa-comment"></i>0 Comments</span>
                    </div>

                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                        been the industry's standard dummy t ext ever since the 1500s....</p>

                </div>

                <!-- Read More Button -->
                <a href="blog-post.html" class="btn btn-blue btn-small btn-effect">read more</a>

            </div>
        </div>
        <!-- End of Blog Post -->



    </div>
</section>
<!-- ===== End of Latest News Section ===== -->
<%@ include file="../inc/footer.jsp" %>