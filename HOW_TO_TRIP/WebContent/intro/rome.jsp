<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.text.Format"%>
<%@page import="sun.applet.Main"%>  
<%@page import="info.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>여행어때?</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="http://maps.googleapis.com/maps/api/js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

   <%
		WeatherMain weather=new WeatherMain();
		WeatherVO vo=weather.getData("Rome");
		DecimalFormat df=new DecimalFormat("0.#");
		String curTemp=df.format(vo.getCurTemp());
		String minTemp=df.format(vo.getMinTemp());
		String maxTemp=df.format(vo.getMaxTemp());
%>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
#buddyImg
{
	width: 200px;
	height: 200px;
	border-radius: 100px;
	padding: 10px;
}
font{
	font-family: "hanna";
	font-size: 20px;
}
.navbar .navbar-nav {
  			display: inline-block;
  			float: none;
		}
		
		.navbar .navbar-collapse {
 			 text-align: center;
		}
		.img-responsive{
		width: 100%;
		height: 400px;
		}
		.line{
		 max-width: 71%;
		 border: 2px solid black;
		 
		}
.img-responsive{
	width:100%;
	height: auto;
}
.btn-primary{
border: 0;
background-color: #FFD8D8;
}
		.titleh2{
	 height: 50px;
    margin-top: 0px;
    font-size: 30px;
    color: #131313;
    font-weight: normal;
    font-family: 'Hanna', sans-serif;
		}
		 #map {
        height: 260px;
        width: 100%;
        }
        .weather{
		font-weight: normal;
    	font-family: 'Hanna', sans-serif;
    	color:white;
		}
</style> 
   
</head>
<body class="homepage">
     
       <center>
	<nav class="navbar navbar-inverse navbar-fixed-top" style="background-color: #FFD8D8;
		border:none;">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#" style="color:white;">
          	<span class="glyphicon glyphicon-plane">여행어때?</span>
          </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="../mainpage/main.jsp"><span class="glyphicon glyphicon-home" style="color:white;">HOME</span></a></li>
            <li><a href="../intro/information.jsp"><span class="glyphicon glyphicon-globe" style="color:white;">여행정보</span></a></li>
            <li><a href="../board/view/story.jsp"><span class="glyphicon glyphicon-camera" style="color:white;">스토리</span></a></li>
            <li><a href="../newchat/client.jsp"><span class="glyphicon glyphicon-send" style="color:white;">채팅</span></a></li>
           <li><a href="../mypage/mypage.jsp"><span class="glyphicon glyphicon-user" style="color:white;">MyPAGE</span></a></li>
            <li><a href="../login/logout_ok.jsp"><span style="font-size: 5px; color:black;">Logout</span></a></li>
            <li><a href="../login/deleteForm.jsp"><span style="font-size: 5px; color:black;">resign</span></a></li>
          </ul>
        </div>
      </div>
    </nav>
	<img class="img-responsive" src="../images/home-bg1.jpg" width="100%" height="400px " style="opacity: 0.8">

     

         <!-- Banner -->
      <div id="banner-wrapper">
         <div class="asdf"
            style="position: relative; width: auto; height: 1600px">
            <!-- <div id="banner-wrapper" style=postion:relative;> -->
				<div class="titleh2">도시 가이드</div>
				<hr class="line">
				<center>
				
				<div style="margin: 12px; ">
					
					<table width="1350" height="1300"  >
					
							<tr>
								<td rowspan="2" colspan="3" width="75%"  height="40%"><img src="../images/rome/rome-intro.jpg" style="width: 100%; height: 470px;"></td>
									<!-- 날씨부분 -->
								<td width="25%"  height="20%"  bgcolor=" #0B4C5F"> 
								 	<div class="weather" >
										<div>
											<h3 style= "margin-left: 20px;"><img src="../images/weather/ita_flag.jpg" style="width: 20px; ">  ROME, ITARY</h3>
										</div>
										<div>							
											<table>
											 <tr>
											 	<td><img src="../images/weather/<%=vo.getWeather() %>.png" width="100px" ></td>								 
												<td style="font-size: 80px"><%=curTemp%>˚C</td>
											<tr>
											</table>
										</div>
										<div style="float: right; margin-right: 40px;">
												<img src="../images/weather/min.png" style="width: 20px; "><%=minTemp %>˚C |
												<img src="../images/weather/max.png" style="width: 20px; "><%=maxTemp %>˚C
										</div>
									</div>
									<!-- 날씨부분 끝  -->
								</td>
							</tr>
							<tr>
								<td width=25%;  height=20%; >
								<div id="map" ></div>
									    <script>
									
									      function initMap() {
									        var myLatLng = {lat: 41.9028, lng: 12.4964};								   
									        
									        var map = new google.maps.Map(document.getElementById('map'), {
									          zoom: 9,
									          center: myLatLng
									        });
									
									        var marker = new google.maps.Marker({
									          position: myLatLng,
									          map: map,
									          title: 'Hello World!'
									        });
									      }
									    </script>
									    <script async defer
									    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjmJwYEx9tUSZh_3-YLLZajwoHw3hE4uw&callback=initMap">
									    </script>			
								</td>
							</tr>
							<tr>
								<td colspan="2"   width="50%"  height="10%"><img src="../images/rome/romeintro.jpg" style="width: 100%; height: auto; "></td>
								<td width="25%"  height="10%"><img src="../images/rome/romemoney.jpg" style="width: 100%; height: auto; "></td>
								<td width="25%"  height="10%"><img src="../images/rome/romecon.jpg" style="width: 100%; height: auto;"></td>
							</tr>
							<tr>
								<td width="25%"  height="25%"><img src="../images/bestfood.jpg" style="width: 100%; height: auto;"></td>
								<td width="25%"  height="25%"><img src="../images/rome/romefood1.jpg" style="width: 100%; height: auto;"></td>
								<td width="25%"  height="25%"><img src="../images/rome/romefood2.jpg" style="width: 100%; height: auto;"></td>
								<td width="25%"  height="25%"><img src="../images/rome/romefood3.jpg" style="width: 100%; height: auto;"></td>
							</tr>
							<tr>
								<td width="25%"  height="25%"><img src="../images/rome/romeplace1.jpg" style="width: 100%; height: auto;"></td>
								<td width="25%"  height="25%"><img src="../images/rome/romeplace2.jpg" style="width: 100%; height: auto;"></td>
								<td width="25%"  height="25%"><img src="../images/rome/romeplace3.jpg" style="width: 100%; height: auto;"></td>
								<td width="25%"  height="25%"><img src="../images/bestplace.jpg" style="width: 100%; height: auto;"></td>
							</tr>
							
					</table>
				</div>
				<hr class="line">
						
				
				</center>
				
				</div>

         </div>

	</center>
      

		
   </body>
</html>