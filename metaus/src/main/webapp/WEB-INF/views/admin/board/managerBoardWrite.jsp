<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/adminHeader.jsp" %>

<link href="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">



<!-- ckeditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>


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
        return '게시판 조회 결과.xlsx';	//파일명
    },
    getSheetName : function(){
        return '게시판';	//시트명
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
</script>
				<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-2 text-gray-800">글 등록</h1>
                    </div>
                    
                
                    
						<form>
                    	<div class="row">

	                        <div class="col-lg-8">

	                            <!-- Basic Card Example -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">글 제목</h6>
	                                </div>
	                                <div class="card-body">
		                                
	                                    <input type="text" class="form-control bg-white border-1 small border-left-info" placeholder="글 제목을 입력하세요..."
                                		aria-label="Search" aria-describedby="basic-addon2" name="boardTitle">
	                                   
	                                </div>
	                            </div>
	                            
	                            
	                            <!-- Basic Card Example -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">글 내용</h6>
	                                </div>
	                                
		                                
	                                    <textarea class="form-control bg-white border-1 small border-left-info" placeholder="글 내용을 입력하세요..."
                                		aria-label="Search" aria-describedby="basic-addon2" rows="18" name="boardContent" id="boardContent"></textarea>
                                		
                                		
									    <script>
									      InlineEditor.create( document.querySelector( '#boardContent' ), {
									    	    language: "ko"
									    	  } );
									      
									    </script>
									    
									    
	                                   
	                                
	                            </div>
	
	                        </div>
	                        
	                        <div class="col-lg-4">

	                            <!-- Basic Card Example -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">글 작성</h6>
	                                </div>
	                                <div class="card-body">
	                                   
	                                </div>
	                            </div>
	
	                        </div>
	                        
	                        
	                        
                        </div>
						</form>



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
