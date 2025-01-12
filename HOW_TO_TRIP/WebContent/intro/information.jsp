<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="info.*"%>
<% request.setCharacterEncoding("euc-kr"); %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>여행어때?</title>
<meta charset="utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=ko"></script>

<script> 
  function initialize() { 
  var myLatlng = new google.maps.LatLng(19.0760, 72.8777); // y, x좌표값
  var myLatlng1 = new google.maps.LatLng(34.6937, 135.5022); // y, x좌표값
  var myLatlng2 = new google.maps.LatLng(41.9028, 12.4964); // y, x좌표값
  var myLatlng3 = new google.maps.LatLng(13.7563, 100.5018); // y, x좌표값
  
   var mapOptions = { 
        zoom: 3, 
        center: myLatlng, 
        mapTypeId: google.maps.MapTypeId.ROADMAP 
  } 
 
  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
  
  var marker1 = new google.maps.Marker({ 
            position: myLatlng1, 
            map: map, 
            title: "OSAKA" 
  }); 
  
  var marker2 = new google.maps.Marker({ 
      position: myLatlng2, 
      map: map, 
      title: "ROME" 
});
  var marker3 = new google.maps.Marker({ 
      position: myLatlng3, 
      map: map, 
      title: "BANGKOK" 
});
  
  
  var infowindow1 = new google.maps.InfoWindow( 
          { 
            content: "<h3>OSAKA</h3>", 
            maxWidth: 100 
          } 
  );
  var infowindow2 = new google.maps.InfoWindow( 
          { 
            content: "<h3>ROME</h3>", 
            maxWidth: 100 
          } 
  ); 
  var infowindow3 = new google.maps.InfoWindow( 
          { 
            content: "<h3>BANGKOK</h3>", 
            maxWidth: 100 
          } 
  ); 

  google.maps.event.addListener(marker1, 'click', function() { 
  infowindow1.open(map, marker1); 
  }); 
  google.maps.event.addListener(marker2, 'click', function() { 
	  infowindow2.open(map, marker2); 
	  }); 
  google.maps.event.addListener(marker3, 'click', function() { 
	  infowindow3.open(map, marker3); 
	  }); 
  } 
 </script> 

</script>
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
</style>
   	
</head>
<body class="homepage" onload="initialize()">
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
         <div style="position: relative; width: auto; height: 1600px">
				<div class="titleh2">도시 가이드</div>
				<hr class="line">
				<center>
				
				<div style="margin: 12px;">
					<table>
						<tr>
							<th><a href="../intro/osaka.jsp"><img src="../images/osakamain.jpg"   width="400px" height="340px"></a> </th>
							<th><a href="../intro/rome.jsp"><img src="../images/romemain.jpg"  width="400px" height="340px"></a></th>
							<th><a href="../intro/bangkok.jsp" ><img src="../images/bangkokmain.jpg"  width="400px" height="340px"></a></th>
						</tr>
					</table>
					
				</div>
				<hr class="line">
					<!-- 구글맵 시작 -->
					<div id="map_canvas" style="width:1350px; height:600px;"></div>
						    <script async defer
						    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjmJwYEx9tUSZh_3-YLLZajwoHw3hE4uw&callback=initMap">
						    </script>
					<!-- 구글맵 끝부분 -->
					<hr class="line">
				</center>
				
				</div>

         </div>

      
</center>
   </body>
</html>