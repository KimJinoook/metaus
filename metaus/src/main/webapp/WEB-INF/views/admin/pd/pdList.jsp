<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/adminHeader.jsp" %>

<link href="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">


<!-- Sheet JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<!--FileSaver savaAs 이용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>

<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>

<script>

function delBoard(no,typeno){
	var con = confirm('해당 게시글을 삭제 하시겠습니까?');
	
	if(con){
		location.href="<c:url value='/admin/board/memberBoardDelete?boardNo='/>"+no+"&btypeNo="+typeno;
	}
}

function openBoard(no,typeno){
	var url = "<c:url value='/board/readCountUp'/>"+"?boardNo="+no+"&btypeNo="+typeno;
	window.open(url,"metaus");
}


function exportExcel(){ 
  // step 1. workbook 생성
  var wb = XLSX.utils.book_new();

  // step 2. 시트 만들기 
  var newWorksheet = excelHandler.getWorksheet();

  // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
  XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

  // step 4. 엑셀 파일 만들기 
  var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

  // step 5. 엑셀 파일 내보내기 
  saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
}

var excelHandler = {
    getExcelFileName : function(){
        return '모델링 상품 조회 결과.xlsx';	//파일명
    },
    getSheetName : function(){
        return '모델링 상품';	//시트명
    },
    getExcelData : function(){
        return document.getElementById('dataTable'); 	//TABLE id
    },
    getWorksheet : function(){
        return XLSX.utils.table_to_sheet(this.getExcelData());
    }
}

function s2ab(s) { 
  var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
  var view = new Uint8Array(buf);  //create uint8array as viewer
  for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
  return buf;    
}


function getVals(){
	  // Get slider values
	  var parent = this.parentNode;
	  var slides = parent.getElementsByTagName("input");
	    var slide1 = parseFloat( slides[0].value );
	    var slide2 = parseFloat( slides[1].value );
	  // Neither slider will clip the other, so make sure we determine which is larger
	  if( slide1 > slide2 ){ var tmp = slide2; slide2 = slide1; slide1 = tmp; }
	  
	  var displayElement = parent.getElementsByClassName("rangeValues")[0];
	      displayElement.innerHTML = slide1 + "원 - " + slide2 + "원";
	}

	window.onload = function(){
	  // Initialize Sliders
	  var sliderSections = document.getElementsByClassName("range-slider");
	      for( var x = 0; x < sliderSections.length; x++ ){
	        var sliders = sliderSections[x].getElementsByTagName("input");
	        for( var y = 0; y < sliders.length; y++ ){
	          if( sliders[y].type ==="range" ){
	            sliders[y].oninput = getVals;
	            // Manually trigger event first time to display values
	            sliders[y].oninput();
	          }
	        }
	      }
	}
