<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>what a lovely days!</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css" />
    <link rel="stylesheet" href="vendor/jquery-ui/jquery-ui.min.css" />
    <!--Bootsrap 4 CDN-->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
      integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
      crossorigin="anonymous"
    />
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

    <!-- Main css -->
    <link rel="stylesheet" href="./assets/css/style.css" />
    <link rel="stylesheet" href="./assets/css/regform.css" />
    <script type="text/javascript">
    window.onload = function() {
    	document.getElementById("submit").onclick = function() {
    		if(document.getElementById("id").value == '') {
    			alert("Enter your ID !");
    		}
    		if(document.getElementById("password").value == '') {
    			alert("Enter your PASSWORD !");
    		}
    		if(document.getElementById("re_password").value == '') {
    			alert("Double check your PASSWORD !");
    		}
    		if(document.getElementById("first_name").value == '') {
    			alert("Enter your FIRST_NAME !");
    		}
    		if(document.getElementById("last_name").value == '') {
    			alert("Enter your LAST_NAME !");
    		}
    		if(document.getElementById("birth_date").value == '') {
    			alert("Enter your BIRTH_DATE ! ");
    		}
    		if(document.getElementById("phone_number").value == '') {
    			alert("Enter your PHONE_NUMBER !");
    		}
    		if(document.getElementById("email").value == '') {
    			alert("Enter your EMAIL");
    		}
    	}
    }
    
    const id_overlap_check = function() { // id 중복체크 갑시당
    	var check = false;
    	
    	console.log($("label[for = 'id' ]").children('span').remove());
    	$.ajax( {
    		url:'./loginCheck',
    		type:'get',
    		dataType:'json',
    		data: {
    			check : true //이건 무시
    		},
    	
    		success: function(json) {
    			
    			$.each( json.result, function(index, item) {
    				
    				if($("#id").val() == item.id) {
    					$("label[for = 'id' ]").append('<span style="color:red;">중복이야 ^^</span>');
    					check=true;
    				}
    			});
    			if(!check) {
    				$("label[for = 'id' ]").append('<span style="color:blue;">합격 !</span>');	
    			}
    		},
    		error: function(e) {
    			alert('서버에러 : ' + e.status);
    		}
    	})
    
    }
    
    const pwd_overlap_check = function() { // pwd 중복체크 갑시당
    	var check = false;
    	if($("#password").val() != $("#re_password").val()) {
    		$("#pwd_check_text").text("안될것같은데요?").css({"color":"red"});    		
    	} else {
    		$("#pwd_check_text").text("합격").css({"color":"blue"});
    	}
    }
    	
    </script>
    
    
  </head>
  <body>
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

    <div class="main">
      <section class="signup">
        <!-- <img src="images/signup-bg.jpg" alt=""> -->
        <div class="r_container">
          <div class="signup-content">
            <form method="POST" id="signup-form" class="signup-form" action="loginform">
              <div class="hi1">
                <span>REGESTER FORM</span>
              </div>
              <div class="form-row">
	              <div class="form-group">
	                <label for="id">ID </label>
	                <input type="text" class="form-input" name="id" id="id" />
	                
	              </div>
	              <div class="form-inline">
	                <!-- <label for="email">ID</label> -->
	                <input type="button" class="form-input" id="id_overlap" value="중복확인" onclick="id_overlap_check()"/>
	                
	              </div>
              </div>
              
              <div class="form-row">
                <div class="form-group">
                  <label for="password">Password</label>
                  <input type="password" class="form-input" name="password" id="password" />
                </div>
                <div class="form-group">
                  <label for="re_password">Repeat your password</label>
                  <input type="password" class="form-input" name="re_password" id="re_password" onkeyup="pwd_overlap_check()"/>
                  <span id="pwd_check_text"></span>
                </div>
              </div>
              
              <div class="form-row">
                <div class="form-group">
                  <label for="first_name">First name</label>
                  <input type="text" class="form-input" name="first_name" id="first_name" />
                </div>
                <div class="form-group">
                  <label for="last_name">Last name</label>
                  <input type="text" class="form-input" name="last_name" id="last_name" />
                </div>
              </div>
              <div class="form-row">
                <div class="form-group form-icon">
                  <label for="birth_date">Birth date</label>
                  <input type="text" class="form-input" name="birth_date" id="birth_date" placeholder="YYYY-MM-DD" />
                </div>
                <div class="form-radio">
                  <label for="gender">Gender</label>
                  <div class="form-flex">
                    <input type="radio" name="gender" value="male" id="male" checked="checked" />
                    <label for="male">Male</label>

                    <input type="radio" name="gender" value="female" id="female" />
                    <label for="female">Female</label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="phone_number">Phone number</label>
                <input type="text" class="form-input" name="phone_number" id="phone_number" />
              </div>
              <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-input" name="email" id="email" />
              </div>
              <div class="form-group">
                <input type="submit" name="submit" id="submit" class="form-submit" value="Submit" />
              </div>
            </form>
          </div>
        </div>
      </section>
    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/jquery-ui/jquery-ui.min.js"></script>
    <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="vendor/jquery-validation/dist/additional-methods.min.js"></script>
    <script src="js/main.js"></script>
  </body>
  <!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
