<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../inc/header.jsp"%>   
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,400i,700,800|Varela+Round" rel="stylesheet">

    <!-- CSS links -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>">
<script type="text/javascript">
function pdList(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}

$(function(){
	$('#pdPost').click(function(){
		if($('#memId').val()=="" || $('#memId').val()==null){
			alert('일반 회원 로그인 후 이용가능합니다!');
			event.preventDefault();
		}
	});
	 
	 $('.addCart').click(function(){
       if($('#memId').val()=="" || $('#memId').val()==null){
         alert('일반 회원 로그인 후 이용가능합니다!');
         event.preventDefault();
       }else {
    	   var res=confirm('장바구니에 담으시겠습니까?');
    	   if(res===false){
    		   alert('취소되었습니다.');
    		   event.preventDefault();
    	   }else{
    		   res=confirm('지금 장바구니로 이동하시겠습니까?');
    		   if(res===false){
    			   alert('취소되었습니다.');
	    		   event.preventDefault();    			   
    		   }
    	   }
       }
    });
    
});
</script>    
    <!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header" style="margin-top: 150px;">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>3D 모델 전체 목록</h2>
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
        <!-- container -->
		<div id="container">
			<nav class="cateMenu">
				<dl id="leftNavi">
					<!-- category list -->
				    <c:import url="/pd/categoryList"></c:import>
					
				</dl>
			</nav>
			</div>
<!-- 검색 시작 -->

<form id="searchFrm" method="post" action="<c:url value='/pd/pd'/>">
	<div id="searchBox">
		<div class="col-md-3 col-sm-12 search-categories"
			style="display: contents;">
			<label for="search-categories"></label> <select
				name="searchCondition" class="selectpicker" id="searchCondition"
				data-live-search="true" title="검색 조건" data-size="3"
				data-container="body" style="display: flow-root;">
				<option value="pdName">제목</option>
				<option value="pdPre">내용</option>
			</select> <input type="text" class="live-search-box form-control mt20"
				placeholder="검색하실 내용을 입력해주세요" name="searchKeyword"
				id="searchKeyword">
				<input type="hidden" name="btypeNo" value="8">
			<button class="btn btn-large btn-blue btn-effect mt30" id="searchBt"
				type="submit">검색</button>
		</div>
	</div>
</form>
<a href="<c:url value='/pd/pdPost'/>" id="pdPost">
	<button class="btn btn-large btn-blue btn-effect mt30" id="pdPost">상품 등록</button>
</a>
<!-- 검색 끝 -->

<input type="hidden" id="memId" name="memId" value="${memId }">
<input type="hidden" id="comId" name="comId" value="${comId }">
<script src="https://rawgit.com/mrdoob/three.js/dev/build/three.js"></script>
<script src="https://rawgit.com/mrdoob/three.js/dev/examples/js/loaders/GLTFLoader.js"></script>
<script src="https://cdn.rawgit.com/takahirox/THREE.ZipLoader/v0.0.1/build/ziploader.min.js"></script>
<script src="https://unpkg.com/three@0.141.0/examples/js/controls/OrbitControls.js"></script>
    <!-- ===== Start of Portfolio Section ===== -->
    <section class="shop ptb80">
        <div class="container">

            <!-- <div class="row">
                <h3 class="text-center pb60">Recent Work</h3>

                
            </div> -->
<!-- Start of Portfolio Grid -->
            <div class="row portfolio-grid mt40">
				
                <!-- Start of Shop Product Wrapper -->
                <div class="col-md-12 col-xs-12 shop-products-wrapper"">
				<c:if test="${empty list }">
            <p class="noPd2" style="text-align: center;"><img src="<c:url value='/images/noPd2.png'/>" alt="..." width="40%"/></p>            
            </c:if>
            
            <c:if test="${!empty list }">
				<c:forEach var="vo" items="${list }">
				
                <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat1" style="margin-top: 30px;">
                    
                                <div class="product-image">
