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

function memLock(num,cnt){
	var con = confirm('해당 회원을 차단 하시겠습니까?');
	
	if(con){
		location.href="<c:url value='/manage/memberLock?memNo='/>"+num+"&memWarncnt="+cnt;
	}
}

function memUnLock(num){
	var con = confirm('해당 회원을 차단해제 하시겠습니까?');
	
	if(con){
		location.href="<c:url value='/manage/memberUnlock?memNo='/>"+num;
	}
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
        return '일반회원조회.xlsx';	//파일명
    },
    getSheetName : function(){
        return '일반회원';	//시트명
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
                    <h1 class="h3 mb-2 text-gray-800">일반 회원 조회</h1>
                    <a href="javascript:exportExcel()" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id="excelDownload"><i
                                class="fas fa-download fa-sm text-white-50"></i> 엑셀 다운로드</a>
                    </div>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">일반 회원 조회 결과
                            </h6>
                        </div>
                        
                        <div class="card-body">
                        
                            <div class="table-responsive">
                            
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                           <th>이름</th>
                                            <th>아이디</th>
                                            <th>닉네임</th>
                                            <th>전화번호</th>
                                            <th>주소</th>
                                            <th>가입날짜</th>
                                            <th>경고 수</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>닉네임</th>
                                            <th>전화번호</th>
                                            <th>주소</th>
                                            <th>가입날짜</th>
                                            <th>경고 수</th>                                            
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="mvo" items="${list}" begin="1">
                                        <c:if test="${mvo.memCutdate.getTime() > today.getTime() }">
                                        <tr style="color:red">
                                            <td>${mvo.memName }</td>
                                            <td>${mvo.memId }</td>
                                            <td>${mvo.memNick }</td>
                                            <td>${mvo.memTel }</td>
                                            <td>${mvo.memAdd }</td>
                                            <td>${mvo.memJoindate }</td>
                                            <td>차단</td>
                                            <td style="padding:10px">
                                            	<a href="javascript:memUnLock(${mvo.memNo })" class="btn btn-success btn-icon-split btn-sm" style="margin:0px;height:27px">
                                        			<span class="icon text-white" style="margin:0px">
                                            			<i class="fas fa-unlock"></i>
                                        			</span>
                                    			</a>	
                                    			<a href="<c:url value='/admin/mail/mailList?msgaddAdsee=${mvo.memId }&getinFlag=7'/>" class="btn btn-primary btn-icon-split btn-sm" style="margin:0px;height:27px">
                                        			<span class="icon text-white" style="margin:0px">
                                            			<i class="fas fa-envelope"></i>
                                        			</span>
                                    			</a>
                                    		</td>
                                        </tr>
                                        </c:if>
                                        <c:if test="${(mvo.memCutdate.getTime() < today.getTime()) || mvo.memCutdate ==null }">
                                        <tr>
                                            <td>${mvo.memName }</td>
                                            <td>${mvo.memId }</td>
                                            <td>${mvo.memNick }</td>
                                            <td>${mvo.memTel }</td>
                                            <td>${mvo.memAdd }</td>
                                            <td>${mvo.memJoindate }</td>
                                            <td>${mvo.memWarncnt }</td>
                                            <td style="padding:10px">
                                            	<a href="javascript:memLock(${mvo.memNo },${mvo.memWarncnt })" class="btn btn-danger btn-icon-split btn-sm" style="margin:0px;height:27px">
                                        			<span class="icon text-white" style="margin:0px">
                                            			<i class="fas fa-lock"></i>
                                        			</span>
                                    			</a>	
                                    			<a href="<c:url value='/admin/mail/mailList?msgaddAdsee=${mvo.memId }&getinFlag=7'/>" class="btn btn-primary btn-icon-split btn-sm" style="margin:0px;height:27px">
                                        			<span class="icon text-white" style="margin:0px">
                                            			<i class="fas fa-envelope"></i>
                                        			</span>
                                    			</a>
                                    		</td>
                                        </tr>
                                        </c:if>
                                    </c:forEach>
                                      
                                    </tbody>
                                </table>
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
