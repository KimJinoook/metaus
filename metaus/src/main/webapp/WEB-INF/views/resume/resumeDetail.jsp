<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>


<link rel="stylesheet" type="text/css" href="<c:url value='/css/resume.css'/>">







	 

	<form action="<c:url value='/resume/resumeDetail'/>">
	<input type="hidden" name="memNo" value="${mvo.memNo }">
	<%-- <input type="hidden" name="memNo" value="${rvo.memNo }"> --%>
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

                        
        <div class="container">
				
            <!-- Start of Row -->
            <div class="row candidate-profile nomargin">            
                <!-- Start of Profile Description -->
                <div class="col-md-9 col-xs-12">
                    <div class="profile-descr">
						 
                        <!-- Profile Title -->
                         <div class="form-group">
                            <label>제목</label>
                            <span></span>
                        </div>
                        <div class="form-group">
                            <label>이름</label>
                            <span>${mvo.memName }</span>
                        </div>
                        <div class="form-group">
                            <label>생년월일</label>
                            <span></span>
                        </div>
                        <div class="form-group">
                            <label>이메일</label>
                            <span></span>
                        </div>
                        <div class="form-group">
                            <label>전화번호</label>
                            <span></span>
                        </div>
                        <div class="form-group">
                        	<label>주소</label>                                
                            <span></span>                                                                                        
                        </div>

                    <label>연락가능시간</label>
                	<div class="job-search-form row">

		                <!-- Start of keywords input -->
		                <div class="col-md-3 col-sm-12 search-categories">
							<span></span> <h5>~</h5> <span></span>             
		                    </div>
						
		         	</div>	
		         
					
						
                        <!-- Profile Details -->
                        

                        <ul class="profile-info mt20 nopadding">
                            <li>
                                <i class="fa fa-map-marker"></i>
                                <span>New York, USA</span>
                            </li>

                            <li>
                                <i class="fa fa-globe"></i>
                                <a href="#">cariera.com</a>
                            </li>

                            <li>
                                <i class="fa fa-money"></i>
                                <span>$65 / hour</span>
                            </li>

                            <li>
                                <i class="fa fa-birthday-cake"></i>
                                <span>29 years-old</span>
                            </li>

                            <li>
                                <i class="fa fa-phone"></i>
                                <span>(+1) 123 456 7890</span>
                            </li>

                            <li>
                                <i class="fa fa-envelope"></i>
                                <a href="#">myemail@cariera.com</a>
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
                     <textarea class="tinymce"></textarea>
                </div>
			</div>	
           </div>     
    </section>
    <!-- ===== End of Candidate Profile Section ===== -->





    <!-- ===== Start of Portfolio Section ===== -->
    <section class="portfolio ptb80">
        <div class="container">

            <div class="row">
                <h3 class="text-center pb60">포트폴리오</h3>

                <!-- Filter Buttons -->
                <ul class="list-inline text-center uppercase" id="portfolio-sorting">
                    <li><a href="#0" data-filter="*" class="current">all</a></li>
                    <li><a href="#0" data-filter=".portfolio-cat1">logos</a></li>
                    <li><a href="#0" data-filter=".portfolio-cat2">websites</a></li>
                    <li><a href="#0" data-filter=".portfolio-cat3">ui</a></li>
                    <li><a href="#0" data-filter=".portfolio-cat4">printings</a></li>
                </ul>
            </div>

            <!-- Start of Portfolio Grid -->
            <div class="row portfolio-grid mt40">

                <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat1">
                    <figure>
                        <a href="<c:url value='/resume/portfolio'/>" class="">
                            <img src="../images/portfolio/plus.png" class="img-responsive" id="portfolio" alt="">
                        </a>
                    </figure>
                </div>

                <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat2">
                    <figure>
                        <a href="images/portfolio/image2.jpg" class="hover-zoom">
                            <img src="images/portfolio/image2.jpg" class="img-responsive" alt="">
                        </a>
                    </figure>
                </div>

                <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat3">
                    <figure>
                        <a href="images/portfolio/image3.jpg" class="hover-zoom">
                            <img src="images/portfolio/image3.jpg" class="img-responsive" alt="">
                        </a>
                    </figure>
                </div>

                <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat4">
                    <figure>
                        <a href="images/portfolio/image4.jpg" class="hover-zoom">
                            <img src="images/portfolio/image4.jpg" class="img-responsive" alt="">
                        </a>
                    </figure>
                </div>

                <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat1">
                    <figure>
                        <a href="images/portfolio/image5.jpg" class="hover-zoom">
                            <img src="images/portfolio/image5.jpg" class="img-responsive" alt="">
                        </a>
                    </figure>
                </div>

                <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat2">
                    <figure>
                        <a href="" class="">
                            <img src="images/portfolio/image6.jpg" class="img-responsive" alt="">
                        </a>
                    </figure>
                </div>
				
            </div>
            <!-- End of Portfolio Grid -->

             <div class="row">
                <div class="col-md-12 text-center mt20">
                    <a href="#" class="btn btn-blue btn-effect">show more</a>
                </div>
            </div> 
					
			<div class="form-group pt30 nomargin" id="last">
                    <button class="btn btn-blue btn-effect">submit</button>
            </div>
        </div>
                        
    </section>
  </form>	

<%@ include file="../inc/footer.jsp" %>