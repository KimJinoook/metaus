<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/resume.css'/>">
<script type="text/javascript">
$(function(){
	$('form[name=frmDelete]').submit(function(){
		if(confirm('삭제하시겠습니까?')){
			if($.trim($('input[name=portNo]').val()).length<1){
				event.preventDefault();
			}
		}else{
			event.preventDefault();
		}
	});
});
</script>
 <section class="ptb80" id="job-page">
 	<section class="page-header">
        <div class="container">
            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h1>Portfolio</h1>
                </div>
            </div>
            <!-- End of Page Title -->
        </div>
    </section>
    
    <!-- Start of Post Resume Form -->
    
 <section class="ptb80" id="post-job">
        <div class="container">
            <form name="frmDelete" action="<c:url value='/resume/portfolioDetail'/>" class="post-job-resume mt50" method="post" enctype="multipart/form-data">
            <input type="hidden" name="portNo"  value="${pvo.portNo }">
               <div class="row candidate-profile nomargin">            
                <!-- Start of Profile Description -->
                <div class="col-md-9 col-xs-12">
                    <div class="profile-descr">
						 
                        <!-- Profile Title -->
                        <div class="form-group" style="font-size: 17px;" align="center">
                           <!--  <label>포트폴리오제목 : </label>&nbsp; -->
                            <span class="title">< &nbsp;${pvo.portTitle }&nbsp; ></span>
                        </div>
                        <br>
                         
                        <br>
                        
                        
                        <div class="base">
							<div class="row skills mt40">
	
				                <div class="col-md-12 text-center" >
				                    <h2 class="header2">작업 파일</h2>
				                </div>
								<div class="form-group">
									
									<ul class="list list-introduction">
										<li class="item">
				                     		<div class="content">
					                     		${pvo.portOriginname}
				                     		</div>
									                    
										</li>
									</ul>
									
				                </div>
							</div>
						</div>
                        
                        <br>
                        
                        <div class="base">
							<div class="row skills mt40">
	
				                <div class="col-md-12 text-center" >
				                    <h2 class="header2">작업 내용</h2>
				                </div>
								<div class="form-group">
									
									<ul class="list list-introduction">
										<li class="item">
				                     		<div class="content">
					                     		${pvo.portContent}
				                     		</div>
									                    
										</li>
									</ul>
									
				                </div>
							</div>
						</div>
                                     
                      
                        <br>             
					  </div>	
                    </div>
                </div>
                <!-- End of Resume Details -->

            <!-- End of Post Resume Form -->
		</div>
        
    </section>
    <!-- ===== End of Main Wrapper Section ===== -->
 </section>           


				<section class="portfolio ptb80">
        			<div class="container">
						
                        <!-- Form Group -->
                        <div class="form-group pt30 nomargin" id="last">
                            <input type="submit" class="btn btn-blue btn-effect" value="삭제">
                            <a href="<c:url value='/resume/resumeDetail'/>" class="btn btn-blue btn-effect">취소</a>
                        </div>
                    </div>
                </section> 
            </form>
 
     

        
 
<%@ include file="../inc/footer.jsp" %>