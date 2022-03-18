<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.hoteldelluna.web.service.FAQDAO"%>
<%@page import="com.hoteldelluna.web.entity.FAQTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
 
<%@page import="javax.sql.DataSource" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%


FAQTO to=new FAQTO();
to.setQ_no(request.getParameter("q_no"));

FAQDAO dao=new FAQDAO();
to=dao.faqView(to);

	String q_no=to.getQ_no();
	String subject=to.getQ_subject();
	String name=to.getQ_name();
	String wdate=to.getQ_date();
	String hit=to.getQ_hit();
	String content=to.getQ_content();
%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Hotel</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/gijgo.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/Smoothness/jquery-ui.css">
<link rel="stylesheet" href="assets/css/cs_manager_view.css">

<script type="text/javascript">

</script>
</head>

<body>

    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <strong>Hotel</b>
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

    <header>
        <!-- Header Start -->
        <div class="header-area header-sticky">
            <div class="main-header ">
                <div class="container">
                    <div class="row align-items-center">
                        <!-- logo -->
                        <div class="col-xl-2 col-lg-2">
                            <div class="logo">
                            <a href="index"><img src="assets/img/logo/logo1.png" width="180" height="70" alt=""></a>
                            </div>
                        </div>
                    <div class="col-xl-8 col-lg-8">
                            <!-- main-menu -->
                            <div class="main-menu f-right d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">                                                                                                                                     
                                        <li><a href="index">Home</a></li>
                                        <li><a href="noticelist">Notice</a></li>
                                        <li><a href="faqlist">FAQ</a></li>
                                        
                                        
                                        <!-- <li><a href="blog.html">Community</a>
                                            <ul class="submenu">
                                                <li><a href="blog.html">Blog</a></li>
                                                <li><a href="single-blog.html">Blog Details</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Pages</a>
                                            <ul class="submenu">
                                                <li><a href="rooms.html">Rooms</a>
                                                <li><a href="elements.html">Element</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="contact.html">Contact</a></li> -->
                                    </ul>
                                </nav>
                            </div>
                        </div>             
                        <div class="col-xl-2 col-lg-2">
                            <!-- header-btn -->
                            <div class="header-btn">
                            	<c:if test="${sessionId == null }">
									<a href="login" class="btn btn1 d-none d-lg-block ">Login / Sign up</a>	
									
								</c:if>
								<%-- <c:if test="${sessionId != null }">
									<a href="logout" class="btn btn1 d-none d-lg-block ">Log Out</a>
								</c:if> --%>
                                <c:if test="${sessionId != null }">
                                	<a href="mypage?userNumber=${userNo}" class="btn btn1 d-none d-lg-block ">My Page</a>	
								</c:if>
                                
                            </div>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
        <!-- Header End -->
    </header>
    <!-- slider Area Start-->
    <div class="slider-area">
        <div class="single-slider hero-overly slider-height2 d-flex align-items-center"
            data-background="assets/img/hero/servicespage_hero.jpg">
            <div class="container">
                <div class="row ">
                    <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                        <div class="hero-caption">
                            <span></span>
                            <h2>FAQ</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->

	<!-- ================ contact section start ================= -->

	<section class="contact-section">
		<div class="container">
			<div class="section-top-border text-left">
				<div class="row">
					<div class="col-md-12">
						<div class="container-large">
							<h1>FAQ</h1>
							<br />
							<br />
							<br />

							<div class="con_txt">
								<div class="contents_sub">
									<!--게시판-->
									<div class="board_view">
										<table>
											<tr>
												<th width="10%">제목</th>
												<td width="60%"><%=subject %></td>
												<th width="10%">등록일</th>
												<td width="20%"><%=wdate %></td>
											</tr>
											<tr>
												<th>글쓴이</th>
												<td><%=name %></td>
												<th>조회</th>
												<td><%=hit %></td>
											</tr>
											<tr>
												<td colspan="4" height="200" valign="top"
													style="padding: 20px; line-height: 160%"><%=content %></td>
											</tr>
										</table>
									</div>
									<div class="btn_area">
										<div class="align_left">
											<input type="button" value="목록" class="btn_list btn_txt02"
												style="cursor: pointer;"
												onclick="location.href='faqlist'" />
										</div>
										
									</div>
									<!--//게시판-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer>
        <!-- Footer Start-->
        <div class="footer-area black-bg footer-padding">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-footer-caption mb-30">
                            <!-- logo -->
                            <div class="footer-logo">
                                <a href="index.html"><img src="assets/img/logo/logo1.png" width="200" height="80"
                                        alt=""></a>
                            </div>
                            <div class="footer-pera">
                                <p>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;
                                    <script>document.write(new Date().getFullYear());</script> DELLUNA <br />All rights
                                    reserved
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-5">
                        <div class="single-footer-caption mb-30">
                            <div class="footer-tittle">
                                <h4>Made By</h4>
                                <ul>
                                    <li>Minsoo Kang</a></li>
                                    <li>Sojeong Kim</a></li>
                                    <li>Kyeongeun Son</a></li>
                                    <li>Kicheol Lee</a></li>
                                    <li>Seho Ji</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3">
                        <div class="single-footer-caption mb-30">
                            <div class="footer-tittle">
                                <h4>Contact</h4>
                                <ul>
                                    <li>alstn9469@hoteldelluna.com</a></li>
                                    <li>sojeong@hoteldelluna.com</a></li>
                                    <li>keson@hoteldelluna.com</a></li>
                                    <li>leekicheol@hoteldelluna.com</a></li>
                                    <li>jiseho19@hoteldelluna.com </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4  col-sm-5">
                        <div class="single-footer-caption mb-30">
                            <div class="footer-tittle">
                                <h4>Our Location</h4>
                                <ul>
                                    <li>서울특별시 강남구 역삼동 </li>
                                    <li>819-10 세경빌딩 3층</li>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End-->
    </footer>

    <!-- JS here -->

    <!-- All JS Custom Plugins Link Here here -->
    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>

    <!-- Jquery, Popper, Bootstrap -->
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>
    <!-- Date Picker -->
    <script src="./assets/js/gijgo.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>

    <!-- Scrollup, nice-select, sticky -->
    <script src="./assets/js/jquery.scrollUp.min.js"></script>
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>

    <!-- contact js -->
    <script src="./assets/js/contact.js"></script>
    <script src="./assets/js/jquery.form.js"></script>
    <script src="./assets/js/jquery.validate.min.js"></script>
    <script src="./assets/js/mail-script.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

    <!-- Jquery Plugins, main Jquery -->
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>
     <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">
	
</script>
</body>

</html>