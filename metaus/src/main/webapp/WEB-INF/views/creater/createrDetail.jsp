<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp" %>

    <!-- ===== Start of Candidate Profile Header Section ===== -->
    <section class="profile-header">
    </section>
    <!-- ===== End of Candidate Header Section ===== -->





    <!-- ===== Start of Main Wrapper Candidate Profile Section ===== -->
    <section class="pb80" id="candidate-profile2">
        <div class="container">

            <!-- Start of Row -->
            <div class="row candidate-profile">

                <!-- Start of Profile Picture -->
                <div class="col-md-12">
                    <div class="profile-photo">
                        <img src="images/clients/client1.jpg" class="img-responsive" alt="">
                    </div>

                </div>
                <!-- End of Profile Picture -->


                <!-- Start of Profile Description -->
                <div class="col-md-6 col-xs-12 mt80">
                    <div class="profile-descr">

                        <!-- Profile Title -->
                        <div class="profile-title">
                            <h2 class="capitalize">john doe</h2>
                            <h5 class="pt10">Front-End Developer</h5>
                        </div>

                        <!-- Start of Social Media Buttons -->
                        <ul class="social-btns list-inline mt20">
                            <!-- Social Media -->
                            <li>
                                <a href="#" class="social-btn-roll facebook transparent">
                                    <div class="social-btn-roll-icons">
                                        <i class="social-btn-roll-icon fa fa-facebook"></i>
                                        <i class="social-btn-roll-icon fa fa-facebook"></i>
                                    </div>
                                </a>
                            </li>

                            <!-- Social Media -->
                            <li>
                                <a href="#" class="social-btn-roll twitter transparent">
                                    <div class="social-btn-roll-icons">
                                        <i class="social-btn-roll-icon fa fa-twitter"></i>
                                        <i class="social-btn-roll-icon fa fa-twitter"></i>
                                    </div>
                                </a>
                            </li>

                            <!-- Social Media -->
                            <li>
                                <a href="#" class="social-btn-roll google-plus transparent">
                                    <div class="social-btn-roll-icons">
                                        <i class="social-btn-roll-icon fa fa-google-plus"></i>
                                        <i class="social-btn-roll-icon fa fa-google-plus"></i>
                                    </div>
                                </a>
                            </li>

                            <!-- Social Media -->
                            <li>
                                <a href="#" class="social-btn-roll instagram transparent">
                                    <div class="social-btn-roll-icons">
                                        <i class="social-btn-roll-icon fa fa-instagram"></i>
                                        <i class="social-btn-roll-icon fa fa-instagram"></i>
                                    </div>
                                </a>
                            </li>

                            <!-- Social Media -->
                            <li>
                                <a href="#" class="social-btn-roll linkedin transparent">
                                    <div class="social-btn-roll-icons">
                                        <i class="social-btn-roll-icon fa fa-linkedin"></i>
                                        <i class="social-btn-roll-icon fa fa-linkedin"></i>
                                    </div>
                                </a>
                            </li>

                        </ul>
                        <!-- End of Social Media Buttons -->

                        <!-- Profile Details -->
                        <div class="profile-details mt40">
                            <p>Front end developers use HTML, CSS, and JavaScript to code the website and web app designs created by web designers. The code they write runs inside the user’s browser (as opposed to a back end developer, whose code runs on the web server). Being also in charge of making sure that there are no errors or bugs on the front end, as well as making sure that the design appears as it’s supposed to across various platforms and browsers.</p>
                        </div>
                    </div>

                </div>
                <!-- End of Profile Description -->


                <!-- Start of Profile Info -->
                <div class="col-md-4 col-md-offset-2 col-xs-12 mt80">
                    <ul class="profile-info">
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
                <!-- End of Profile Info -->

            </div>
            <!-- End of Row -->


            <!-- Start of Row -->
            <div class="row skills mt80">

                <div class="col-md-12 text-center">
                    <h3 class="pb40">My Skills</h3>
                </div>

                <!-- Start of Skill Charts Wrapper -->
                <div class="col-md-12 mt20">
                    <div class="row">

                        <!-- Chart -->
                        <div class="col-md-2 col-sm-6 col-xs-6 chart mb40" data-percent="90"><span>HTML5</span>
                        </div>

                        <!-- Chart -->
                        <div class="col-md-2 col-sm-6 col-xs-6 chart mb40" data-percent="85"><span>CSS3</span>
                        </div>

                        <!-- Chart -->
                        <div class="col-md-2 col-sm-6 col-xs-6 chart mb40" data-percent="75"><span>JavaScript</span>
                        </div>

                        <!-- Chart -->
                        <div class="col-md-2 col-sm-6 col-xs-6 chart mb40" data-percent="70"> <span>PHP</span>
                        </div>
                        
                        <!-- Chart -->
                        <div class="col-md-2 col-sm-6 col-xs-6 chart mb40" data-percent="65"> <span>MySql</span>
                        </div>
                        
                        <!-- Chart -->
                        <div class="col-md-2 col-sm-6 col-xs-6 chart mb40" data-percent="55"> <span>WordPress</span>
                        </div>

                    </div>
                </div>
                <!-- End of Skill Charts Wrapper -->

            </div>
            <!-- End of Row -->

        </div>
    </section>
    <!-- ===== End of Candidate Profile Section ===== -->





    <!-- ===== Start of Portfolio Section ===== -->
    <section class="portfolio ptb80">
        <div class="container">

            <div class="row">
                <h3 class="text-center pb60">Recent Work</h3>

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
                        <a href="images/portfolio/image1.jpg" class="hover-zoom">
                            <img src="images/portfolio/image1.jpg" class="img-responsive" alt="">
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
                        <a href="images/portfolio/image6.jpg" class="hover-zoom">
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

        </div>
    </section>
    <!-- ===== End of Portfolio Section ===== -->





    <!-- ===== Start of Education Section ===== -->
    <section class="education ptb80">
        <div class="container">

            <div class="col-md-12 text-center">
                <h3 class="pb60">Education</h3>
            </div>

            <!-- Start of Education Column -->
            <div class="col-md-12">
                <div class="item-block shadow-hover">

                    <!-- Start of Education Header -->
                    <div class="education-header clearfix">
                        <img src="images/companies/envato.svg" alt="">
                        <div>
                            <h4>Master <small>- Computer Science</small></h4>
                            <h5>Massachusetts Institute of Technology</h5>
                        </div>
                        <h6 class="time">2014 - 2016</h6>
                    </div>
                    <!-- End of Education Header -->

                    <!-- Start of Education Body -->
                    <div class="education-body">
                        <p>The mission of MIT is to advance knowledge and educate students in science, technology, and other areas of scholarship that will best serve the nation and the world in the 21st century. The Institute is committed to generating, disseminating, and preserving knowledge, and to working with others to bring this knowledge to bear on the world's great challenges.</p>
                    </div>
                    <!-- End of Education Body -->

                </div>
            </div>
            <!-- End of Education Column -->


            <!-- Start of Education Column -->
            <div class="col-md-12 mt40">
                <div class="item-block shadow-hover">

                    <!-- Start of Education Header -->
                    <div class="education-header clearfix">
                        <img src="images/companies/envato.svg" alt="">
                        <div>
                            <h4>Bachelor <small>- Computer Science</small></h4>
                            <h5>Massachusetts Institute of Technology</h5>
                        </div>
                        <h6 class="time">2009 - 2013</h6>
                    </div>
                    <!-- End of Education Header -->

                    <!-- Start of Education Body -->
                    <div class="education-body">
                        <p>The mission of MIT is to advance knowledge and educate students in science, technology, and other areas of scholarship that will best serve the nation and the world in the 21st century. The Institute is committed to generating, disseminating, and preserving knowledge, and to working with others to bring this knowledge to bear on the world's great challenges.</p>
                    </div>
                    <!-- End of Education Body -->

                </div>
            </div>
            <!-- End of Education Column -->

        </div>
    </section>
    <!-- ===== End of Education Section ===== -->





    <!-- ===== Start of Work Experience Section ===== -->
    <section class="work-experience ptb80">
        <div class="container">

            <div class="col-md-12 text-center">
                <h3 class="pb60">Work Experience</h3>
            </div>

            <!-- Start of Work Experience Column -->
            <div class="col-md-12">
                <div class="item-block shadow-hover">

                    <!-- Start of Work Experience Header -->
                    <div class="experience-header clearfix">
                        <img src="images/companies/envato.svg" alt="">
                        <div>
                            <h4>Envato</h4>
                            <h5><small>Theme Developer</small></h5>
                        </div>
                        <h6 class="time">2014 - present</h6>
                    </div>
                    <!-- End of Work Experience Header -->

                    <!-- Start of Work Experience Body -->
                    <div class="experience-body">
                        <p>Responsibilities:</p>
                        <ul class="list mt10">
                            <li>Designing modern and minimal PSD Templates</li>

                            <li>Converting PSD into HTML5 & CSS3</li>

                            <li>WordPress Theme Development</li>

                            <li>Troubleshooting, testing and maintaining web Themes</li>
                        </ul>
                    </div>
                    <!-- End of Work Experience Body -->

                </div>
            </div>
            <!-- End of Work Experience Column -->


            <!-- Start of Work Experience Column -->
            <div class="col-md-12 mt40">
                <div class="item-block shadow-hover">

                    <!-- Start of Work Experience Header -->
                    <div class="experience-header clearfix">
                        <img src="images/companies/envato.svg" alt="">
                        <div>
                            <h4>Envato</h4>
                            <h5><small>Theme Developer</small></h5>
                        </div>
                        <h6 class="time">2010 - 2014</h6>
                    </div>
                    <!-- End of Work Experience Header -->

                    <!-- Start of Work Experience Body -->
                    <div class="experience-body">
                        <p>Responsibilities:</p>
                        <ul class="list mt10">
                            <li>Designing modern and minimal PSD Templates</li>

                            <li>Converting PSD into HTML5 & CSS3</li>
                        </ul>
                    </div>
                    <!-- End of Work Experience Body -->

                </div>
            </div>
            <!-- End of Work Experience Column -->


        </div>
    </section>
    <!-- ===== End of Work Experience Section ===== -->




<%@ include file="../inc/footer.jsp" %>