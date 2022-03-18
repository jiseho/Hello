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
#s1 {
	border-style: solid;
	border-width: thin;
	border-color: #E6C17B;
	border-radius: 10px;
	background-color: #d8d8de;
	padding: 10px;
	color: gray;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

#s2 {
	border-style: solid;
	border-width: thin;
	padding: 20px;
	border-color: #E6C17B;
}

.simg {
	width: 250px;
	height: 180px;
	border-radius: 10px;
	opacity: 0.7;
}

.contact-title {
	padding-top: 20px;
}

#s3 {
	background-color: white;
	padding: 15px;
	border-radius: 5px;
	margin-top: 8px;
}

.import {
	color: red;
}

ul {
	font-size: 15px;
}

.ag {
	padding-top: 15px;
}

html, body {
	width: 100%;
}

body, div, ul, li {
	margin: 0;
	padding: 0;
}

/*tab css*/
.tab {
	float: left;
	width: 830px;
	height: 340px;
}

.tabnav {
	font-size: 0;
	width: 830px;
	border: 1px solid #ddd;
}

.tabnav li {
	display: inline-block;
	height: 40px;
	text-align: center;
	border-right: 1px solid #ddd;
}

.tabnav li a:before {
	content: "";
	position: absolute;
	left: 0;
	top: 0px;
	width: 100%;
	height: 3px;
}

.tabnav li a.active {
	border-bottom: 1px solid #fff;
}

.tabnav li a {
	position: relative;
	display: block;
	background: #f8f8f8;
	color: black;
	padding: 0 30px;
	line-height: 46px;
	text-decoration: none;
	font-size: 12px;
}

.tabnav li a:hover, .tabnav li a.active {
	background: #fff;
	color: gray;
}

