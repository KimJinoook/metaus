<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/resume.css'/>">
<script type="text/javascript" 
	src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>

<script type="text/javascript">
	$(function(){
		$('form[name=frm1]').submit(function(){
			var content = $("#resContent").val();
			if($('#chkId1').val()!='Y'){
				alert("제목을 입력 하세요");
				$("#resTitle").focus();
				event.preventDefault();	
			}else if($("[name=resTime1]").val().length<1){
				alert("연락가능 시간을 입력 하세요");
				$("[name=resTime1]").focus();
				event.preventDefault();
			}else if($("[name=resTime2]").val().length<1){
				alert("연락가능 시간을 입력 하세요");
				$("[name=resTime2]").focus();
				event.preventDefault();
			}else if(content=="" || content ==null || content == "&nbsp;" || content == "<p>&nbsp;</p>"){
				alert("자기소개서를 입력 하세요");
				$("#resContent").focus();
				event.preventDefault();
			}
	}); 
	
		
	$('#resTitle').keyup(function(){
		var img="";
		if($('#resTitle').val()==""){
			img="<img scr='../images/portfolio/엑스.png'>";
			$('#chkId1').val('N');
		}else{
			img="<img scr='../images/portfolio/체크.png'>";
			$('#chkId1').val('Y');
		}	
		$('.error').text(img);
	});

});

</script>






	 

	<form name='frm1' action="<c:url value='/resume/resumeEdit'/>" method="post">
	<input type="hidden" name="memNo" value="${mvo.memNo }">
    <!-- ===== Start of Main Wrapper Candidate Profile Section ===== -->
    <section class="ptb80" id="candidate-profile">
	    <section class="page-header">
	        <div class="container">
	            <!-- Start of Page Title -->
	            <div class="row">
	                <div class="col-md-12">
	                    <h2>Resume</h2>
	                </div>
	            </div>
	        </div>
	    </section>
			<div>
				<input type="text" class="live-search-box form-control mt20 ss" 
				name="resTitle" id="resTitle" placeholder="제목을 입력하세요" value="${rvo.resTitle }">
				<span class="error"></span>
			</div>
                        
        <div class="container">
				
            <!-- Start of Row -->
            <div class="row candidate-profile nomargin">            
                <!-- Start of Profile Description -->
                <div class="col-md-9 col-xs-12">
                    <div class="profile-descr">
						 
                        <!-- Profile Title -->
                        
                        <div class="form-group">
                            <label>이름 : </label><span>${mvo.memName}</span>
                          
                        </div>
                    
                        <div class="form-group">
                        	<label>주소 : </label><span>${mvo.memAdd}</span><br>
                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        	<span>${mvo.memAdd2}</span>                                                                                                                                                    
                        </div>

                    <label>연락가능시간</label>
                	<div class="job-search-form row">

		                <!-- Start of keywords input -->
		                <div class="col-md-3 col-sm-12 search-categories">
							<select class="selectpicker" id="search-categories" data-live-search="true" title="클릭하세요" data-size="3" data-container="body" name="resTime1">
		                        		<option value="AM 09">AM 09</option>
				                        <option value="AM 10">AM 10</option>
				                        <option value="AM 11">AM 11</option>
				                        <option value="PM 12">PM 12</option>
				                        <option value="PM 13">PM 13</option>
				                        <option value="PM 14">PM 14</option>
				                        <option value="PM 15">PM 15</option>
				                        <option value="PM 16">PM 16</option>
				                        <option value="PM 17">PM 17</option>
				                        <option value="PM 18">PM 18</option>
				                        <option value="PM 19">PM 19</option>
		                    </select>                
		                    </div>
						
		         	</div>	
		         	<h5>~</h5>
		         	<div class="job-search-form row">
		                <div class="col-md-3 col-sm-12 search-categories">
		                    
		                    <select class="selectpicker" id="search-categories" data-live-search="true" title="클릭하세요" data-size="5" data-container="body" name="resTime2">
		                        		<option value="AM 10">AM 10</option>
				                        <option value="AM 11">AM 11</option>
				                        <option value="PM 12">PM 12</option>
				                        <option value="PM 13">PM 13</option>
				                        <option value="PM 14">PM 14</option>
				                        <option value="PM 15">PM 15</option>
				                        <option value="PM 16">PM 16</option>
				                        <option value="PM 17">PM 17</option>
				                        <option value="PM 18">PM 18</option>
				                        <option value="PM 19">PM 19</option>
				                        <option value="PM 20">PM 20</option>
		                    </select>
		                </div>
						  
					</div> 
					
						
                        <!-- Profile Details -->
                        

                        <ul class="profile-info mt20 nopadding">                        
                            <li>
                                <i class="fa fa-birthday-cake"></i>
                                <span>${mvo.memBirth}</span>
                            </li>

                            <li>
                                <i class="fa fa-phone"></i>
                                <span>${mvo.memTel}</span>
                            </li>

                            <li>
                                <i class="fa fa-envelope"></i>
                                <span>${mvo.memId}</span>
                            </li>
                        </ul>

                    </div>
                </div>
                <!-- End of Profile Description -->

            </div>
            <!-- End of Row -->


            <!-- Start of Row -->
            <div class="row skills mt40">

                <div class="col-md-12 text-center">
                    <h3 class="pb40">자기소개서</h3>
                </div>
				
				<div class="form-group">
                     <label>job description <span>(optional)</span></label>
                     <textarea class="tinymce" name="resContent" id="resContent"  >${rvo.resContent }</textarea>
                </div>
			</div>	
           </div>     
    </section>
    <!-- ===== End of Candidate Profile Section ===== -->





    <!-- ===== Start of Portfolio Section ===== -->
    <section class="portfolio ptb80">
        <div class="container">

            
					
			<div class="form-group pt30 nomargin" id="last">
                    <input type="submit" class="btn btn-blue btn-effect" value="등록">
			<a href="<c:url value='/'/>" class="btn btn-blue btn-effect">취소</a>
            </div>
        </div>
                        
    </section>
    <input type="text" name="chkId" id="chkId1">
  </form>	

<%@ include file="../inc/footer.jsp" %>