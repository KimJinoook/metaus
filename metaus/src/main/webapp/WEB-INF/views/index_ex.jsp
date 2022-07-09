<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <%@ include file="inc/header-ta.jsp" %>

                    <!-- ===== Start of Main Search Section ===== -->
                    <section class="main overlay-black">
                        <img src="/images/mainlogo_daemunjjack.png" alt="">
                    </section>
                    <!-- ===== End of Main Search Section ===== -->

                    <section>
                        <div>
                            <canvas id="canvas" width="300px" height="300px"></canvas>

                        </div>
                    </section>
                    <script async src="https://unpkg.com/es-module-shims@1.3.6/dist/es-module-shims.js"></script>
                    <script type="importmap">
				{
					"imports":{
						"three": "<c:url value='/js/three.module.js'/>",
						"GLTFLoader" : "https://unpkg.com/three@0.141.0/examples/jsm/loaders/GLTFLoader.js",
						"OrbitControls" : "https://unpkg.com/three@0.141.0/examples/jsm/controls/OrbitControls.js"
					}
				}
			</script>
                    <script type="module">
                        import { GLTFLoader } from 'GLTFLoader';
                        import { OrbitControls } from 'OrbitControls';
                        import * as THREE from 'three';

                        let scene = new THREE.Scene();
                        let renderer = new THREE.WebGLRenderer({
                            canvas: document.querySelector('#canvas'),
                            antialias: true
                        });
                        renderer.outputEncoding = THREE.sRGBEncoding;


                        let camera = new THREE.PerspectiveCamera(30, 1);
                        camera.position.set(0, 0, 5)

                        let controls = new OrbitControls(camera, renderer.domElement);
                        controls.update();

                        scene.background = new THREE.Color('white');


                        const grid = new THREE.GridHelper(20, 20, 0x000000, 0x000000);
                        grid.material.opacity = 0.2;
                        grid.material.transparent = true;
                        grid.position.y = -1;
                        scene.add(grid);

                        let loader = new GLTFLoader();
                        loader.load('gltfmodel/shiba/scene.gltf', function (gltf) {
                            scene.add(gltf.scene);
                            function animate() {
                                requestAnimationFrame(animate)
                                controls.update();
                                renderer.render(scene, camera);
                                gltf.scene.rotation.y += 0.005;
                            }
                            animate();
                        });

                    </script>


                    <!-- ===== Start of Popular Categories Section ===== -->
                    <section class="ptb80" id="categories">
                        <div class="container">

                            <div class="section-title">
                                <h2>What is Meta Us? &nbsp; </h2>
                            </div>

                            <div class="row nomargin">
                                <!-- Start of Category div -->
                                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                                    <div class="category ptb30">

                                        <!-- Icon -->
                                        <div class="category-icon">
                                            <i class="fa fa-line-chart"></i>
                                        </div>

                                        <!-- Category Info - Title -->
                                        <div class="category-info pt30">
                                            <a href="#">업무 향상성</a>

                                        </div>

                                        <!-- Category Description -->
                                        <div class="category-descr">
                                            <span>빠르고 간편하지만 효율성을 놓치는 법이 없습니다.</span>
                                        </div>

                                    </div>
                                </div>
                                <!-- End of Category div -->

                                <!-- Start of Category div -->
                                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                                    <div class="category ptb30">

                                        <!-- Icon -->
                                        <div class="category-icon">
                                            <i class="fa fa-university"></i>
                                        </div>

                                        <!-- Category Info - Title -->
                                        <div class="category-info pt30">
                                            <a href="#">멀리서도 가까이&nbsp;</a>

                                        </div>

                                        <!-- Category Description -->
                                        <div class="category-descr">
                                            <span>만나지 못 해서 생기는 소통의 빈 공간을 메타어스가 보조해줍니다. 가상 공간에서의 커뮤니티를 이용해보세요.</span>
                                        </div>

                                    </div>
                                </div>
                                <!-- End of Category div -->

                                <!-- Start of Category div -->
                                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                                    <div class="category ptb30">

                                        <!-- Icon -->
                                        <div class="category-icon">
                                            <i class="fa fa-pencil"></i>
                                        </div>

                                        <!-- Category Info - Title -->
                                        <div class="category-info pt30">
                                            <a href="#">생산성</a>
                                            <p>(36 open positions)</p>
                                        </div>

                                        <!-- Category Description -->
                                        <div class="category-descr">
                                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has
                                                been the standard
                                                dummy text since 1500s.</span>
                                        </div>

                                    </div>
                                </div>
                                <!-- End of Category div -->

                                <!-- Start of Category div -->
                                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                                    <div class="category ptb30">

                                        <!-- Icon -->
                                        <div class="category-icon">
                                            <i class="fa fa-umbrella"></i>
                                        </div>

                                        <!-- Category Info - Title -->
                                        <div class="category-info pt30">
                                            <a href="#">편리함</a>
                                            <p>(6 open positions)</p>
                                        </div>

                                        <!-- Category Description -->
                                        <div class="category-descr">
                                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has
                                                been the standard
                                                dummy text since 1500s.</span>
                                        </div>

                                    </div>
                                </div>
                                <!-- End of Category div -->
                            </div>


                            <div class="row pt40 nomargin">
                                <!-- Start of Category div -->
                                <div class="section-title">
                                    <h2> We're here for You! </h2>&nbsp;</h2>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">

                                    <div class="category ptb30">

                                        <!-- Icon -->
                                        <div class="category-icon">
                                            <i class="fa fa-desktop"></i>
                                        </div>

                                        <!-- Category Info - Title -->
                                        <div class="category-info pt30">
                                            <a href="#">프리랜서</a>
                                            <p>(22 open positions)</p>
                                        </div>

                                        <!-- Category Description -->
                                        <div class="category-descr">
                                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has
                                                been the standard
                                                dummy text since 1500s.</span>
                                        </div>

                                    </div>
                                </div>
                                <!-- End of Category div -->

                                <!-- Start of Category div -->
                                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                                    <div class="category ptb30">

                                        <!-- Icon -->
                                        <div class="category-icon">
                                            <i class="fa fa-line-chart"></i>
                                        </div>

                                        <!-- Category Info - Title -->
                                        <div class="category-info pt30">
                                            <a href="#">기업&nbsp;</a>
                                            <p>(14 open positions)</p>
                                        </div>

                                        <!-- Category Description -->
                                        <div class="category-descr">
                                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has
                                                been the standard
                                                dummy text since 1500s.</span>
                                        </div>

                                    </div>
                                </div>
                                <!-- End of Category div -->

                                <!-- Start of Category div -->
                                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                                    <div class="category ptb30">

                                        <!-- Icon -->
                                        <div class="category-icon">
                                            <i class="fa fa-heart"></i>
                                        </div>

                                        <!-- Category Info - Title -->
                                        <div class="category-info pt30">
                                            <a href="#">학생</a>
                                            <p>(7 open positions)</p>
                                        </div>

                                        <!-- Category Description -->
                                        <div class="category-descr">
                                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has
                                                been the standard
                                                dummy text since 1500s.</span>
                                        </div>

                                    </div>
                                </div>
                                <!-- End of Category div -->

                                <!-- Start of Category div -->
                                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                                    <div class="category ptb30">

                                        <!-- Icon -->
                                        <div class="category-icon">
                                            <i class="fa fa-lightbulb-o"></i>
                                        </div>

                                        <!-- Category Info - Title -->
                                        <div class="category-info pt30">
                                            <a href="#">그 외의 모두들.&nbsp;</a>
                                            <p>(4 open positions)</p>
                                        </div>

                                        <!-- Category Description -->
                                        <div class="category-descr">
                                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has
                                                been the standard
                                                dummy text since 1500s.</span>
                                        </div>

                                    </div>
                                </div>
                                <!-- End of Category div -->
                            </div>

                            <div class="col-md-12 mt60 text-center">
                                <a href="search-jobs-1.html" class="btn btn-blue btn-effect nomargin">browse all</a>
                            </div>

                        </div>
                    </section>
                    <!-- ===== End of Popular Categories Section ===== -->





                    <!-- ===== Start of Signup & Video Section ===== -->
                    <section id="signup-video">
                        <div class="container-fluid">
                            <div class="row">

                                <!-- Start of Signup Column -->
                                <div class="col-md-6 signup-sec ptb80 text-center">

                                    <div class="col-md-8 col-md-offset-2">

                                        <!-- Section Title -->
                                        <div class="section-title">
                                            <h5 class="text-white">멀리서라도 바로 옆에 있는 것 같은 존재감.&nbsp;&nbsp;</h5>
                                        </div>

                                        <p class="text-white mt20">Lorem Ipsum is simply dummy text of the printing and
                                            typesetting
                                            industry. Lorem Ipsum has been the industry's standard dummy text ever since
                                            the 1500s.
                                            Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                        </p>
                                        <a href="register.html" class="btn btn-purple btn-effect mt80">signup now!</a>


                                    </div>


                                </div>
                                <!-- End of Signup Column -->


                                <!-- Start of Video Column -->
                                <div class="col-md-6 video-sec overlay-gradient">
                                    <a href="http://vimeo.com/99876106" class="popup-video"><i
                                            class="fa fa-play"></i></a>
                                </div>
                                <!-- End of Video Column -->

                            </div>
                        </div>
                    </section>
                    <!-- ===== End of Signup & Video Section ===== -->





                    <!-- ===== Start of Job Post Section ===== -->
                    <section class="ptb80" id="job-post">
                        <div class="container">

                            <!-- Start of Job Post Main -->
                            <div class="col-md-8 col-sm-12 col-xs-12 job-post-main">
                                <h2 class="capitalize"><i class="fa fa-briefcase">&nbsp;(모집 중인 공고들 추가 예정)&nbsp;</i></h2>

                                <!-- Start of Job Post Wrapper -->
                                <div class="job-post-wrapper mt60">

                                    <!-- Start of Single Job Post 1 -->
                                    <div class="single-job-post row nomargin">
                                        <!-- Job Company -->
                                        <div class="col-md-2 col-xs-3 nopadding">
                                            <div class="job-company">
                                                <a href="company-page-1.html">
                                                    <img src="images/companies/envato.svg" alt="">
                                                </a>
                                            </div>
                                        </div>

                                        <!-- Job Title & Info -->
                                        <div class="col-md-8 col-xs-6 ptb20">
                                            <div class="job-title">
                                                <a href="job-page.html">php senior developer</a>
                                            </div>

                                            <div class="job-info">
                                                <span class="company"><i class="fa fa-building-o"></i>envato</span>
                                                <span class="location"><i class="fa fa-map-marker"></i>Melbourn,
                                                    Australia</span>
                                            </div>
                                        </div>

                                        <!-- Job Category -->
                                        <div class="col-md-2 col-xs-3 ptb30">
                                            <div class="job-category">
                                                <a href="javascript:void(0)"
                                                    class="btn btn-green btn-small btn-effect">full time</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Single Job Post 1 -->

                                    <!-- Start of Single Job Post 2 -->
                                    <div class="single-job-post row nomargin">
                                        <!-- Job Company -->
                                        <div class="col-md-2 col-xs-3 nopadding">
                                            <div class="job-company">
                                                <a href="company-page-1.html">
                                                    <img src="images/companies/google.svg" alt="">
                                                </a>
                                            </div>
                                        </div>

                                        <!-- Job Title & Info -->
                                        <div class="col-md-8 col-xs-6 ptb20">
                                            <div class="job-title">
                                                <a href="job-page.html">department head</a>
                                            </div>

                                            <div class="job-info">
                                                <span class="company"><i class="fa fa-building-o"></i>google</span>
                                                <span class="location"><i class="fa fa-map-marker"></i>berlin,
                                                    germany</span>
                                            </div>
                                        </div>

                                        <!-- Job Category -->
                                        <div class="col-md-2 col-xs-3 ptb30">
                                            <div class="job-category">
                                                <a href="javascript:void(0)"
                                                    class="btn btn-purple btn-small btn-effect">part time</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Single Job Post 2 -->

                                    <!-- Start of Single Job Post 3 -->
                                    <div class="single-job-post row nomargin">
                                        <!-- Job Company -->
                                        <div class="col-md-2 col-xs-3 nopadding">
                                            <div class="job-company">
                                                <a href="company-page-1.html">
                                                    <img src="images/companies/facebook.svg" alt="">
                                                </a>
                                            </div>
                                        </div>

                                        <!-- Job Title & Info -->
                                        <div class="col-md-8 col-xs-6 ptb20">
                                            <div class="job-title">
                                                <a href="job-page.html">graphic designer</a>
                                            </div>

                                            <div class="job-info">
                                                <span class="company"><i class="fa fa-building-o"></i>facebook</span>
                                                <span class="location"><i class="fa fa-map-marker"></i>london, UK</span>
                                            </div>
                                        </div>

                                        <!-- Job Category -->
                                        <div class="col-md-2 col-xs-3 ptb30">
                                            <div class="job-category">
                                                <a href="javascript:void(0)"
                                                    class="btn btn-blue btn-small btn-effect">freelancer</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Single Job Post 3 -->

                                    <!-- Start of Single Job Post 4 -->
                                    <div class="single-job-post row nomargin">
                                        <!-- Job Company -->
                                        <div class="col-md-2 col-xs-3 nopadding">
                                            <div class="job-company">
                                                <a href="company-page-1.html">
                                                    <img src="images/companies/envato.svg" alt="">
                                                </a>
                                            </div>
                                        </div>

                                        <!-- Job Title & Info -->
                                        <div class="col-md-8 col-xs-6 ptb20">
                                            <div class="job-title">
                                                <a href="job-page.html">senior UI & UX designer</a>
                                            </div>

                                            <div class="job-info">
                                                <span class="company"><i class="fa fa-building-o"></i>envato</span>
                                                <span class="location"><i class="fa fa-map-marker"></i>Melbourn,
                                                    Australia</span>
                                            </div>
                                        </div>

                                        <!-- Job Category -->
                                        <div class="col-md-2 col-xs-3 ptb30">
                                            <div class="job-category">
                                                <a href="javascript:void(0)"
                                                    class="btn btn-orange btn-small btn-effect">intership</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Single Job Post 4 -->

                                    <!-- Start of Single Job Post 5 -->
                                    <div class="single-job-post row nomargin">
                                        <!-- Job Company -->
                                        <div class="col-md-2 col-xs-3 nopadding">
                                            <div class="job-company">
                                                <a href="company-page-1.html">
                                                    <img src="images/companies/twitter.svg" alt="">
                                                </a>
                                            </div>
                                        </div>

                                        <!-- Job Title & Info -->
                                        <div class="col-md-8 col-xs-6 ptb20">
                                            <div class="job-title">
                                                <a href="job-page.html">senior health advisor</a>
                                            </div>

                                            <div class="job-info">
                                                <span class="company"><i class="fa fa-building-o"></i>twitter</span>
                                                <span class="location"><i class="fa fa-map-marker"></i>New York,
                                                    USA</span>
                                            </div>
                                        </div>

                                        <!-- Job Category -->
                                        <div class="col-md-2 col-xs-3 ptb30">
                                            <div class="job-category">
                                                <a href="javascript:void(0)"
                                                    class="btn btn-red btn-small btn-effect">temporary</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Single Job Post 5 -->

                                </div>
                                <!-- End of Job Post Wrapper -->

                                <!-- Start of Pagination -->
                                <ul class="pagination list-inline text-center">
                                    <li class="active"><a href="javascript:void(0)">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">Next</a></li>
                                </ul>
                                <!-- End of Pagination -->

                            </div>
                            <!-- End of Job Post Main -->


                            <!-- Start of Job Post Sidebar -->
                            <div class="col-md-4 col-xs-12 job-post-sidebar">
                                <h2 class="capitalize"><i class="fa fa-star"></i>golden jobs</h2>

                                <!-- Start of Featured Job Widget -->
                                <div class="featured-job widget mt60">

                                    <!-- Start of Company Logo -->
                                    <div class="company">
                                        <img src="images/companies/cloudify.svg" alt="">
                                    </div>
                                    <!-- End of Company Logo -->

                                    <!-- Start of Featured Job Info -->
                                    <div class="featured-job-info">

                                        <!-- Job Title -->
                                        <div class="job-title">
                                            <h5 class="uppercase pull-left">ui designer</h5>
                                            <a href="javascript:void(0)"
                                                class="btn btn-green btn-small btn-effect pull-right">full
                                                time</a>
                                        </div>

                                        <!-- Job Info -->
                                        <div class="job-info pt5">
                                            <span id="company"><i class="fa fa-building-o"></i>cloudify</span>
                                            <span id="location"><i class="fa fa-map-marker"></i>london, uk</span>
                                        </div>

                                        <p class="mt20"> Lorem Ipsum is simply dummy text of the printing and
                                            typesetting industry.
                                            Lorem Ipsum has been the industry's standard dummy text ever since the
                                            1500s.</p>

                                        <!-- View Job Button -->
                                        <div class="text-center mt20">
                                            <a href="job-page.html" class="btn btn-purple btn-small btn-effect">view
                                                job</a>
                                        </div>
                                    </div>
                                    <!-- End of Featured Job Info -->

                                </div>
                                <!-- End of Featured Job Widget -->

                                <!-- Start of Upload Resume Widget -->
                                <div class="upload-resume widget mt40 text-center">
                                    <h4 class="capitalize">upload your resume</h4>
                                    <p class="mtb10"> Lorem Ipsum is simply dummy text of the printing and typesetting
                                        industry. Lorem
                                        Ipsum has been the industry...</p>

                                    <a href="submit-resume.html" class="btn btn-blue btn-effect mt10">upload resume</a>
                                </div>
                                <!-- End of Upload Resume Widget -->
                            </div>
                            <!-- End of Job Post Sidebar -->

                        </div>
                    </section>
                    <!-- ===== End of Job Post Section ===== -->





                    <!-- ===== Start of CountUp Section ===== -->
                    <section class="ptb40" id="countup">
                        <div class="container">

                            <!-- 1st Count up item -->
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <span class="counter" data-from="0" data-to="743"></span>
                                <h4>이루어진 인연들&nbsp;</h4>
                            </div>

                            <!-- 2nd Count up item -->
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <span class="counter" data-from="0" data-to="579"></span>
                                <h4>사용중인 사람들&nbsp;</h4>
                            </div>

                            <!-- 3rd Count up item -->
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <span class="counter" data-from="0" data-to="251"></span>
                                <h4>월 평균 동시 접속자&nbsp;&nbsp;</h4>
                            </div>

                            <!-- 4th Count up item -->
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <span class="counter" data-from="0" data-to="330"></span>
                                <h4>( 공란 )&nbsp;</h4>
                            </div>
                        </div>
                    </section>
                    <!-- ===== End of CountUp Section ===== -->





                    <!-- ===== Start of Testimonial Section ===== -->
                    <section class="ptb80" id="testimonials">
                        <div class="container">

                            <!-- Section Title -->
                            <div class="section-title">
                                <h2 class="text-white">한 줄 평을 남기기</h2>
                            </div>


                            <!-- Start of Owl Slider -->
                            <div class="owl-carousel testimonial">

                                <!-- Start of Slide item -->
                                <div class="item">
                                    <div class="review">
                                        <blockquote> 코로나 때문에 업무를 보러기기 어려운 상황에서도 메터어스 덕분에 성공적인 업무 미팅을 이끌어 낼 수 있었습니다.
                                        </blockquote>
                                    </div>
                                    <div class="customer">
                                        <img src="images/clients/client1.jpg" alt="">
                                        <h4 class="uppercase pt20">기업 사용자</h4>
                                    </div>
                                </div>
                                <!-- End Slide item -->

                                <!-- Start of Slide item -->
                                <div class="item">
                                    <div class="review">
                                        <blockquote>요즘 같이 만나기 조심스러운 상황에서 적절한 대처 방법인 것 같아요 :)</blockquote>
                                    </div>
                                    <div class="customer">
                                        <img src="images/clients/client2.jpg" alt="">
                                        <h4 class="uppercase pt20">VOD수강자</h4>
                                    </div>
                                </div>
                                <!-- End Slide item -->

                                <!-- Start of Slide item -->
                                <div class="item">
                                    <div class="review">
                                        <blockquote>직장 동료들을 오랫 동안 못 봐왔었는데, 덕분에 가까이에 있는 듯한 느낌을 받았어요.</blockquote>
                                    </div>
                                    <div class="customer">
                                        <img src="images/clients/client3.jpg" alt="">
                                        <h4 class="uppercase pt20">기업 사용자</h4>
                                    </div>
                                </div>
                                <!-- End Slide item -->

                            </div>
                            <!-- End of Owl Slider -->

                        </div>
                    </section>
                    <!-- ===== End of Testimonial Section ===== -->





                    <!-- ===== Start of Latest News Section ===== -->
                    <section id="latest-news">
                        <div class="container">

                            <!-- Section Title -->
                            <div class="section-title">
                                <h2>latest news</h2>
                            </div>

                            <!-- Start of Blog Post -->
                            <div class="col-md-4 col-xs-12">
                                <div class="blog-post">
                                    <!-- Blog Post Image -->
                                    <div class="blog-post-thumbnail">
                                        <a href="blog-post.html" class="hover-link">
                                            <img src="images/blog/blog1.jpg" alt="">
                                        </a>
                                    </div>

                                    <!-- Blog Post Info -->
                                    <div class="post-info">
                                        <a href="blog-post.html">메타버스의 추억.&nbsp;</a>

                                        <div class="post-details">
                                            <span class="date"><i class="fa fa-calendar"></i>September 7, 2016</span>
                                            <span class="comments"><i class="fa fa-comment"></i>0 Comments</span>
                                        </div>

                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                            Lorem Ipsum has
                                            been the industry's standard dummy t ext ever since the 1500s....</p>

                                    </div>

                                    <!-- Read More Button -->
                                    <a href="blog-post.html" class="btn btn-blue btn-small btn-effect">read more</a>

                                </div>
                            </div>
                            <!-- End of Blog Post -->

                            <!-- Start of Blog Post -->
                            <div class="col-md-4 col-xs-12">
                                <div class="blog-post">
                                    <!-- Blog Post Image -->
                                    <div class="blog-post-thumbnail">
                                        <a href="blog-post.html" class="hover-link">
                                            <img src="images/blog/blog2.jpg" alt="">
                                        </a>
                                    </div>

                                    <!-- Blog Post Info -->
                                    <div class="post-info">
                                        <a href="blog-post.html">만나기 어려운 이 시국.</a>

                                        <div class="post-details">
                                            <span class="date"><i class="fa fa-calendar"></i>September 7, 2016</span>
                                            <span class="comments"><i class="fa fa-comment"></i>0 Comments</span>
                                        </div>

                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                            Lorem Ipsum has
                                            been the industry's standard dummy t ext ever since the 1500s....</p>

                                    </div>

                                    <!-- Read More Button -->
                                    <a href="blog-post.html" class="btn btn-blue btn-small btn-effect">read more</a>

                                </div>
                            </div>
                            <!-- End of Blog Post -->

                            <!-- Start of Blog Post -->
                            <div class="col-md-4 col-xs-12">
                                <div class="blog-post">
                                    <!-- Blog Post Image -->
                                    <div class="blog-post-thumbnail">
                                        <a href="blog-post.html" class="hover-link">
                                            <img src="images/blog/blog3.jpg" alt="">
                                        </a>
                                    </div>

                                    <!-- Blog Post Info -->
                                    <div class="post-info">
                                        <a href="blog-post.html">정말 이상하리만치 옆에 있는 것 같은 메타...</a>

                                        <div class="post-details">
                                            <span class="date"><i class="fa fa-calendar"></i>September 7, 2016</span>
                                            <span class="comments"><i class="fa fa-comment"></i>0 Comments</span>
                                        </div>

                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                            Lorem Ipsum has
                                            been the industry's standard dummy t ext ever since the 1500s....</p>

                                    </div>

                                    <!-- Read More Button -->
                                    <a href="blog-post.html" class="btn btn-blue btn-small btn-effect">read more</a>

                                </div>
                            </div>
                            <!-- End of Blog Post -->



                        </div>
                    </section>
                    <!-- ===== End of Latest News Section ===== -->
                    <%@ include file="inc/footer.jsp" %>