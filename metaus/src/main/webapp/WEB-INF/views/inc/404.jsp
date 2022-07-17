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
                
                    <h1 class="text-black" style="font-size: 80px; font-family: fantasy;">404 Pages Not Found</h1>
                	<br>

                <p class="text-black" style="font-family: 'Noto Sans KR'; font-size:22px; width:90%; text-align: justify;" >해당 url을 찾을 수 없습니다.<br>저희 메타어스는 수많은 크리에이터들과 회사와 함께 가상세계를 구축합니다. 다양한 종류의 3D모델을 제공하며, 당신의 메타버스 진출을 지원합니다.</p>
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
                    <button type="button" class="btn btn-blue btn-effect btn-large" id="selectBtn"><i class="fa fa-search"></i>search</button>
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
 
 
 $(function(){
	 $('#selectBtn').click(function(){
		 if($('#search-categories').val()==1){
			 location.href="<c:url value='/request/search'/>";
		 }else if($('#search-categories').val()==2){
			 location.href="<c:url value='/creater/createrList'/>";
			 
		 }
	 });
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
                <a href="<c:url value='/pd/pdByCategory?cateNo=1&cateName=동물'/>">
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/animal.png" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="<c:url value='/pd/pdByCategory?cateNo=1&cateName=동물'/>">동물</a>
                            <p>( ${cateCnt.animalCnt } products )</p>
                        </div>

                    </div>
                </div></a>
                <!-- End of Category div -->

                
                <!-- Start of Category div -->
                <a href="<c:url value='/pd/pdByCategory?cateNo=2&cateName=인물'/>">
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/human.png" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="<c:url value='/pd/pdByCategory?cateNo=2&cateName=인물'/>">인물</a>
                            <p>( ${cateCnt.humanCnt } products )</p>
                        </div>

                    </div>
                </div></a>
                <!-- End of Category div -->

                
                <!-- Start of Category div -->
                <a href="<c:url value='/pd/pdByCategory?cateNo=3&cateName=가구'/>">
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/furniture.png" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="<c:url value='/pd/pdByCategory?cateNo=3&cateName=가구'/>">가구</a>
                            <p>( ${cateCnt.furnitureCnt } products )</p>
                        </div>

                    </div>
                </div></a>
                <!-- End of Category div -->

                
                <!-- Start of Category div -->
                <a href="<c:url value='/pd/pdByCategory?cateNo=4&cateName=예술'/>">
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/paint-palette.png" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="<c:url value='/pd/pdByCategory?cateNo=4&cateName=예술'/>">예술</a>
                            <p>( ${cateCnt.artCnt } products )</p>
                        </div>

                    </div>
                </div></a>
                <!-- End of Category div -->
            </div>

            
            <div class="row nomargin">
                <!-- Start of Category div -->
                <a href="<c:url value='/pd/pdByCategory?cateNo=5&cateName=탈것'/>">
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/car.png" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="<c:url value='/pd/pdByCategory?cateNo=5&cateName=탈것'/>">탈것</a>
                            <p>( ${cateCnt.vehicleCnt } products )</p>
                        </div>

                    </div>
                </div></a>
                <!-- End of Category div -->

                <!-- Start of Category div -->
                <a href="<c:url value='/pd/pdByCategory?cateNo=6&cateName=캐릭터'/>">
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/knight.png" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="<c:url value='/pd/pdByCategory?cateNo=6&cateName=캐릭터'/>">캐릭터</a>
                            <p>( ${cateCnt.characterCnt } products )</p>
                        </div>

                    </div>
                </div></a>
                <!-- End of Category div -->

                <!-- Start of Category div -->
                <a href="<c:url value='/pd/pdByCategory?cateNo=7&cateName=문화'/>">
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/worldwide.png" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="<c:url value='/pd/pdByCategory?cateNo=7&cateName=문화'/>">문화</a>
                            <p>( ${cateCnt.cultureCnt } products )</p>
                        </div>

                    </div>
                </div></a>
                <!-- End of Category div -->

                <!-- Start of Category div -->
                <a href="<c:url value='/pd/pdByCategory?cateNo=8&cateName=패션'/>">
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category shadow-hover ptb30">

                        <!-- Icon -->
                        <div class="category-icon pt10">
                            <img src="/metaus/images/icons/fashion.png" alt="">
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt20">
                            <a href="<c:url value='/pd/pdByCategory?cateNo=8&cateName=패션'/>">패션</a>
                            <p>( ${cateCnt.fashionCnt } products )</p>
                        </div>

                    </div>
                </div></a>
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
                <h2>신규 의뢰</h2>
            </div>

            <!-- Start of Row -->
            <div class="row">

                <!-- Start of Job Post Main -->
                <div class="col-md-12 job-post-main">

                    <!-- Start of Job Post Wrapper -->
                    <div class="job-post-wrapper mt20">


						<c:forEach var="vo" items="${recList }">
						
                        <!-- ===== Start of Single Job Post 1 ===== -->
                        <div class="single-job-post row shadow-hover">
                            <!-- Job Company -->
                            <div class="col-md-2 col-xs-3">
                                <div class="job-company">
                                    <a href="<c:url value='/request/detail?recNo=${vo.recNo }'/>">
                                        <img src="<c:url value='/com_profile/${vo.comPic }'/>" alt="" style="height:100%">
                                    </a>
                                </div>
                            </div>

                            <!-- Job Title & Info -->
                            <div class="col-md-8 col-xs-6 ptb20">
                                <div class="job-title">
                                    <a href="<c:url value='/request/detail?recNo=${vo.recNo }'/>">${vo.recTitle }</a>
                                </div>

                                <div class="job-info">
                                    <span class="company"><i class="fa fa-building-o"></i>${vo.comName }</span>
                                    <span class="location"><i class="fa fa-clock"></i>${vo.recRegdate }</span>
                                </div>
                            </div>

                            <!-- Job Category -->
                            <div class="col-md-2 col-xs-3 ptb30">
                                <div class="job-category">
                                    <a href="<c:url value='/request/detail?recNo=${vo.recNo }'/>" class="btn btn-green btn-small btn-effect">상세보기</a>
                                </div>
                            </div>
                        </div>
                        <!-- ===== End of Single Job Post 1 ===== -->

						</c:forEach>

                       

                    </div>
                    <!-- End of Job Post Wrapper -->

                    <!-- Start of Pagination -->
                    <div class="col-md-12 text-center mt40">
                        <a href="<c:url value='/request/search'/>" class="btn btn-blue btn-effect">전체보기</a>
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
                <span class="counter" data-from="0" data-to="${footCnt.memCnt }"></span>
                <h4>일반회원 수</h4>
            </div>

            <!-- 2nd Count up item -->
            <div class="col-md-3 col-sm-3 col-xs-12">
                <span class="counter" data-from="0" data-to="${footCnt.recCnt }"></span>
                <h4>의뢰 수</h4>
            </div>

            <!-- 3rd Count up item -->
            <div class="col-md-3 col-sm-3 col-xs-12">
                <span class="counter" data-from="0" data-to="${footCnt.resumeCnt }"></span>
                <h4>이력서 수</h4>
            </div>

            <!-- 4th Count up item -->
            <div class="col-md-3 col-sm-3 col-xs-12">
                <span class="counter" data-from="0" data-to="${footCnt.comCnt }"></span>
                <h4>기업회원 수</h4>
            </div>

        </div>
    </section>
    <!-- ===== End of CountUp Section ===== -->







<%@ include file="../inc/footer.jsp" %>