<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/adminHeader.jsp" %>
<link href="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">
<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">일반 회원 조회</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">일반 회원 조회 결과</h6>
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
                                            <th>빈곳</th>
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
                                            <th>빈곳</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="mvo" items="${list}">
                                        <c:if test="${mvo.memCutdate.getTime() > today.getTime() }">
                                        <tr style="color:red">
                                            <td>${mvo.memName }</td>
                                            <td>${mvo.memId }</td>
                                            <td>${mvo.memNick }</td>
                                            <td>${mvo.memTel }</td>
                                            <td>${mvo.memAdd }</td>
                                            <td>${mvo.memJoindate }</td>
                                            <td>차단</td>
                                            <td></td>
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
                                            <td></td>
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
