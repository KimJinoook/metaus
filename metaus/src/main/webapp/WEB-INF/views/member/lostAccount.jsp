<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp" %>




	<!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>회원가입</h2>
                </div>
            </div>
            <!-- End of Page Title -->

        </div>
    </section>
    <!-- =============== End of Page Header 1 Section =============== -->





    <!-- ===== Start of Login - Register Section ===== -->
    <section class="ptb80" id="register">
        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <!-- Start of Nav Tabs -->
                    <ul class="nav nav-tabs" role="tablist">

                        <!-- Personal Account Tab -->
                        <li role="presentation" class="active">
                            <a href="#personal" aria-controls="personal" role="tab" data-toggle="tab" aria-expanded="true">
                                <h6>일반회원</h6>
                                <span>I'm creater</span>
                            </a>
                        </li>

                        <!-- Company Account Tab -->
                        <li role="presentation" class="">
                            <a href="#company" aria-controls="company" role="tab" data-toggle="tab" aria-expanded="false">
                                <h6>기업회원</h6>
                                <span>We are looking for creater</span>
                            </a>
                        </li>
                    </ul>
                    <!-- End of Nav Tabs -->



                    <!-- Start of Tab Content -->
                    <div class="tab-content ptb60">

                        <!-- Start of Tabpanel for Personal Account -->
                        <div role="tabpanel" class="tab-pane active" id="personal">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <input type="text" class="form-control">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input type="text" class="form-control">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>E-mail</label>
                                        <input type="email" class="form-control">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" class="form-control">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group mb30">
                                        <label>Confirm Password</label>
                                        <input type="password" class="form-control">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group text-center">
                                        <input type="checkbox" id="agree">
                                        <label for="agree">Agree with the <a href="#">Terms and Conditions</a></label>
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group text-center nomargin">
                                        <button type="submit" class="btn btn-blue btn-effect">create account</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- End of Tabpanel for Personal Account -->

                        <!-- Start of Tabpanel for Company Account -->
                        <div role="tabpanel" class="tab-pane" id="company">
                            <div class="row">
                            <form method="post" action="<c:url value='/company/companyRegister'/>">

                                <!-- Start of the First Column -->
                                <div class="col-md-6">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>아이디</label>
                                        <input type="text" class="form-control" id="comId" name="comId">
                                        <input type="hidden" class="form-control" id="isComIdCheck" name="comIdCheck">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>비밀번호</label>
                                        <input type="password" class="form-control" id="comPw" name="comPw">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>회사명</label>
                                        <input type="text" class="form-control" id="comName" name="comName">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>주소</label>
                                        <input type="text" class="form-control" id="comAdd" name="comAdd">
                                        <input type="hidden" class="form-control" id="comLati" name="comLati">
                                        <input type="hidden" class="form-control" id="comLongi" name="comLongi">
                                    </div>
                                    
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>사업자 등록번호</label>
                                        <input type="text" class="form-control" id="comRrn" name="comRrn"  placeholder="'-'를 제외한 등록번호 입력">
                                        <input type="hidden" class="form-control" id="isComRrnCheck" name="isComRrnCheck">
                                    </div>
                                </div>
                                <!-- End of the First Column -->

                                <!-- Start of the Second Column -->
                                <div class="col-md-2">
                                	 <!-- Form Group -->
                                    <div class="form-group">
                                		<label> </label>
                                    	<button type="button" style="margin-top: 5px;margin-bottom:5px" id="comIdCheck"  class="btn btn-blue btn-effect form-control">중복확인</button>
                                   	</div>
                                </div>
                                
                                
                                
                                <div class="col-md-6">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>비밀번호 확인</label><label id="comPwCheckLb" style="color: red"></label>
                                        <input type="password" class="form-control" id="comPwCheck">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>대표자명</label>
                                        <input type="text" class="form-control" id="comCeo" name="comCeo">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>전화번호</label>
                                        <input type="tel" class="form-control" id="comTel" name="comTel" placeholder="'-'를 제외한 전화번호 입력">
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                	 <!-- Form Group -->
                                    <div class="form-group">
                                		<label>개업일</label>
                                    	<input type="text" class="form-control" id="comOpen" placeholder="예) 20010101">
                                   	</div>
                                </div>
                                <div class="col-md-2">
                                	 <!-- Form Group -->
                                    <div class="form-group">
                                		<label> </label>
                                    	<button type="button" style="margin-top: 5px" id="comRrnCheck"  class="btn btn-blue btn-effect form-control">등록번호 확인</button>
                                   	</div>
                                </div>
                                
                                <div class="col-md-12">
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>기업소개</label>
                                        <input type="text" class="form-control" name="comPreview" id="comPreview">
                                    </div>
                                </div>
                                <!-- End of the Second Column -->
                                 <div class="col-md-12 text-center">

                                    <!-- Form Group -->
                                    <div class="form-group nomargin">
                                        <button type="submit" id="btnComSign" class="btn btn-blue btn-effect">회원가입</button>
                                    </div>
                                </div>
                                
                                </form>
                            </div>
                        </div>
                        <!-- End of Tabpanel for Company Account -->

                    </div>
                    <!-- End of Tab Content -->

                </div>
            </div>
        </div>
    </section>
    <!-- ===== End of Login - Register Section ===== -->
<%@ include file="../inc/footer.jsp" %>