</script>
<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-2 text-gray-800">모델링 상품 조회</h1>
                    <a href="javascript:exportExcel()" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id="excelDownload"><i
                                class="fas fa-download fa-sm text-white-50"></i> 엑셀 다운로드</a>
                    </div>
                    
                    <div class="row">
                    
                    
                    <div class="col-lg-3">

	                            <!-- Basic Card Example -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">검색조건</h6>
	                                </div>
	                                <div class="card-body">
	                                	
	                                	
	                                	<div class="range-slider text-align">
										  <span class="rangeValues"></span>
										  <input value="0" min="0" max="50000" step="500" type="range">
										  <input value="50000" min="0" max="50000" step="500" type="range">
										</div>
										
	                                     <br>   카테고리
	                                	
	                                	<div class="pull-right d-sm-flex align-items-center justify-content-between mb-4">
	                                        <div class="form-group">
											    <input class="" id="normal" type="checkbox" name="mailScope" value="1">
											    <label class="form-check-label" for="normal">동물</label><br>
											
											    <input class="" id="company" type="checkbox" name="mailScope" value="2">
											    <label class="form-check-label" for="company">식물</label><br>
											
											    <input class="" id="manager" type="checkbox" name="mailScope" value="3">
											    <label class="form-check-label" for="manager">관리자</label><br>
											</div><br>
	                                        <div class="form-group">
											    <input class="" id="normal" type="checkbox" name="mailScope" value="1">
											    <label class="form-check-label" for="normal">일반회원</label><br>
											
											    <input class="" id="company" type="checkbox" name="mailScope" value="2">
											    <label class="form-check-label" for="company">기업회원</label><br>
											
											    <input class="" id="manager" type="checkbox" name="mailScope" value="3">
											    <label class="form-check-label" for="manager">관리자</label><br>
											</div><br>
	                                        <div class="form-group">
											    <input class="" id="normal" type="checkbox" name="mailScope" value="1">
											    <label class="form-check-label" for="normal">일반회원</label><br>
											
											    <input class="" id="company" type="checkbox" name="mailScope" value="2">
											    <label class="form-check-label" for="company">기업회원</label><br>
											
											    <input class="" id="manager" type="checkbox" name="mailScope" value="3">
											    <label class="form-check-label" for="manager">관리자</label><br>
											</div><br>
										</div>
	                                    
	                                    <input type="hidden" name="btypeNo" id="btypeNo">
                                        
                                        
                                        <button class="btn btn-primary btn-lg btn-block mt-4" type="button" id="writeBtn">
                                            검색
                                        </button>
                                
	                                </div>
	                            </div>
	
	                        </div>
                    
                    
                    
                    <div class="col-lg-9">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        	
	                            <h6 class="m-0 font-weight-bold text-primary">조회 결과</h6>
                        	
                            
                                        <ul class="navbar-nav ml-auto">
                                            <li class="nav-item dropdown">
                                            	<c:if test="${!empty cate }">
	                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
	                                                    role="button" data-toggle="dropdown" aria-haspopup="true"
	                                                    aria-expanded="false">
	                                                    ${cate.cateName }
	                                                </a>
                                                </c:if>
                                            	<c:if test="${empty cate }">
	                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
	                                                    role="button" data-toggle="dropdown" aria-haspopup="true"
	                                                    aria-expanded="false">
	                                                    전체조회
	                                                </a>
                                                </c:if>
                                                <div class="dropdown-menu dropdown-menu-right animated--fade-in"
                                                    aria-labelledby="navbarDropdown">
                                                    	<a class="dropdown-item" href="<c:url value='/admin/pd/pdList?cateNo=0'/>">전체조회</a>
                                                    <c:forEach var="vo" items="${cateList }">
                                                    
                                                    	<a class="dropdown-item" href="<c:url value='/admin/pd/pdList?cateNo=${vo.cateNo }'/>">${vo.cateName }</a>
                                                    
                                                    </c:forEach>

                                                </div>
                                            </li>
                                        </ul>
                                   
                        </div>
                        
                        <div class="card-body">
                        
                            <div class="table-responsive">
                            
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>모델번호</th>
                                            <th>아이디</th>
                                            <th>모델이름</th>
                                            <th>가격</th>
                                            <th>판매수</th>
                                            <th>총매출</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>모델번호</th>
                                            <th>아이디</th>
                                            <th>모델이름</th>
                                            <th>가격</th>
                                            <th>판매수</th>
                                            <th>총매출</th>
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="vo" items="${list}">
                                        
                                        <tr>
                                            <th>${vo.pdNo }</th>
                                            <th>${vo.memId }</th>
                                            <th>${vo.pdName }</th>
                                            <th>${vo.pdPrice }</th>
                                            <th>${vo.pdBuycnt }</th>
                                            <th>${vo.pdPrice * vo.pdBuycnt }</th>
                                            <td style="padding:10px">
                                            	<a href="<c:url value='/admin/pd/pdDetail?pdNo=${vo.pdNo }'/>" class="btn btn-primary btn-icon-split btn-sm" style="margin:0px;height:27px">
                                        			<span class="icon text-white" style="margin:0px">
                                            			<i class="fas fa-search"></i>
                                        			</span>
                                    			</a>
                                    		</td>
                                        </tr>
                                        
                                    </c:forEach>
                                      
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    </div>
                    
                    
                    
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
	<!-- Page level plugins -->
	<script src="<c:url value='/admin/vendor/datatables/jquery.dataTables.min.js'/>"></script>
	<script src="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>
	
	<!-- Page level custom scripts -->
	<script src="<c:url value='/admin/js/demo/datatables-demo.js'/>"></script>

<%@ include file="../inc/adminFooter.jsp" %>