.tabcontent {
	padding: 20px;
	height: 300px;
	border: 1px solid #ddd;
	border-top: none;
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
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('wbtn').onclick = function() {
			//alert('click');
			//필수 요소 검사 
			
			if (document.wfrm.email.value.trim() == '') {
				alert('email을 입력 하셔야 합니다.');
				return false;
			}
		/*	if (document.wfrm.cname.value.trim() == '') {
				alert('[결제] 이름 입력 하셔야 합니다.');
				return false;
			}			
			if (document.wfrm.cardNumber.value.trim() == '') {
				alert('[결제] 카드 번호를 입력 하셔야 합니다.');
				return false;
			}
			if (document.wfrm.cardMonth.value.trim() == '') {
				alert('[결제] 카드 유효기간을 입력 하셔야 합니다.');
				return false;
			}
			if (document.wfrm.cardYear.value.trim() == '') {
				alert('[결제] 카드 유효기간을 입력 하셔야 합니다.');
				return false;
			}
			if (document.wfrm.cvc.value.trim() == '') {
				alert('[결제] cvc를 입력 하셔야 합니다.');
				return false;
			}*/
			if (document.wfrm.agree.checked == false) {
				alert('impormation info에 대한 동의를 하셔야 합니다.');
				return false;
			}
			
			document.wfrm.submit();
		};
	};
	
	function listView(userno, roomno, datepicker1, datepicker2, adult, child, totalprice, nights, roomtype, name, phone, email, requirement){
	    let f = document.createElement('form');
	    
	    let obj1;
	    obj1 = document.createElement('input');
	    obj1.setAttribute('type', 'hidden');
	    obj1.setAttribute('name', 'userNumber');
	    obj1.setAttribute('value', userno);
	    
	    let obj2;
	    obj2 = document.createElement('input');
	    obj2.setAttribute('type', 'hidden');
	    obj2.setAttribute('name', 'roomNumber');
	    obj2.setAttribute('value', roomno);
	    
	    let obj3;
	    obj3 = document.createElement('input');
	    obj3.setAttribute('type', 'hidden');
	    obj3.setAttribute('name', 'checkin');
	    obj3.setAttribute('value', datepicker1);
	    
	    let obj4;
	    obj4 = document.createElement('input');
	    obj4.setAttribute('type', 'hidden');
	    obj4.setAttribute('name', 'checkout');
	    obj4.setAttribute('value', datepicker2);
	    
	    let obj5;
	    obj5 = document.createElement('input');
	    obj5.setAttribute('type', 'hidden');
	    obj5.setAttribute('name', 'adult');
	    obj5.setAttribute('value', adult);
	    
	    let obj6;
	    obj6 = document.createElement('input');
	    obj6.setAttribute('type', 'hidden');
	    obj6.setAttribute('name', 'child');
	    obj6.setAttribute('value', child);
	    
	    let obj7;
	    obj7 = document.createElement('input');
	    obj7.setAttribute('type', 'hidden');
	    obj7.setAttribute('name', 'totalprice');
	    obj7.setAttribute('value', totalprice);
	    
	    let obj8;
	    obj8 = document.createElement('input');
	    obj8.setAttribute('type', 'hidden');
	    obj8.setAttribute('name', 'nights');
	    obj8.setAttribute('value', nights);
	    
	    let obj9;
	    obj9 = document.createElement('input');
	    obj9.setAttribute('type', 'hidden');
	    obj9.setAttribute('name', 'room');
	    obj9.setAttribute('value', roomtype);
	    
	    let obj10;
	    obj10 = document.createElement('input');
	    obj10.setAttribute('type', 'hidden');
	    obj10.setAttribute('name', 'name');
	    obj10.setAttribute('value', name);
	    
	    let obj11;
	    obj11 = document.createElement('input');
	    obj11.setAttribute('type', 'hidden');
	    obj11.setAttribute('name', 'phone');
	    obj11.setAttribute('value', phone);
	    
	    let obj12;
	    obj12 = document.createElement('input');
	    obj12.setAttribute('type', 'hidden');
	    obj12.setAttribute('name', 'email');
	    obj12.setAttribute('value', email);
	    
	    let obj13;
	    obj13 = document.createElement('input');
	    obj13.setAttribute('type', 'hidden');
	    obj13.setAttribute('name', 'requirement');
	    obj13.setAttribute('value', requirement);
	    
	    f.appendChild(obj1);
	    f.appendChild(obj2);
	    f.appendChild(obj3);
	    f.appendChild(obj4);
	    f.appendChild(obj5);
	    f.appendChild(obj6);
	    f.appendChild(obj7);
	    f.appendChild(obj8);
	    f.appendChild(obj9);
	    f.appendChild(obj10);
	    f.appendChild(obj11);
	    f.appendChild(obj12);
	    f.appendChild(obj13);
	    
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', 'kakaoPay');
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
    <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/contact_hero.jpg" >
        <div class="container">
            <div class="row ">
                <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                    <div class="hero-caption">
                        <span></span>
                        <h2>reservation</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- slider Area End-->
	<c:set var="r" value="${room}"/>
	<c:if test="${not empty sessionId}">
		<c:set var="u" value="${users}"/>
	</c:if>
	<!-- ================ contact section start ================= -->
	<section class="contact-section">
		<div class="container">

			<script>
				
			</script>
			<div class="section-top-border text-left">
				<div class="row">
					<div class="col-12">
						<h2 class="contact-title">Reservation info</h2>
					</div>
					<div class="col-md-9">
						<div class="row">
							<div id="s2">
								<div class="col-lg-8">
									<form class="form-contact contact_form" action="reservationOk"
										method="post" name="wfrm" novalidate="novalidate">
										<input type="hidden" name="userNumber" value="${u.no}"/>
										<input type="hidden" name="roomNumber" value="${r.r_no}"/>
										<input type="hidden" name="checkin" value="${param.datepicker1}"/>
										<input type="hidden" name="checkout" value="${param.datepicker2}"/>
										<input type="hidden" name="adult" value="${param.adult}"/>
										<input type="hidden" name="child" value="${param.child}"/>
										<input type="hidden" name="totalprice" value="${totalprice}"/>
										<input type="hidden" name="nights" value="${nights}"/>
										<input type="hidden" name="room" value="${r.r_roomtype}"/>
																				
										<div class="row">
											<div class="col-sm-2">
												<div class="form-group">
													<label>name:</label>
												</div>
											</div>
											<div class="col-sm-10">
												<div class="form-group">
													<input class="form-control valid" name="name" type="text" value="${param.name} " readonly/>
												</div>
											</div>																					
											<div class="col-sm-2">
												<div class="form-group">
													<label>phone:</label>
												</div>
											</div>
											<div class="col-sm-10">
												<div class="form-group">
													<input class="form-control valid" name="phone" type="text" value="${param.phone }" readonly>
												</div>
											</div>
											<div class="col-sm-2">
												<div class="form-group">
													<label>mail:</label>
												</div>
											</div>
											<div class="col-sm-10">
												<div class="form-group">
													<input class="form-control valid" id="email" name="email" type="text" value=""
														onfocus="this.placeholder = ''"
														onblur="this.placeholder = 'Enter email address'"
														placeholder="Email">
												</div>
											</div>
											<div class="col-sm-2">
												<div class="form-group">
													<label>requirement:</label>
												</div>
											</div>
											<div class="col-10">
												<div class="form-group">
													<textarea class="form-control w-100" id="requirement"name="requirement"
														cols="30" rows="9" onfocus="this.placeholder = ''"
														onblur="this.placeholder = 'Enter Message'"
														placeholder=" Enter Message"></textarea>
												</div>
											</div>
										</div>
								</div>
							</div>
							<br />
							<div class="col-12">
								<h2 class="contact-title">Payment info</h2>
							</div>
							<div id="s2">
								<div class="col-lg-8">
									<div class="tab">
									<ul class="tabnav">
										<li><a href="#tab01">Credit Card</a></li>
										<li><a href="#tab02">KakaoPay</a></li>
									</ul>
									<div class="tabcontent">
										<div id="tab01">
											<div class="row">

										<div class="col-sm-2">
												<div class="form-group">
													<label>name:</label>
												</div>
											</div>
											<div class="col-sm-10">
												<div class="form-group">
													<input class="form-control valid" name="cardName"
													value="" type="text" onfocus="this.placeholder = ''"
													onblur="this.placeholder = 'Enter Name'"
													placeholder="Enter Name" >
												</div>
											</div>			
										<div class="col-sm-2">
											<div class="form-group">
												<label>card:</label>
											</div>
										</div>
										<div class="col-sm-10">

											<div class="single-select-box sm-30">
												<div class="select-this">

													<div class="select-itms">
														<select name="select" id="selectcard">
															<option value="BC카드">BC Card</option>
															<option value="VISA">VISA</option>
															<option value="MasterCard">MasterCard</option>
															<option value="롯데카드">LotteCard</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label>card number:</label>
											</div>
										</div>
										<div class="col-sm-10">
											<div class="form-group">
												<input class="form-control valid" name="cardNumber"
													value="" type="text" onfocus="this.placeholder = ''"
													onblur="this.placeholder = 'Enter card Number'"
													placeholder="Enter card Number" maxlength="16">
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label>expiration date:</label>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<input class="form-control valid" name="cardMonth"
													value="" type="text" onfocus="this.placeholder = ''"
													onblur="this.placeholder = 'card Month'"
													placeholder="card Month" maxlength="2">
											</div>
										</div>
										<div class="col-sm-1" align="center">
											<div class="form-group">
												<h2>/</h2>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<input class="form-control valid" name="cardYear"
													value="" type="text" onfocus="this.placeholder = ''"
													onblur="this.placeholder = 'card Year'"
													placeholder="card Year" maxlength="2">
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label>cvc:</label>
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<input class="form-control valid" name="cvc" value=""
													type="text" onfocus="this.placeholder = ''"
													onblur="this.placeholder = 'cvc'" placeholder="cvc" maxlength="3">
											</div>
										</div>
									</div>
										
										</div>
										<div id="tab02">
											<div align="center">
											<br/><br/><br/><br/>
                  							<a href="javascript:listView('${u.no }', '${r.r_no}', '${param.datepicker1}','${param.datepicker2}', '${param.adult}', '${param.child}', '${totalprice}','${nights}' ,'${r.r_roomtype}','${param.name}' ,'${param.phone }', `\${document.getElementById('email').value}` , `\${document.getElementById('requirement').value}`)" class="button button-contactForm boxed-btn">KakaoPay</a>
                							</div>
										</div>
									</div>
								</div>
									

								</div>
							</div>
							<div class="col-12">
								<h2 class="contact-title">Important info</h2>
							</div>
							<div id="s2">
								<ul>
									<li class="import">1. This fee is non-refundable.</li>
									<li class="import">2. If you change or cancel your reservation, there will be no refunds or credits available for future accommodations. This policy applies regardless of corona.</li>
									<li>3. You can't get a refund if you check in later than the set time or check out earlier.</li>
									<li>4. You need to make a new reservation to extend your stay.</li>
									<li>5. The front desk staff will help you when you arrive. For more information, please contact the accommodation with the contact information shown in the reservation confirmation email.</li>
									<li>6. Due to COVID-19, customers who share rooms with three or more people must belong to the same household according to the accommodation policy.</li>
									<li>7. The customer must present his/her ID card to verify his/her address upon check-in.</li>
								</ul>
							</div>
							<br />
							<div class="ag">
								<input type="checkbox" id="agree"><label>&#32;I agree with all of the following items.</label>
							</div>

						</div>
						<div class="form-group mt-3" align="right">
							<button type="submit" class="button button-contactForm boxed-btn"
								id="wbtn">Send</button>
						</div>
					</div>

					</form>
					<div class="col-md-3">     
                <div id="s1">                            
                    <img src="assets/img/rooms/${r.r_img}" alt="" class="simg" ><br/>
                    <div id="s3">
                        <div>Hotel Del Luna</div>
                        <p>23 Jangmun-ro, Yongsan-gu, Seoul, South Korea</p>
                    </div>
                    <div id="s3"> 
                        <table>
                            <tr>
                                <td>check in: &nbsp;</td>
                                <td>${param.datepicker1}</td>
                            </tr>
                            <tr>
                                <td>check out: &nbsp;</td>
                                <td>${param.datepicker2}</td>
                            </tr> 
                        </table>
                     </div>
                     
                    <div  id="s3">
                        <tr>
                            <td>select: &nbsp;</td>
                            <td>${r.r_roomtype}</td>
                        </tr>
                    </div>
                    <div  id="s3">
                        <tr>
                            <td>guest: &nbsp;</td>
                            <td>adult ${param.adult} , child ${param.child}</td>
                        </tr>
                    </div>
                     <div id="s3">
                             <tr>
                                <td>price: &nbsp;</td>
                                 <td>${totalprice}</td>
                             </tr> 
                    </div>            
           </div>
        </div>
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
                           <a href="index.html"><img src="assets/img/logo/logo1.png"  width="200" height="80" alt=""></a>
                         </div>
                         <div class="footer-pera">
                              <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>
			document.write(new Date().getFullYear());
		</script> DELLUNA <br/>All rights reserved 
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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
        <script>
        $(function(){
        	  $('.tabcontent > div').hide();
        	  $('.tabnav a').click(function () {
        	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
        	    $('.tabnav a').removeClass('active');
        	    $(this).addClass('active');
        	    return false;
        	  }).filter(':eq(0)').click();
        	  });
        	 
        </script>
        
    </body>
</html>