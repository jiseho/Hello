<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Iuquiry</title>
  
  <link rel="manifest" href="site.webmanifest">
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css2?family=El+Messiri&display=swap" rel="stylesheet">
  
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
  <link rel="stylesheet" href="assets/css/reserv.css?ver=1">
  <link rel="stylesheet" href="assets/css/responsive.css">
  <link rel="stylesheet" href="assets/css/cs.css">
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

	<c:set var="u" value="${user}"/>
  <!-- Inquiry -->
  <div>
    <div class="customerInquiry">
      <div class="title">
        <h2>Customer Inquiry</h2>
      </div>
      <div class="box">

        <div class="inquiry form">
					<h3>Send a Message</h3>

					<form action="csboardWrite" method="post" name="wfrm" enctype="multipart/form-data">
						<div class="formBox">
							<div class="row50">
								<div class="select-this">
									<div class="select-itms">
										<select name="branch" id="select1">
											<option value="서울">Seoul</option>
											<option value="인천">Incheon</option>
											<option value="부산">Busan</option>
											<option value="제주">Jeju</option>
										</select>
									</div>
								</div>
							</div>

							<div class="row50">
								<div class="inputBox">
									<span>Name</span> <input type="text" name="name"
										placeholder="Write your name" value="${u.name}" readonly="readonly"/>
								</div>
							</div>

							<div class="row50">
								<div class="inputBox">
									<span>Subject</span> <input type="text" name="subject"
										placeholder="Write your subject" />
								</div>
							</div>

							<div class="row50">
								<div class="inputBox">
									<span>Password</span> <input type="password" name="password"
										placeholder="Write your password" />
								</div>
							</div>

							<div class="row10">
								<div class="inputBox">
									<span>Content</span>
									<textarea name="content" id="" cols="30" rows="10" placeholder="Write your messages here"></textarea>
								</div>
							</div>

							<div class="row10">
								<div class="inputBox">
									<span>File</span> <input type="file" name="file" />
								</div>
							</div>
							
							<div class="row10">
								<div class="inputBox">
									<!-- <a href="cs_boardwrite_ok.jsp" id="wbtn" class="btn border-btn">Send<i class="ti-angle-right"></i></a>-->
									<button type="submit" class="btn border-btn" id="submit">send</button>
								</div>
							</div>
					</form>
				</div>
			</div>

        <!-- info -->
        <div class="inquiry info">
          <h3>Contact Info</h3>
          <div class="infoBox">
            <div>
              <span><ion-icon name="location"></ion-icon></span>
              <p>floor 3, Sekyeong Bldg. <br />Gangnam-daero 94-gil, Gangnam-gu, <br />Seoul, Korea</p>
            </div>
            <div> 
              <span><ion-icon name="mail"></ion-icon></span>
              <a href="mailto:lorem@hoteldelluna.com">lorem@hoteldelluna.com</a>
            </div>
            <div> 
              <span><ion-icon name="call"></ion-icon></span>
              <a href="tel:+82253833644">+82 2 5383 3644</a>
            </div>
          </div>
          <!-- Social Media Links -->
          <ul class="sns">
            <li><a href="#"><ion-icon name="logo-instagram"></ion-icon></a></li>
            <li><a href="#"><ion-icon name="logo-facebook"></ion-icon></a></li>
            <li><a href="#"><ion-icon name="share-social"></ion-icon></a></li>
          </ul>
        </div>

        <!-- map -->
        <div class="inquiry map">
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.374980377621!2d127.0259491146495!3d37.49907317981057!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca187ed422583%3A0x2910c1b06a782a6f!2zS0lD7Lqg7Y287Iqk!5e0!3m2!1sen!2skr!4v1645618914435!5m2!1sen!2skr" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <!-- Footer Start-->
    <div class="footer-area black-bg footer-padding">
      <div class="container">
        <div class="row d-flex justify-content-between">
          <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
            <div class="single-footer-caption mb-30">
              <!-- logo -->
              <div class="footer-logo">
                <a href="index.html"><img src="assets/img/logo/logo1.png" width="200" height="80" alt=""></a>
              </div>
              <div class="footer-pera">
                <p>
                  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                  Copyright &copy;
                  <script>document.write(new Date().getFullYear());</script> DELLUNA <br /> All rights reserved
                  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
              </div>
            </div>
          </div>
          <div class="col-xl-3 col-lg-3 col-md-3 col-sm-5">
            <div class="single-footer-caption mb-30">
              <div class="footer-tittle">
                <h4>teamAwesome Made</h4>
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
                <h4>Contacts</h4>
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
                  <li><a href="#">floor 3, Sekyeong Bldg.</a></li>
                  <li><a href="#">Gangnam-daero 94-gil</a></li>
                  <li><a href="#">Gangnam-gu, Seoul, South Korea</a></li>
                </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Footer End-->
  </footer>

  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

  
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
    <script type="text/javascript">
  
    	document.getElementById("submit").onclick = function() {
    		if(document.getElementsByName('subject')[0].value == '') {
    			alert("제목을 입력해주세요!");
    			return false;
    		}
    		if(document.getElementsByName('password')[0].value == '') {
    			alert("비밀번호 입력해주세요!");
    			return false;
    		}
    		if(document.getElementsByName('content')[0].value== '') {
    			alert("내용을 입력해주세요!");
    			return false;
    		}
    		
    	}
    
    </script>
    
</body>
</html>