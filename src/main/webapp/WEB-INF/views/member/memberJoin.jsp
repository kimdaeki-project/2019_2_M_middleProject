<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Required Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Page Title -->
    <title>Elements</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="../resources/images/logo/favicon.png" type="image/x-icon">

    <!-- CSS Files -->
    <link rel="stylesheet" href="../resources/css/animate-3.7.0.css">
    <link rel="stylesheet" href="../resources/css/font-awesome-4.7.0.min.css">
    <link rel="stylesheet" href="../resources/fonts/flat-icon/flaticon.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.1.3.min.css">
    <link rel="stylesheet" href="../resources/css/owl-carousel.min.css">
    <link rel="stylesheet" href="../resources/css/nice-select.css">
    <link rel="stylesheet" href="../resources/css/style.css">
    <link rel="stylesheet" href="../resources/css/member/member.css">
    
</head>
<body>
    <!-- Preloader Starts -->
    <div class="preloader">
        <div class="spinner"></div>
    </div>
    <!-- Preloader End -->

    <!-- Header Area Starts -->
	<header class="header-area header-area2">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo-area">
                        <a href="index.html"><img src="../resources/images/logo/logo2.png" alt="logo"></a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="custom-navbar">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>  
                    <div class="main-menu main-menu2">
                        <ul>
                            <li class="active"><a href="index.html">home</a></li>
                            <li><a href="about.html">about</a></li>
                            <li><a href="menu.html">menu</a></li>
                            <li><a href="#">blog</a>
                                <ul class="sub-menu">
                                    <li><a href="blog-home.html">Blog Home</a></li>
                                    <li><a href="blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="contact-us.html">contact</a></li>
                            <li><a href="elements.html">Elements</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Area End -->
 <!-- Banner Area Starts -->
    <section class="banner-area banner-area2 blog-page text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1><i>Elements</i></h1>
                    <a href="index.html">home</a>
                    <span class="mx-2">/</span>
                    <a href="elements.html">elements</a>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Area End -->
         
            <div class="section-top-border">
                <div class="row">
                    <div class="col-lg-8 col-md-8" id=join-form>
                        <h3 class="mb-30 title_color">Create account</h3>
                        <form action="./memberJoin" method="post" id = "frm">
                            <div class="mt-10">
                                <input type="text" id ="id" name="id" placeholder="Id" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Id'" required class="single-input-primary">
                            	<h3 id = "text"></h3>
                            </div>
                            <div class="mt-10">
                                <input type="password" id = "pw" name="pw" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required class="single-input-primary">
                            	<div id = "pw_miss"></div>
                            </div>
                            <div class="mt-10">
                                <input type="password" id = "pw2" name="pw2" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required class="single-input-primary">
                          	  <div id="pw_check"></div>
                            </div>
                     
                            <div></div>
                            <div class="mt-10 form-group">
                                <input type="email" name="email" id="email"  placeholder="Email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address'" required class="single-input-primary">
                            </div>
                               <div class="mt-10">
                                <input type="text" name="name" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'" required class="single-input-primary">
                            </div>
                            <div class="mt-10">
                                <input type="text" name="tel" placeholder="tel" onfocus="this.placeholder = ''" onblur="this.placeholder = 'tel'" required class="single-input-primary">
                            </div>                        
                            <c:if test="${member.grade == 2}">                   
                            <div class="mt-10">
                                <input type="text" name="reg_number" placeholder="reg_number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'reg_number'" required class="single-input-primary">
                            </div>
                            </c:if>  
                            	<div id = "btn-form">
                  			  <input type="submit" class="genric-btn primary radius" id = "btn" value= "Create your account">            
                  			   </div>
                        </form>
                    </div>
                   
                        </div>
                    </div>
       
    <!-- End Align Area -->
   <script type="text/javascript"> 
   
   var idj = /^[a-z0-9]{4,12}$/;
   
   	$("#id").blur(function() {
		
   		var id = $('#id').val();
   		
   		$.ajax({
   			url: "memberCheckId?id="+id,
   			type : 'get',
   			success: function(data) {
				console.log("1=중복/ 0=중복x"+data);
				
				if(data ==1){			
					$("#text").text("사용중인 아이디입니다.");
					$("#text").css("color","red");
					$("#btn").attr("disabled",true);
				}else{
				
					if(idj.test(id)){
						
						$('#text').text("");
						$("#btn").attr("disabled",false);
					
				}else if(id ==""){
						$('#text').text('아이디를 입력해주세요.');
						$('#text').css('color','red');
						$("#btn").attr("disabled",true);
					}else{
						
						$('#text').text("아이디는 소문자와 숫자, 4~12자리만 가능합니다.");
						$('#text').css('color','red');
						$('#btn').attr("disabled",true);
					}
					
				}
					
				}, error:function(){
					
					console.log("실패");
				}			
   		}); 		
	});
   
 /* 비밀번호 일치 */  
 	 $("#pw2").blur(function() {
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();		
			if(pw == pw2){
					if(pw !="" && pw2 != ""){
						$("#pw_check").html("사용가능한 비밀번호입니다.")
						$("#pw_check").css("color","green")
					}else{
				
					}
				}else{
					$("#pw_check").html("비밀번호가 일치하지 않습니다.");		
					$("#pw_check").css("color","red")
				}				
			});
 
 	 	 $("#pw").change(function() {
			$("#pw2").val("");
			$("#pw_check").html("");
		});
 	 	 	 	    
   </script>
    

    <!-- Footer Area Starts -->
    <footer class="footer-area">
        <div class="footer-widget section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="single-widget single-widget1">
                            <a href="index.html"><img src="../resources/images/logo/logo2.png" alt=""></a>
                            <p class="mt-3">Which morning fourth great won't is to fly bearing man. Called unto shall seed, deep, herb set seed land divide after over first creeping. First creature set upon stars deep male gathered said she'd an image spirit our</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="single-widget single-widget2 my-5 my-md-0">
                            <h5 class="mb-4">contact us</h5>
                            <div class="d-flex">
                                <div class="into-icon">
                                    <i class="fa fa-map-marker"></i>
                                </div>
                                <div class="info-text">
                                    <p>1234 Some St San Francisco, CA 94102, US 1.800.123.4567 </p>
                                </div>
                            </div>
                            <div class="d-flex">
                                <div class="into-icon">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <div class="info-text">
                                    <p>(123) 456 78 90</p>
                                </div>
                            </div>
                            <div class="d-flex">
                                <div class="into-icon">
                                    <i class="fa fa-envelope-o"></i>
                                </div>
                                <div class="info-text">
                                    <p>support@axiomthemes.com</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="single-widget single-widget3">
                            <h5 class="mb-4">opening hours</h5>
                            <p>Monday ...................... Closed</p>
                            <p>Tue-Fri .............. 10 am - 12 pm</p>
                            <p>Sat-Sun ............... 8 am - 11 pm</p>
                            <p>Holidays ............. 10 am - 12 pm</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-6">
                        <span><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></span>
                    </div>
                    <div class="col-lg-5 col-md-6">
                        <div class="social-icons">
                            <ul>
                                <li class="no-margin">Follow Us</li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Area End -->


    <!-- Javascript -->
    <script src="../resources/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="../resources/js/vendor/bootstrap-4.1.3.min.js"></script>
    <script src="../resources/js/vendor/wow.min.js"></script>
    <script src="../resources/js/vendor/owl-carousel.min.js"></script>
    <script src="../resources/js/vendor/jquery.datetimepicker.full.min.js"></script>
    <script src="../resources/js/vendor/jquery.nice-select.min.js"></script>
    <script src="../resources/js/main.js"></script>
</body>
</html>


</body>
</html>