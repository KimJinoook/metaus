<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/resume.css'/>">

<script type="text/javascript" 
	src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>

<script type="text/javascript">
	$(function(){
		var img="";
		if($('#portTitle').val().length<1){
			img="제목을 입력하세요";
			$('.error1').text(img);
		}else{
			img="";		
		}
				
		$('#portTitle').keyup(function(){
			if($('#portTitle').val().length<1){
				img="제목을 입력하세요";
			}else{
				img="";
			}
			$('.error1').text(img);
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
            <form name="frm1" action="<c:url value='/resume/portfolio'/>" class="post-job-resume mt50" method="post" enctype="multipart/form-data">
            <input type="hidden" name="memNo" value="${mvo.memNo }">
                <!-- Start of Resume Details -->
                <div class="row">
                    <div class="col-md-12">

                        <!-- Form Group -->
                        <div class="form-group">
                            <label>포트폴리오 제목</label>
                            <input class="form-control" type="text"  name="portTitle" id="portTitle" placeholder="제목을 입력하세요" required>
                        	<span class="error1"></span>
                        </div>               

                        <!-- Form Group -->
                        <div class="form-group">
                            <label>작업 파일<span>(zip,Gltf파일만 가능)</span></label>
							
                            <!-- Upload Button -->
                            <div class="upload-file-btn" style="width:140px">
                                <!-- <span><i class="fa fa-upload"></i> Upload</span> -->
                                <input type="file" name="upfile" accept=".zip">
                               
                            </div>
                        </div>

                        <!-- Form Group -->
                        <div class="form-group">
                            <label>작업 내용</label>
                            <textarea class="tinymce" name="portContent"></textarea>
                        </div>
				<section class="portfolio ptb7">
       	 			<div class="container">
                        <!-- Form Group -->
                        <div class="form-group pt30 nomargin" id="last">
                            <button class="btn btn-blue btn-effect">등록</button>
                            <a href="<c:url value='/resume/resumeDetail'/>" class="btn btn-blue btn-effect">취소</a>
                        </div> 
					</div>
				</section>
                    </div>
                </div>
                <!-- End of Resume Details -->
            </form>
            <!-- End of Post Resume Form -->
		</div>
        
    </section>
    <!-- ===== End of Main Wrapper Section ===== -->
 </section>           


 
     

        
 
<%@ include file="../inc/footer.jsp" %>