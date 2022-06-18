<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/resume.css'/>">

 <section class="ptb80" id="job-page">
 	<section class="page-header">
        <div class="container">
            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>Portfolio</h2>
                </div>
            </div>
            <!-- End of Page Title -->
        </div>
    </section>
    
    <!-- Start of Post Resume Form -->
    
 <section class="ptb80" id="post-job">
        <div class="container">
            <form action="#" class="post-job-resume mt50">

                <!-- Start of Resume Details -->
                <div class="row">
                    <div class="col-md-12">

                        <!-- Form Group -->
                        <div class="form-group">
                            <label>포트폴리오 제목</label>
                            <input class="form-control" type="text"  placeholder="제목을 입력하세요" required>
                        </div>               

                        <!-- Form Group -->
                        <div class="form-group">
                            <label>작업 사진<span>(zip파일만 가능)</span></label>

                            <!-- Upload Button -->
                            <div class="upload-file-btn">
                                <span><i class="fa fa-upload"></i> Upload</span>
                                <input type="file" name="application_attachment" accept=".zip">
                            </div>
                        </div>

                        <!-- Form Group -->
                        <div class="form-group">
                            <label>작업 내용</label>
                            <textarea class="tinymce"></textarea>
                        </div>

                        <!-- Form Group -->
                        <div class="form-group pt30 nomargin" id="last">
                            <button class="btn btn-blue btn-effect">submit</button>
                        </div> 

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