<canvas id="can${vo.pdNo }" width="360px" height="270px" style="margin-bottom:0"></canvas>

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
 							<!-- Product Image -->

                                   <%--  <a href="<c:url value='/images/shop/product1.jpg'/>" class="hover-zoom">
                                        <img src="<c:url value='/images/shop/product1.jpg'/>" class="img-responsive" alt="">
                                    </a> --%>

                                    <!-- Product overlay -->
                                    <div class="product-overlay">
                                        <a href="<c:url value='/cart/cartAdd?pdNo=${vo.pdNo}&pdFilename=${vo.pdFilename }'/>" class="addCart"><i class="fa fa-shopping-cart"></i>장바구니 담기</a>
                                    </div>

                                </div>
                    <!-- Product Description -->
                                <div class="product-descr">

                                    <a href="<c:url value='/pd/pdDetail?pdNo=${vo.pdNo }'/>">
                                        <h4>${vo.pdName }</h4>

                                        <!-- Price -->
                                        <span class="price">
								            <del><span class="amount">$399.99</span></del>
                                        <span class="amount"><fmt:formatNumber value="${vo.pdPrice }" pattern="#,###"/>원</span>
                                        </span>
                                    </a>
                                </div>
                </div>
                
                </c:forEach>
</c:if>				

            </div>
            <!-- End of Portfolio Grid -->

        </div>
    </section>
    <!-- ===== End of Portfolio Section ===== -->
<!-- ===== Start of Shop Section ===== -->
    <section class="shop ptb80">
        <div class="container">
            <div class="row">

            <%--
            <c:if test="${!empty list }">
             <!-- 반복 시작 -->
             <c:forEach var="vo" items="${list }">
                    <!-- Start of Products -->
                    <div class="row">

                        <!-- Start of Product 1 -->
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="product">

                                <!-- Product Image -->
                                <div class="product-image">

                                    <a href="<c:url value='/images/shop/product1.jpg'/>" class="hover-zoom">
                                        <img src="<c:url value='/images/shop/product1.jpg'/>" class="img-responsive" alt="">
                                    </a>

                                    <!-- Product overlay -->
                                    <div class="product-overlay">
                                        <a href="<c:url value='/cart/cart'/>"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                    </div>

                                </div>

                                <!-- Product Description -->
                                <div class="product-descr">

                                    <a href="<c:url value='/pd/pdDetail?pdNo=${vo.pdNo }'/>">
                                        <h4>${vo.pdName }</h4>

                                        <!-- Price -->
                                        <span class="price">
								            <del><span class="amount">$39.99</span></del>
                                        <span class="amount">$<fmt:formatNumber value="${vo.pdPrice }" pattern="#,###"/></span>
                                        </span>
                                    </a>
                                </div>

                            </div>
                        </div>
                        <!-- End of Product 1 -->
						 </c:forEach> 
            <!-- 반복 끝 -->
            </c:if>
						 --%>
