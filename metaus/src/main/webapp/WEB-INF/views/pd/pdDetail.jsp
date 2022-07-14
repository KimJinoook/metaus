<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../inc/header.jsp"%> 
 <script type="text/javascript">
 $(function(){
	 $('#cart').click(function(){
		 if($('#memId').val()=="" || $('#memId').val()==null){
			alert('로그인 후 이용가능합니다!');
			event.preventDefault();
		}else{
			location.href="<c:url value='/cart/cartAdd?pdNo=${param.pdNo}'/>"; 
				
		}		 
	 });
 });
 </script>
 <!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header" style= "margin-top: 150px;">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>3D 모델</h2>
                </div>
            </div>
            <!-- End of Page Title -->

            <!-- Start of Breadcrumb -->
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">home</a></li>
                        <li class="active">3D Model</li>
                    </ul>
                </div>
            </div>
            <!-- End of Breadcrumb -->

        </div>
    </section>
<!-- Product section-->
    <!-- ===== Start of Shop Cart Section ===== -->
    <section class="shop ptb80">
        <div class="container">

            <!-- Start of Row -->
            <div class="row">
                <!-- Start of Product Wrapper -->
                <div class="col-md-12 product-wrapper">

                    <!-- ===== Start of Row ===== -->
                    <div class="row">
                        <!-- Start of First Column -->
                        <div class="col-md-6">

<script src="https://rawgit.com/mrdoob/three.js/dev/build/three.js"></script>
<script src="https://rawgit.com/mrdoob/three.js/dev/examples/js/loaders/GLTFLoader.js"></script>
<script src="https://cdn.rawgit.com/takahirox/THREE.ZipLoader/v0.0.1/build/ziploader.min.js"></script>
<script src="https://unpkg.com/three@0.141.0/examples/js/controls/OrbitControls.js"></script>
                                    
                                    <canvas id="can${vo.pdNo }" width="555px" height="350px" style="margin-bottom:0"></canvas>

<script type="module">

	var url = "<c:url value='/product/${vo.pdFilename}'/>";

	var manager = new THREE.LoadingManager();
	
	var scene = new THREE.Scene();
	var renderer = new THREE.WebGLRenderer({
		canvas : document.querySelector('#can${vo.pdNo}'),
		antialias : true
	});
	renderer.outputEncoding = THREE.sRGBEncoding;
	
	var camera = new THREE.PerspectiveCamera(30,1);
	camera.position.set(0,0,5)
	
	let controls = new THREE.OrbitControls(camera, renderer.domElement);
	controls.update();

	scene.background = new THREE.Color('white');


	const grid = new THREE.GridHelper( 20, 20, 0x000000, 0x000000 );
	grid.material.opacity = 0.2;
	grid.material.transparent = true;
	grid.position.y = -1;
	scene.add( grid );

	new Promise( function( resolve, reject ) {

		if ( url.match( /\.zip$/ ) ) {

			new THREE.ZipLoader().load( url ).then( function( zip ) {

				manager.setURLModifier( zip.urlResolver );

				resolve( zip.find( /\.(gltf|glb)$/i )[ 0 ] );

			} );

		} else {

			resolve( url );

		}

	} ).then( function ( file ) {

		new THREE.GLTFLoader( manager ).load( file, function ( gltf ) {

			scene.add( gltf.scene );
			function animate(){
				requestAnimationFrame(animate)
				controls.update();
				renderer.render(scene,camera);
				gltf.scene.rotation.y += 0.005;
			}
			animate();


		} );

	} );
