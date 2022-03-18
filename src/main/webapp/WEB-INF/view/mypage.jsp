
<%@page import="com.hoteldelluna.web.service.UsersService"%>
<%@page import="com.hoteldelluna.web.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Hotel</title>
    <style>
       .img-fluid {
            width: 200px;
            height: 200px;
        }
        .container-large {
            
            border-color: #1d1d1d;
        }

        .plus {
            padding-left: 100px;
        }
        .tabs {
            clear: both;
            position: relative;
            max-width: 1200px;
            margin: 0 auto;
            /* you can either manually set a min-height here or do it via JS ---> */
        }

        .tab {
            float: left;
        }
        .tab label {
            margin-right: 20px;
            position: relative;
            top: 0;
            cursor: pointer;
            color: rgb(51, 50, 50);
            font-weight: bold;
        }

        .tab [type=radio] {
            display: none;
        }

        .tab__content {
            position: relative;
            top: 40px;
            left: 0;
            right: 0;
            bottom: 0;
            transition: opacity .2s cubic-bezier(.42, 0, .34, 1.01);
            opacity: 0;
        }

        [type=radio]:checked~label {
            border-bottom: 2px solid #1d1d1d;
            color: #525050;
            z-index: 2;
        }

        [type=radio]:checked~label~.tab__content {
            z-index: 1;
            opacity: 1;
        }

        #s2 {
            border-style: solid;
            border-width: thin;
            padding: 20px;
            border-color: #E6C17B;
        }
    </style>
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
    <link rel="stylesheet" type="text/css" href="assets/css/cs_boardlist.css">
	<link href="https://fonts.googleapis.com/css2?family=El+Messiri&display=swap" rel="stylesheet">
	<script type="text/javascript">
	window.onload = function() {
		document.getElementById( 'mbtn' ).onclick = function() {
			if( document.mfrm.pwd.value.trim() == '' ) {
				alert( '비밀번호를 입력하셔야 합니다.' );
				return false;
			}
			document.mfrm.submit();
		};
	};
	
	
    
    function csboardview(no) {
    	$('#board_list').css('display','none')
    	$('#board_view').css('display','block')
    	let board_no = no
    	
    	$.ajax( {
    		url:'./csboardView',
    		type:'get',
    		dataType:'json',
    		data: {
    			board_no : board_no //이건 무시
    		},
    		
    		success: function(json) {
    			console.log(json)
    			
    			$.each( json.result, function(index, item) {
    				if(item.filename == '') {
    					item.filename = 'x';
    				}
    				document.getElementById('subject').innerText = item.subject;
    				document.getElementById('name').innerText = item.name;
    				document.getElementById('wdate').innerText = item.wdate;
    				document.getElementById('hit').innerText = item.hit;
    				document.getElementById('filename').innerText = item.filename;
    				document.getElementById('content').innerText = item.content;
    			});
    		},
    		
    		error: function(e) {
    			alert('서버에러 : ' + e.status);
    		}
    	})
    }
    
    function csboardlist() {
    	$('#board_list').css('display','block');
    	$('#board_view').css('display','none');
    	
    	$.ajax( {
    		url:'./csboardList',
    		type:'get',
    		dataType:'json',
    		data: {
    			
    		},
    		success: function(json) {
    			$.each( json.result, function(index, item) {
    				
    				const count = 'count'+item.no;
    				document.getElementById(count).innerText = item.hit;
    			});
    		},
    		error: function(e) {
    			alert('서버에러 : ' + e.status);
    		}
    	})
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
								<c:if test="${sessionId != null }">
									<a href="logout" class="btn btn1 d-none d-lg-block ">Log Out</a>
								</c:if> 
                                <%-- <c:if test="${sessionId != null }">
                                	<a href="mypage?userNumber=${userNo}" class="btn btn1 d-none d-lg-block ">My Page</a>	
								</c:if> --%>
                                
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
            data-background="assets/img/hero/aboutpage_hero.jpg">
            <div class="container">
                <div class="row ">
                    <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                        <div class="hero-caption">
                            <span></span>
                            <h2>Mypage</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->

    <!-- ================ contact section start ================= -->
    <c:set var="u" value="${users}"/>
    <section class="contact-section">
        <div class="container">
            <div class="section-top-border text-left">
                <div class="row">
                    <div class="col-md-10">
                        <div class="container-large">
                            <h1>Welcome!</h1><br /><br /><br />

                            <div data-tabs class="tabs">
                                <div class="tab">
                                    <input type="radio" name="tabgroup" id="tab-1">
                                    <label for="tab-1">My Account</label>
                                    <div class="tab__content">
                                        <div id="s2">
                                            <form class="form-contact contact_form" action="mypage_ok.jsp" method="post" id="mfrm" novalidate="novalidate">
                                                <input type="hidden" name="userNumber" value="${u.no }"/>                                               
                                              
                                                <div class="row">
                                                    <div class="col-sm-2">
                                                        <div class="form-group">
                                                            <label>id:</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10">
                                                        <div class="form-group">
                                                            <input class="form-control valid" name="userID" 
                                                                type="text" value="${u.id}" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <div class="form-group">
                                                            <label>name:</label>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-10">
                                                        <div class="form-group">
                                                            <input class="form-control valid" name="userName" 
                                                                type="text" value="${u.name}" readonly>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-sm-2">
                                                        <div class="form-group">
                                                            <label>password:</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10">
                                                        <div class="form-group">
                                                            <input class="form-control valid" name="pwd" type="password" value="">
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <div class="form-group">
                                                            <label>birth:</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10">
                                                        <div class="form-group">
                                                            <input class="form-control valid" name="birth"
                                                                 type="text" value="${u.birth }">
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <div class="form-group">
                                                            <label>mail:</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10">
                                                        <div class="form-group">
                                                            <input class="form-control valid" name="email"
                                                                 type="text" value="${u.email }">
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <div class="form-group">
                                                            <label>phone:</label>
                                                        </div>
                                                    </div>                                                  
                                                    <div class="col-sm-10">
                                                        <div class="form-group">
                                                            <input class="form-control valid" name="phone"
                                                                 type="text" value="${u.phone }">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group mt-3" align="right">
                                                    <button type="submit" class="button button-contactForm boxed-btn" id="mbtn">update</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="tab">
                                        <input type="radio" name="tabgroup" id="tab-2"  checked>
                                        <label for="tab-2">My reservations</label>
                                        <div class="tab__content">
                                            <div id="s2">
                                                 <div class="row">
                                                 	<c:if test="${empty bookings}">
                                                 		<div style="font-size:24px;">No reservations</div>
                                                 	</c:if>
                                                 	<c:forEach var="b" items="${bookings}">
                                                    <div class="col-4">
                                                        <p>book ${b.b_no}</p>                                          
                                                    <div class="card">
                                                      <div class="card-header">
                                                        My Card
                                                      </div>
                                                      <img src="assets\img\menu_02.jpg" alt="" />
                                                      <div class="card-body">
                                                        <h5 class="card-title">Cost: ${b.b_ttlprice}₩</h5>
                                                        <p class="card-text">name: ${b.b_name }</p>
                                                        <p class="card-text">phone: ${b.b_phone }</p>
                                                        <p class="card-text">mail: ${b.b_email }</p>
                                                        <p class="card-text">date: ${b.b_chkin} ~ ${b.b_chkout}</p>
                                                        <p class="card-text">nights: ${b.b_nights}</p>
                                                        <p class="card-text">room-type: ${b.b_room}</p>
                                                        <p class="card-text">address: 23 Jangmun-ro, Yongsan-gu, Seoul, South Korea</p>
                                                      </div>
                                                    </div>
                                                  </div>
                                                  </c:forEach>
                                                   
                                                    
                                                  </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab">
                                        <input type="radio" name="tabgroup" id="tab-5">
                                        <label for="tab-5">1:1 Inquiry</label>
                                        <div class="tab__content" >
                                            <div class="form-group mt-3" align="center">
                                             <div id="s2" >
                                             
													<div class="board_wrap" id="board_list">
													<form class="form-contact contact_form" action="csboardWrite" method="get" novalidate="novalidate">
													
														<div class="board_title">
															<h3>My Inquiries</h3>
															<p>Hotel Del Luna will respond to your inquiries as quickly as possible.</p>
														</div>

														<div class="board_list">
															<div class="top">
																<div class="num">No</div>
																<div class="title">Subject</div>
																<div class="writer">Name</div>
																<div class="date">Date</div>
																<div class="count">Hit</div>
															</div>
															<c:forEach var="b" items="${board}">
															<div>
																<div class="num">${b.c_no }</div>
																<div class="title">
																	<a href="javascript:csboardview('${b.c_no }')">${b.c_subject }</a>
																</div>
																<div class="writer">${b.c_name }</div>
																<div class="date">${b.c_wdate }</div>
																<div class="count" id="count${b.c_no}">${b.c_hit }</div>
															</div>
															</c:forEach>
															
														</div>

														<div class="form-group mt-3">
															<button type="submit"
																class="button button-contactForm boxed-btn">Write</button>
														</div>

														<nav class="blog-pagination justify-content-center d-flex">
															<ul class="pagination">
																<li class="page-item"><a href="#" class="page-link"
																	aria-label="Previous"> <i class="ti-angle-left"></i>
																</a></li>
																<li class="page-item active"><a href="#" class="page-link">1</a>
																</li>
																
																<li class="page-item"><a href="#" class="page-link"
																	aria-label="Next"> <i class="ti-angle-right"></i>
																</a></li>
															</ul>
														</nav>
`													</form>
													</div>
													
													<div class="board_wrap" id="board_view" style="display:none">
													    <div class="board_title">
													        <h3>My Inquiry</h3>
													        <p></p>
													    </div>
													    <div class="board_view_wrap">
													        <div class="board_view">
													            <div class="title" id="subject">
													                
													            </div>
													            <div class="info">
													                <dl>
													                    <dt>Name</dt>
													                    <dd id="name"></dd>
													                </dl>
													                <dl>
													                    <dt>Date</dt>
													                    <dd id="wdate"></dd>
													                </dl>
													                <dl>
													                    <dt>Hit</dt>
													                    <dd id="hit"></dd>
													                </dl>
													                <dl>
													                    <dt>File</dt>
													                    <dd id="filename"></dd>
													                </dl>
													            </div>
													            <div class="cont" id="content">
													            
													            </div>
													        </div>
													
													        <div class="form-group mt-3">
													          <button type="submit" class="button button-contactForm boxed-btn" onclick="csboardlist()">목록</button>
													        </div>
													    </div>
													</div>													
												</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

</div>
                    </div>
                    <div class="col-md-2">
                        <img src="assets/img/hero/profile.png" alt="" class="img-fluid">
                    </div>
                
            </div>
    </section>
    <!-- ================ contact section end ================= -->


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
                                    <li>Minsoo Kang</li>
                                    <li>Sojeong Kim</li>
                                    <li>Kyeongeun Son</li>
                                    <li>Kicheol Lee</li>
                                    <li>Seho Ji</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3">
                        <div class="single-footer-caption mb-30">
                            <div class="footer-tittle">
                                <h4>Contact</h4>
                                <ul>
                                    <li>alstn9469@hoteldelluna.com</li>
                                    <li>sojeong@hoteldelluna.com</li>
                                    <li>keson@hoteldelluna.com</li>
                                    <li>leekicheol@hoteldelluna.com</li>
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
      <!-- icons -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script>
        (function ($, document) {

            // get tallest tab__content element
            let height = -1;

            $('.tab__content').each(function () {
                height = height > $(this).outerHeight() ? height : $(this).outerHeight();
                $(this).css('position', 'absolute');
            });

            // set height of tabs + top offset
            $('[data-tabs]').css('min-height', height + 40 + 'px');

        }(jQuery, document));
    </script>
</body>

</html>