<!-- 
                        Start of Product 2
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="product">

                                Product Image
                                <div class="product-image">

                                    <a href="images/shop/product2.jpg" class="hover-zoom">
                                        <img src="images/shop/product2.jpg" class="img-responsive" alt="">
                                    </a>

                                    Product overlay
                                    <div class="product-overlay">
                                        <a href="cart.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                    </div>

                                </div>

                                Product Description
                                <div class="product-descr">

                                    <a href="shop-product.html">
                                        <h4>Cariera Cap</h4>

                                        Price
                                        <span class="price">
                                            <span class="amount">$19.99</span>
                                        </span>
                                    </a>
                                </div>

                            </div>
                        </div>
                        End of Product 2


                        Start of Product 3
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="product">

                                Product Image
                                <div class="product-image">

                                    <a href="images/shop/product3.jpg" class="hover-zoom">
                                        <img src="images/shop/product3.jpg" class="img-responsive" alt="">
                                    </a>

                                    Product overlay
                                    <div class="product-overlay">
                                        <a href="cart.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                    </div>

                                </div>

                                Product Description
                                <div class="product-descr">

                                    <a href="shop-product.html">
                                        <h4>Cariera T-Shirt</h4>

                                        Price
                                        <span class="price">
								            <del><span class="amount">$39.99</span></del>
                                        <span class="amount">$29.99</span>
                                        </span>
                                    </a>
                                </div>

                            </div>
                        </div>
                        End of Product 3


                        Start of Product 4
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="product">

                                Product Image
                                <div class="product-image">

                                    <a href="images/shop/product4.jpg" class="hover-zoom">
                                        <img src="images/shop/product4.jpg" class="img-responsive" alt="">
                                    </a>

                                    Product overlay
                                    <div class="product-overlay">
                                        <a href="cart.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                    </div>

                                </div>

                                Product Description
                                <div class="product-descr">

                                    <a href="shop-product.html">
                                        <h4>Cariera Mug</h4>

                                        Price
                                        <span class="price">
                                            <span class="amount">$9.99</span>
                                        </span>
                                    </a>
                                </div>

                            </div>
                        </div>
                        End of Product 4


                        Start of Product 5
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="product">

                                Product Image
                                <div class="product-image">

                                    <a href="images/shop/product5.jpg" class="hover-zoom">
                                        <img src="images/shop/product5.jpg" class="img-responsive" alt="">
                                    </a>

                                    Product overlay
                                    <div class="product-overlay">
                                        <a href="cart.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                    </div>

                                </div>

                                Product Description
                                <div class="product-descr">

                                    <a href="shop-product.html">
                                        <h4>Rubber Stamp</h4>

                                        Price
                                        <span class="price">
                                            <span class="amount">$5.99</span>
                                        </span>
                                    </a>
                                </div>

                            </div>
                        </div>
                        End of Product 5


                        Start of Product 6
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="product">

                                Product Image
                                <div class="product-image">

                                    <a href="images/shop/product6.jpg" class="hover-zoom">
                                        <img src="images/shop/product6.jpg" class="img-responsive" alt="">
                                    </a>

                                    Product overlay
                                    <div class="product-overlay">
                                        <a href="cart.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                    </div>

                                </div>

                                Product Description
                                <div class="product-descr">

                                    <a href="shop-product.html">
                                        <h4>Cariera T-Shirt</h4>

                                        Price
                                        <span class="price">
                                            <span class="amount">$24.99</span>
                                        </span>
                                    </a>
                                </div>

                            </div>
                        </div>
                        End of Product 6


                        Start of Product 7
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="product">

                                Product Image
                                <div class="product-image">

                                    <a href="images/shop/product3.jpg" class="hover-zoom">
                                        <img src="images/shop/product3.jpg" class="img-responsive" alt="">
                                    </a>

                                    Product overlay
                                    <div class="product-overlay">
                                        <a href="cart.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                    </div>

                                </div>

                                Product Description
                                <div class="product-descr">

                                    <a href="shop-product.html">
                                        <h4>Cariera T-Shirt</h4>

                                        Price
                                        <span class="price">
								            <del><span class="amount">$39.99</span></del>
                                        <span class="amount">$29.99</span>
                                        </span>
                                    </a>
                                </div>

                            </div>
                        </div>
                        End of Product 7


                        Start of Product 8
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="product">

                                Product Image
                                <div class="product-image">

                                    <a href="images/shop/product1.jpg" class="hover-zoom">
                                        <img src="images/shop/product1.jpg" class="img-responsive" alt="">
                                    </a>

                                    Product overlay
                                    <div class="product-overlay">
                                        <a href="cart.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                    </div>

                                </div>

                                Product Description
                                <div class="product-descr">

                                    <a href="shop-product.html">
                                        <h4>Cariera T-Shirt</h4>

                                        Price
                                        <span class="price">
								            <del><span class="amount">$39.99</span></del>
                                        <span class="amount">$29.99</span>
                                        </span>
                                    </a>
                                </div>

                            </div>
                        </div> -->
                        <!-- End of Product 8 -->
                        <!-- Start of Pagination -->
					<div class="col-md-12">
						<ul class="pagination list-inline text-center">
							<c:if test="${pagingInfo.firstPage>1 }">
								<li><a href="#"
									onclick="pdList(${pagingInfo.firstPage-1})">prev</a></li>
							</c:if>

							<!-- [1][2][3][4][5][6][7][8][9][10] -->
							<c:forEach var="i" begin="${pagingInfo.firstPage }"
								end="${pagingInfo.lastPage }">
								<c:if test="${i==pagingInfo.currentPage }">
									<li class="active"><a>${i }</a></li>
								</c:if>
								<c:if test="${i!=pagingInfo.currentPage }">
									<li><a href="#" onclick="pdList(${i})">${i } </a></li>
								</c:if>
							</c:forEach>

							<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
								<li><a href="#"
									onclick="pdList(${pagingInfo.lastPage+1})">Next</a></li>
							</c:if>
							<!--  페이지 번호 끝 -->
						</ul>
					</div>
					<!-- End of Pagination -->
                    <!-- 페이징 처리를 위한 form 시작-->
				<form name="frmPage" method="post"
					action="<c:url value='/pd/pd'/>">
					<input type="hidden" name="currentPage">
				</form>
				<!-- 페이징 처리 form 끝 -->
                </div>
                <!-- End of Shop Product Wrapper -->

            </div>
    </section>
    <!-- ===== End of Shop Section ===== -->
    <%@ include file="../inc/footer.jsp"%>