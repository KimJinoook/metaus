<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<script type="text/javascript">

function btCart(){		
	var result = confirm('장바구니에 추가하시겠습니까?');
	if(result){
		
		alert('추가되었습니다.');
		result = confirm('지금 장바구니로 이동하시겠습니까?');			
		if(result){
			location.href="<c:url value=''/>";			
		}else{
				
		}
	}else{
			
	}
	
}
</script>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value='/css/styles.css'/>" rel="stylesheet" />
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
    <input type="hidden" name="pdNo" value="${vo.pdNo }">
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                    <c:if test="${empty vo.pdFilename }">
                    <img class="card-img-top mb-5 mb-md-0" src="<c:url value='/images/noPd.jpg'/>" alt="..." /></div>
                    </c:if>
                    <c:if test="${!empty vo.pdFilename }">
                    <img class="card-img-top mb-5 mb-md-0" src="<c:url value='/product/${vo.pdFilename }'/>" alt="..." /></div>
                    </c:if>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder">${vo.pdName }</h1>
                        <div class="fs-5 mb-5">
                            <span><fmt:formatNumber value="${vo.pdPrice }" pattern="#,###"/>원</span>
                        </div>
                        <p class="lead">${vo.pdPre }</p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="text" value="1" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" name="btCart" onclick="btCart()">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <!-- 카테고리별 판매가 가장 많은 상품 include -->
	   <div id="viewBest">
	   		<c:import url="/pd/best3">
	   			<c:param name="pdNo" value="${vo.pdNo}"></c:param>
	   		</c:import>
	   </div>
<%@ include file="../inc/footer.jsp"%>