</script>
                            <!-- ===== Start of Owl Slider ===== -->
                            <%-- <div class="owl-carousel product-slider">

                                <!-- Owl Item -->
                                <div class="item">
                                    
                                     <div>
                                        <img src="<c:url value='/images/shop/product1.jpg'/>" alt="" class="img-responsive">
                                    </div>
                                </div>

                                <!-- Owl Item -->
                                <div class="item">
                                    <div>
                                        <img src="<c:url value='/images/shop/product1a.jpg'/>" alt="" class="img-responsive">
                                    </div>
                                </div>

                                <!-- Owl Item -->
                                <div class="item">
                                    <div>
                                        <img src="<c:url value='/images/shop/product1b.jpg'/>" alt="" class="img-responsive">
                                    </div>
                                </div>
                           

                            </div>  --%>
                            <!-- ===== End of Owl Slider ===== -->

                        </div>
                        <!-- End of First Column -->


                        <!-- Start of Second Column -->
                        <div class="col-md-6">

                            <!-- Start of Product Details -->
                            <div class="product-details">

                                <h2>${vo.pdName }</h2>

                                <!-- Start of Product Rating -->
                                <div class="product-rating mt10">
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                </div>
                                <!-- End of Product Rating -->

                                <!-- Start of Product Price -->
                                <div class="product-price">
                                    <span><del>$39.99</del></span>
                                    <span class="price"><fmt:formatNumber value="${vo.pdPrice }" pattern="#,###"/>원</span>
                                </div>
                                <!-- End of Product Price -->

                                <p>${vo.pdPre }</p>


                                <!-- Start of Product Quantity -->
                                <!-- <div class="product-cart mt20">
                                    <div class="input-group product-quantity">
                                        <input type="button" value="-" class="minus">
                                        <input type="text" class="qty" value="1">
                                        <input type="button" value="+" class="plus">
                                    </div>
                                </div> -->
                                <!-- End of Product Quantity -->

                                <button class="btn btn-blue btn-effect mt20" id="cart">Add to Cart</button>

                            </div>
                            <!-- End of Product Details -->

                        </div>
                        <!-- End of Second Column -->
                    </div>
                    <!-- ===== End of Row ===== -->


                    <!-- ===== Start of Row ===== -->
                    <div class="row mt60">
                        <div class="col-md-12">

                            <!-- Start of Tabs Product -->
                            <div class="tabs tabs-product">

                                <!-- Start of Nav Tabs -->
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#productDescription" data-toggle="tab" aria-expanded="false"><h6>상품설명</h6></a>
                                    </li>

                                    <li>
                                        <a href="#productReviews" data-toggle="tab" aria-expanded="true"><h6>리뷰</h6></a>
                                    </li>
                                </ul>
                                <!-- End of Nav Tabs -->


                                <!-- Start of Tab Content -->
                                <div class="tab-content">

                                    <!-- Start of Tab Pane -->
                                    <div class="tab-pane active" id="productDescription">
                                        <p>${vo.pdPre }</p>
                                    </div>
                                    <!-- End of Tab Pane -->


                                    <!-- Start of Tab Pane -->
                                    <div class="tab-pane" id="productReviews">

                                        <!-- Start of Comments -->
                                        <ul class="comments-list">
											<c:if test="${empty list }">
										<div class="align_center" style="text-align: center;">
											<span>작성된 리뷰가 없습니다.<br><br><br></span>
										</div>
										</c:if>
                                            <!-- Start of Comment 1 -->
											<c:if test="${!empty list }">
											<!--반복 시작 -->
											<c:forEach var="vo" items="${list }">
                                            <li class="comment">
                                                <!-- Commenter Image -->
                                                <a class="pull-left commenter" href="#">
                                                    <img src="<c:url value='/images/clients/client1.jpg'/>" alt="" class="img-responsive">
                                                </a>

                                                <div class="media-body comment-body">
                                                    <!-- Comment Wrapper -->
                                                    <div class="comment-content-wrapper">
                                                        <div class="media-heading clearfix">
                                                            <!-- Commenters Name -->
                                                            <h6 class="commenter-name">john doe</h6>
			
                                                            <div class="comment-rating pull-right">
                                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                                            </div>

                                                            <!-- Comment Info -->
                                                            <div class="comment-info">
                                                                <span>Nov 11, 2016 at 8:51 am</span>
                                                            </div>

                                                            <!-- Comment -->
                                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                                      
                                                        </div>
                                                        
                                                    </div>
                                                    <!-- End of Comment Wrapper -->
                                                </div>
                                            </li>
                                                      </c:forEach>
                                                      </c:if>
                                            <!-- End of Comment 1 -->


                                            <!-- Start of Comment 2 -->
                                            <%-- <li class="comment">
                                                <!-- Commenter Image -->
                                                <a class="pull-left commenter" href="#">
                                                    <img src="<c:url value='/images/clients/client2.jpg'/>" alt="" class="img-responsive">
                                                </a>

                                                <div class="media-body comment-body">
                                                    <!-- Comment Wrapper -->
                                                    <div class="comment-content-wrapper">
                                                        <div class="media-heading clearfix">

                                                            <!-- Commenters Name -->
                                                            <h6 class="commenter-name">john doe</h6>

                                                            <div class="comment-rating pull-right">
                                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                                            </div>

                                                            <!-- Comment Info -->
                                                            <div class="comment-info">
                                                                <span>Nov 11, 2016 at 8:51 am</span>
                                                            </div>

                                                            <!-- Comment -->
                                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                                        </div>
                                                    </div>
                                                    <!-- End of Comment Wrapper -->
                                                </div>
                                            </li> --%>
                                            <!-- End of Comment 2 -->

                                        </ul>
                                        <!-- End of Comments -->

                                        <!-- Start of Form -->
                                        <form action="#" method="post">

                                            <div class="row">
                                                <div class="form-group nomargin">
                                                    <div class="col-md-6 mt15">
                                                        <label>작성자 *</label>
                                                        <input type="text" class="form-control" name="memName" autocomplete="off" value="${memName }" readonly="readonly">
                                                    </div>
                                                    <div class="col-md-6 mt15">
                                                        <label>아이디 *</label>
                                                        <input type="email" class="form-control" name="memId" autocomplete="off" value="${memId }" readonly="readonly">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mt15">
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <label>리뷰 *</label>
                                                        <textarea class="form-control" rows="8" name="message" placeholder="이곳에 적어주세요"></textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mt15">
                                                <div class="col-md-12 text-center">
                                                    <button type="submit" id="review" class="btn btn-blue btn-effect">리뷰 등록</button>
                                                </div>
                                            </div>
                                        </form>
                                        <!-- End of Form -->

                                    </div>
                                    <!-- End of Tab Pane -->

                                </div>
                                <!-- End of Tab Content -->

                            </div>
                            <!-- End of Tabs Product -->

                        </div>
                    </div>
                    <!-- ===== End of Row ===== -->


                    <!-- ===== Start of Row ===== -->
                    <div class="row mt60">
                        <div class="col-md-12">
                            <h3 class="capitalize">관련 상품</h3>
                        </div>
                        
