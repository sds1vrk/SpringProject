<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>여행어때?</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../assets/css/city.css" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

   
</head>
<body class="homepage">
      <div id="page-wrapper">

         <!-- Header -->
            <div id="header-wrapper">
               <div id="header" class="container">

                  <!-- home image -->
            <figure style="position: absolute; top: 90px; width: 100%; left: -50px; height:500px">
                  <img src="../images/home-bg1.jpg" width="110%" height="400px " style="opacity: 0.8">
            </figure>
                 
                 
                  <!-- Nav -->
                     <nav id="nav">
								<ul>
									<li><a class="icon fa-home" href="../mainpage/main.jsp"><span>홈</span></a></li>
									<li>
										<a href="information.jsp" class="icon fa-info"><span>여행정보</span></a>
									</li>
									<li><a class="icon fa-book" href="../board/view/story.jsp"><span>스토리</span></a></li>
									<li><a class="icon fa-commenting-o" href="../newchat/client.jsp"><span>채팅</span></a></li>
									<li><a class="icon fa-id-card-o" href="../mypage/mypage.jsp"><span>MYPAGE</span></a></li>
									<li style="position: relative; left: 180px; padding:10px;"><a href="../login/logout_ok.jsp">로그아웃</a></li>
									<li style="position: relative; left: 200px; padding:10px;"><a href="../login/deleteForm.jsp">회원탈퇴</a></li>	
								</ul>
						</nav>         
               </div>
            </div>

         

         <!-- Banner -->
    
      <div id="banner-wrapper">
         <div class="asdf"
            style="position: relative; width: auto; height: 1000px">
             <!-- <div id="banner-wrapper" style=postion:relative;> -->
				<h2 class="titleh2">채팅방 입장</h2>
				<div style="margin: 10px ">
						
			<!-- 채팅방 진입 테이블 -->
					<table style="position: absolute; left:23%; margin: 10px; ">
						<tr>
				<!-- 		       
                  <input type="button" value="aaa" name="1" onclick="location.href='../newchat/client.jsp'">
						
						 -->
							<td rowspan="2"><a href="../newchat/client_Europe.jsp"><img src="../images/chat/eu.jpg" ></a></td>	
							<td ><img src="../images/chat/me.jpg"></td>
							<td rowspan="2"><img src="../images/chat/na.jpg" ></td>
						</tr>
						<tr>
							<td><a href="../newchat/client.jsp"><img src="../images/chat/asia.jpg"></a></td>
						</tr>
						<tr>
							<td><img src="../images/chat/africa.jpg"></td>
							<td><img src="../images/chat/oceania.jpg"></td>
							<td><img src="../images/chat/sa.jpg"></td>
						</tr>
					</table>
				</div>
				
				
		</div>
	
     </div>
     
 </div>

         <!-- Footer -->
            <div id="footer-wrapper">
               <div id="footer" class="container">
                  <header>
                     <h2>Questions or comments? <strong>Get in touch:</strong></h2>
                  </header>
                  <div class="row">
                     <div class="6u 12u(mobile)">
                        <section>
                           <form method="post" action="#">
                              <div class="row 50%">
                                 <div class="6u 12u(mobile)">
                                    <input name="name" placeholder="Name" type="text" />
                                 </div>
                                 <div class="6u 12u(mobile)">
                                    <input name="email" placeholder="Email" type="text" />
                                 </div>
                              </div>
                              <div class="row 50%">
                                 <div class="12u">
                                    <textarea name="message" placeholder="Message"></textarea>
                                 </div>
                              </div>
                              <div class="row 50%">
                                 <div class="12u">
                                    <a href="#" class="form-button-submit button icon fa-envelope">Send Message</a>
                                 </div>
                              </div>
                           </form>
                        </section>
                     </div>
                     <div class="6u 12u(mobile)">
                        <section>
                           <p>Erat lorem ipsum veroeros consequat magna tempus lorem ipsum consequat Phaselamet
                           mollis tortor congue. Sed quis mauris sit amet magna accumsan tristique. Curabitur
                           leo nibh, rutrum eu malesuada.</p>
                           <div class="row">
                              <div class="6u 12u(mobile)">
                                 <ul class="icons">
                                    <li class="icon fa-home">
                                       1234 Somewhere Road<br />
                                       Nashville, TN 00000<br />
                                       USA
                                    </li>
                                    <li class="icon fa-phone">
                                       (000) 000-0000
                                    </li>
                                    <li class="icon fa-envelope">
                                       <a href="#">info@untitled.tld</a>
                                    </li>
                                 </ul>
                              </div>
                              <div class="6u 12u(mobile)">
                                 <ul class="icons">
                                    <li class="icon fa-twitter">
                                       <a href="#">@untitled-tld</a>
                                    </li>
                                    <li class="icon fa-instagram">
                                       <a href="#">instagram.com/untitled-tld</a>
                                    </li>
                                    <li class="icon fa-dribbble">
                                       <a href="#">dribbble.com/untitled-tld</a>
                                    </li>
                                    <li class="icon fa-facebook">
                                       <a href="#">facebook.com/untitled-tld</a>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </section>
                     </div>
                  </div>
               </div>
               <div id="copyright" class="container">
                  <ul class="links">
                     <li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                  </ul>
               </div>
            </div>

      </div>


   </body>
</html>