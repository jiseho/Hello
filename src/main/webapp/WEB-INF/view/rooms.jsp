<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta charset="utf-8">
  <title>Hotel del Luna</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="manifest" href="site.webmanifest">
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css2?family=El+Messiri&display=swap" rel="stylesheet">

  
  <!-- Place favicon.ico in the root directory -->

  <!-- CSS here -->
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
  <link rel="stylesheet" href="assets/css/gijgo.css">
  <link rel="stylesheet" href="assets/css/slicknav.css">
  <link rel="stylesheet" href="assets/css/animate.min.css">
  <link rel="stylesheet" href="assets/css/magnific-popup.css">
  <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
  <link rel="stylesheet" href="assets/css/themify-icons.css">
  <link rel="stylesheet" href="assets/css/themify-icons.css">
  <link rel="stylesheet" href="assets/css/slick.css">
  <link rel="stylesheet" href="assets/css/nice-select.css">
  <link rel="stylesheet" href="assets/css/reserv.css">
  <link rel="stylesheet" href="assets/css/responsive.css">
  
  <script type="text/javascript">
  	function room(roomNo, date1, date2) {
  		let f = document.createElement('form');
  		
  		let obj1;
  		obj1 = document.createElement('input');
  		obj1.setAttribute('type' , 'hidden');
  		obj1.setAttribute('name', 'roomNo');
  		obj1.setAttribute('value', roomNo);
  		
  		let obj2;
  		obj2 = document.createElement('input');
  		obj2.setAttribute('type' , 'hidden');
  		obj2.setAttribute('name', 'date1');
  		obj2.setAttribute('value', date1);
  		
  		let obj3;
  		obj3 = document.createElement('input');
  		obj3.setAttribute('type' , 'hidden');
  		obj3.setAttribute('name', 'date2');
  		obj3.setAttribute('value', date2);
  		
  		f.appendChild(obj1);
	    f.appendChild(obj2);
	    f.appendChild(obj3);
	    
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', 'roomDetail?roomNo='+roomNo+'');
	    document.body.appendChild(f);
	    f.submit();
  	}
  </script>
</head>

<body>

  <!-- Preloader Start -->
  <div id="preloader-active">
    <div class="preloader d-flex align-items-center justify-content-center">
      <div class="preloader-inner position-relative">
        <div class="preloader-circle"></div>
        <div class="preloader-img pere-text">
          <strong>Hotel</strong>
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
                                        <li><a href="faqlist">Q&A</a></li>
                                        
                                        
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

  <main>

    <!-- slider Area Start-->
    <div class="slider-area">
      <div class="single-slider hero-overly slider-height2 d-flex align-items-center"
        data-background="assets/img/hero/roomspage_hero.jpg">
        <div class="container">
          <div class="row ">
            <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
              <div class="hero-caption">
                <span></span>
                <h2>Our Rooms</h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- slider Area End-->

    <!-- Room Start -->
    <section class="room-area r-padding1">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-8">
            <!-- font-back-title -->
            <div class="font-back-tittle mb-45">
              <div class="archivment-front">
                <h3>Discover the best accommodation in Seoul</h3>
              </div>
              <h3 class="archivment-back">Hotel del Luna</h3>
            </div>
          </div>
        </div>
        <div class="row">
        <c:forEach var="r" items="${room}">
          <div class="col-xl-4 col-lg-6 col-md-6">
            <!-- Superior Single Room -->
            <div class="single-room mb-50">
              <div class="room-img">
                <a href="javascript:room('${r.r_no}', '${param.datepicker1 }', '${param.datepicker2}')"><img src="assets/img/rooms/${r.r_img}" alt=""></a>
              </div>
              <div class="room-caption">
                <h3><a href="javascript:room('${r.r_no}', '${param.datepicker1 }', '${param.datepicker2}')">${r.r_roomtype}</a></h3>
                <div class="room-info">
                  <div class="room-info-menu">
                    <ion-icon name="bed"></ion-icon>
                    <span class="room-info-title">Bed type</span>
                    <strong class="room-info-text">${r.r_bedtype} </strong>
                  </div>
                  <div class="room-info-menu">
                    <ion-icon name="people-sharp"></ion-icon>
                    <strong class="room-info-title">Occupancy</strong>
                    <span class="room-info-text">${r.r_occupancy}  Person</span>
                  </div>
                </div>
                <hr />
                <div class="room-price">
                  <span class="room-price-start">From</span>
                  <strong class="room-price-number">${r.r_price} </strong>
                  <span class="room-price-currency">KRW</span>
                </div>
              </div>
            </div>
          </div>
         </c:forEach>
        </div>
        <div class="row justify-content-center">
          <div class="room-btn pt-70">
            <a href="#" class="btn view-btn1">View more <i class="ti-angle-right"></i> </a>
          </div>
        </div>
      </div>

    </section>
    <!-- Room End -->

    <!-- Gallery img Start-->
    <div class="gallery-area fix">
      <div class="container-fluid p-0">
        <div class="row">
          <div class="col-md-12">
            <div class="gallery-active owl-carousel">
              <div class="gallery-img">
                <a href="#"><img src="assets/img/gallery/gallery1.jpg" alt=""></a>
              </div>
              <div class="gallery-img">
                <a href="#"><img src="assets/img/gallery/gallery2.jpg" alt=""></a>
              </div>
              <div class="gallery-img">
                <a href="#"><img src="assets/img/gallery/gallery3.jpg" alt=""></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Gallery img End-->
  </main>

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

  <!-- Scrollup, nice-select, sticky -->
  <script src="./assets/js/jquery.scrollUp.min.js"></script>
  <script src="./assets/js/jquery.nice-select.min.js"></script>
  <script src="./assets/js/jquery.sticky.js"></script>
  <script src="./assets/js/jquery.magnific-popup.js"></script>

  <!-- contact js -->
  <script src="./assets/js/contact.js"></script>
  <script src="./assets/js/jquery.form.js"></script>
  <script src="./assets/js/jquery.validate.min.js"></script>
  <script src="./assets/js/mail-script.js"></script>
  <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

  <!-- Jquery Plugins, main Jquery -->
  <script src="./assets/js/plugins.js"></script>
  <script src="./assets/js/main.js"></script>

  <!-- icons -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>

</html>