<%--                         <!-- Start of Product 1 -->
                        <div class="col-md-4 col-sm-6 col-xs-12 mt40">
                            <div class="product nomargin">

                                <!-- Product Image -->
                                <div class="product-image">

                                    <a href="<c:url value='/images/shop/product2.jpg'/>" class="hover-zoom">
                                        <img src="<c:url value='/images/shop/product2.jpg'/>" class="img-responsive" alt="">
                                    </a>

                                    <!-- Product overlay -->
                                    <div class="product-overlay">
                                        <a href="<c:url value='/cart/cart'/>"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                    </div>

                                </div>

                                <!-- Product Description -->
                                <div class="product-descr">

                                    <a href="<c:url value='/pd/pdDetail?pdNo=${vo.pdNo }'/>">
                                        <h5>Cariera Cap</h5>

                                        <!-- Price -->
                                        <span class="price">
                                            <span class="amount">$19.99</span>
                                        </span>
                                    </a>
                                </div>

                            </div>
                        </div>
                        <!-- End of Product 1 -->


                        <!-- Start of Product 2 -->
                        <div class="col-md-4 col-sm-6 col-xs-12 mt40">
                            <div class="product nomargin">

                                <!-- Product Image -->
                                <div class="product-image">

                                    <a href="<c:url value='/images/shop/product3.jpg'/>" class="hover-zoom">
                                        <img src="<c:url value='/images/shop/product3.jpg'/>" class="img-responsive" alt="">
                                    </a>

                                    <!-- Product overlay -->
                                    <div class="product-overlay">
                                        <a href="cart.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                    </div>

                                </div>

                                <!-- Product Description -->
                                <div class="product-descr">

                                    <a href="shop-product.html">
                                        <h5>Cariera T-Shirt</h5>

                                        <!-- Price -->
                                        <span class="price">
								            <del><span class="amount">$39.99</span></del>
                                        <span class="amount">$29.99</span>
                                        </span>
                                    </a>
                                </div>

                            </div>
                        </div>
                        <!-- End of Product 2 -->


                        <!-- Start of Product 3 -->
                        <div class="col-md-4 col-sm-6 col-xs-12 mt40">
                            <div class="product nomargin">

                                <!-- Product Image -->
                                <div class="product-image">

                                    <a href="<c:url value='/images/shop/product4.jpg'/>" class="hover-zoom">
                                        <img src="<c:url value='/images/shop/product4.jpg'/>" class="img-responsive" alt="">
                                    </a>

                                    <!-- Product overlay -->
                                    <div class="product-overlay">
                                        <a href="<c:url value='/cart/cart'/>"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                    </div>

                                </div>

                                <!-- Product Description -->
                                <div class="product-descr">

                                    <a href="shop-product.html">
                                        <h5>Cariera Mug</h5>

                                        <!-- Price -->
                                        <span class="price">
                                            <span class="amount">$9.99</span>
                                        </span>
                                    </a>
                                </div>

                            </div>
                        </div> --%>
                        <!-- End of Product 3 -->

                    </div>
                    <!-- ===== Start of Row ===== -->

                </div>
                <!-- End of Product Wrapper -->
            </div>
            <!-- End of Row -->
        </div>

    <div id="viewBest">
	   		<c:import url="/pd/best3">
	   			<c:param name="pdNo" value="${vo.pdNo}"></c:param>
	   		</c:import>
	   </div>
    </section>
    
    <!-- ===== End of Shop Cart Section ===== -->
<%@ include file="../inc/footer.jsp"%>