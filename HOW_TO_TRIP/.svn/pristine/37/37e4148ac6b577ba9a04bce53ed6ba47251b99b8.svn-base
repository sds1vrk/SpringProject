<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*, newChat.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta charset="utf-8">
<link rel="stylesheet" href="../css/hover.css">
<link rel="stylesheet" href="../css/jquery.bxslider.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);

font {
	font-family: 맑은고딕;
	font-size: 20pt;
	color: white;
}

.navbar .navbar-nav {
	display: inline-block;
	float: none;
}

.navbar .navbar-collapse {
	text-align: center;
}

<title>Apache Tomcat WebSocket Examples: Chat </title> <style type
	="text/css">input#chat {
	width: 100%;
}

#console-container {
	width: 90%;
}

#console {
	border: 1px solid #CCCCCC;
	border-right-color: #999999;
	border-bottom-color: #999999;
	height: 500px;
	overflow-y: scroll;
	padding: 5px;
	width: 100%;
}

#console p {
	padding: 0;
	margin: 0;
}
</style>
<script type="application/javascript">
                 var Chat = {}; 
           Chat.socket = null;
           // connect() 함수 정의
           // 서버에 연결하고 onopen(), onclose(), onmessage() 콜백함수를 등록함
           Chat.connect = (function(host) {
               // 서버에 접속시도
               if ('WebSocket' in window) {
                   Chat.socket = new WebSocket(host);
               } else if ('MozWebSocket' in window) {
                   Chat.socket = new MozWebSocket(host);
               } else {
                   Console.log('Error: WebSocket is not supported by this browser.');
                   return;
               }
                // 서버에 접속이 되면 호출되는 콜백함수
               Chat.socket.onopen = function (event) {        	               	 
            	   var id="<%= (String)session.getAttribute("id")%>";            	               	  
            	                      Console.log(id+"님이 접속");              
              // 채팅입력창에 메시지를 입력하기 위해 키를 누르면 호출되는 콜백함수
                   document.getElementById('chat').onkeydown = function(event) {
  					   // 엔터키가 눌린 경우, 서버로 메시지를 전송함
                       if (event.keyCode == 13) {
                     var id="<%= (String)session.getAttribute("id")%>";
                           var message = id+":"+document.getElementById('chat').value;
                   if (message != '') {
                Chat.socket.send(message);
                 document.getElementById('chat').value = '';
									   }
                          /*  Chat.sendMessage(); */
                       }
                   };
                   
         
                   
               };
 			// 연결이 끊어진 경우에 호출되는 콜백함수
               Chat.socket.onclose = function () {
                  // 채팅 입력창 이벤트를 제거함
                  
                     var id="<%= (String)session.getAttribute("id")%>";            	               	  
                     Console.log(id+"님이퇴장");
                   
               
               };

               
               // 서버로부터 메시지를 받은 경우에 호출되는 콜백함
               Chat.socket.onmessage = function (message) {
                  // 수신된 메시지를 화면에 출력함
                   Console.log(message.data); 
               };
           });
           // connect() 함수 정의 끝
           // 위에서 정의한 connect() 함수를 호출하여 접속을 시도함

           Chat.initialize = function() {
 
             Chat.connect('ws://' + window.location.host + '/HOW_TO_TRIP/broadcasting'); 
             /* Chat.connect('ws://211.238.142.108:8081/HOW_TO_TRIP/broadcasting'); */
               };
   
           // 서버로 메시지를 전송하고 입력창에서 메시지를 제거함

           Chat.sendMessage = (function() {
               var message = document.getElementById('chat').value;
               if (message != '') {
                   Chat.socket.send(message);
                   document.getElementById('chat').value = '';
               }
           });
           
           var Console = {}; // 화면에 메시지를 출력하기 위한 객체 생성
           // log() 함수 정의
           Console.log = (function(message) {
               var console = document.getElementById('console');
               var p = document.createElement('p');
               p.style.wordWrap = 'break-word';
               p.innerHTML = message;
               console.appendChild(p); // 전달된 메시지를 하단에 추가함
               // 추가된 메시지가 25개를 초과하면 가장 먼저 추가된 메시지를 한개 삭제함
               while (console.childNodes.length > 25) {
                   console.removeChild(console.firstChild);
               }
               // 스크롤을 최상단에 있도록 설정함
               console.scrollTop = console.scrollHeight;
           });
           // 위에 정의된 함수(접속시도)를 호출함
           Chat.initialize();
       </script>

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top"
		style="background-color: #FFD8D8;
		border:none;">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#" style="color: white;"> <span
				class="glyphicon glyphicon-plane">여행어때?</span>
			</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="../mainpage/main.jsp"><span
						class="glyphicon glyphicon-home" style="color: white;">HOME</span></a></li>
				<li><a href="../intro/information.jsp"><span
						class="glyphicon glyphicon-globe" style="color: white;">여행정보</span></a></li>
				<li><a href="../board/view/story.jsp"><span
						class="glyphicon glyphicon-camera" style="color: white;">스토리</span></a></li>
				<li><a href="../newchat/client.jsp"><span
						class="glyphicon glyphicon-send" style="color: white;">채팅</span></a></li>
				<li><a href="../mypage/mypage.jsp"><span class="glyphicon glyphicon-user"
						style="color: white;">MyPAGE</span></a></li>
				<li><a href="../login/logout_ok.jsp"><span
						style="font-size: 5px; color: black;">Logout</span></a></li>
				<li><a href="../login/deleteForm.jsp"><span
						style="font-size: 5px; color: black;">resign</span></a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>
	<img src="../images/home-bg1.jpg" width="110%" height="400px "
		style="opacity: 0.8">
	
	<div style="margin: 1%;position:absolute;60%; width: 60%; top: 390px; background-color: pitch; position: absolute; left: 22%;">
		<div style="height:10%;color: white ; background:#FFD8D8; width:90%; font-size: 30px; text-align: center; font-style:italic; ;">여행어때?! 채팅방!</div>
		
		<div id="console-container">
			<div id="console" />
		</div>
		<p>
			<input style="width: 90%" type="text"
				placeholder=" type and press enter to chat" id="chat" />
		</p>
	<!-- 	<center>
		<div style="left: 250px; position: absolute; width: 50%;">
			<center>
				<div id="console-container">
					<div id="console" style="font-size: 20px;font: italic;">접속자</div>
				</div>
		</div>
		</center> -->
	</div>

</body>
</html>