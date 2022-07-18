<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/resume.css'/>">
<script type="text/javascript" 
	src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>

<script type="text/javascript">
	

</script>






	 

	<form name='frm1' action="<c:url value='/request/recpreWrite'/>" method="post">
	<input type="hidden" name="recNo" value="${rvo.recNo }">
    <input type="hidden" name="memNo" value="${mvo.memNo }">
    <!-- ===== Start of Main Wrapper Candidate Profile Section ===== -->
    <section class="ptb80" id="candidate-profile">
	    <section class="page-header">
	        <div class="container">
	            <!-- Start of Page Title -->
	            <div class="row">
	                <div class="col-md-12">
	                    <h1>지원하기</h1>
	                </div>
	            </div>
	        </div>
	    </section>
	    <div class="container" style="text-align: center;">
	    	<div class="row">
        		<div class="col-md-12">
        		<br>
        		<div class="form-group" style=" margin-top: 20px;">
                            <label>지원 의뢰&nbsp; : &nbsp;</label><span class="title">&nbsp;${rvo.recTitle }&nbsp;</span>
                        </div>
				</div>
			</div>
		</div>
		
		

        <div class="container">
        
				
            <!-- Start of Row -->
            <div class="row candidate-profile nomargin">            
                <!-- Start of Profile Description -->
                <div class="col-md-9 col-xs-12">
                    <div class="profile-descr">
						 
                        <!-- Profile Title -->
                        <div class="form-group"  style="border-bottom: 1px solid black;">
			                      <ul class="list list-introduction">                              
		                            <li>
		                                 <label>이름&nbsp; : &nbsp;</label><span>${mvo.memName}</span>
		                            </li>
		                            <br>
		                            <li>
		                                 <label>주소&nbsp; : &nbsp;</label><span>${mvo.memAdd}</span><br>
				                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                        <span>${mvo.memAdd2}</span>                                          
		                            </li>
		                            <br>
		                             <li>
		                                <label>연락가능시간</label><sapn>${resvo.resTime }</sapn>                                     
		                            </li>
		                            <br>
		                            <li>
		                                <i class="fa fa-birthday-cake"></i>
		                                <span>${mvo.memBirth}</span>
		                            </li>
									<br>
		                            <li>
		                                <i class="fa fa-phone"></i>
		                                <span>${mvo.memTel}</span>
		                            </li>
									<br>
		                            <li>
		                                <i class="fa fa-envelope"></i>
		                                <span>${mvo.memId}</span>
		                            </li>
		                            <br>
		                             <li>
		                                 <label>자기소개서</label>
		                                <sapn>${resvo.resContent }</sapn>
		                            </li>
		                        </ul>
                            </div>
                        </div> 
				
                </div>
                <!-- End of Profile Description -->

            </div>
            <!-- End of Row -->
            <!-- Start of Row -->
            <div class="row skills mt40">
                <div class="form-group" style="text-align: center">
                     <label>지원자 제의 사항 <span>(optional)</span></label>
                     <textarea class="tinymce" name="recpreContent" id="recpreContent"></textarea>
                </div>
			</div>	
           </div>
           
                
    </section>
    <!-- ===== End of Candidate Profile Section ===== -->





    <!-- ===== Start of Portfolio Section ===== -->
    <section class="portfolio ptb80">
        <div class="container">

            
					
			<div class="form-group pt30 nomargin" id="last">
                    <input type="submit" class="btn btn-blue btn-effect" value="지원">
			<a href="<c:url value='/'/>" class="btn btn-blue btn-effect">취소</a>
            </div>
        </div>
                        
    </section>
    <input type="hidden" name="chkId" id="chkId1">
  </form>	

<%@ include file="../inc/footer.jsp" %>