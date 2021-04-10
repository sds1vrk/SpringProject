<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,story.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id=(String)session.getAttribute("id");
	
	String strStoryno=request.getParameter("storyno");
	if(strStoryno==null)
		strStoryno="0";
	
	int storyno=Integer.parseInt(strStoryno);
	
	StoryDAO dao=StoryDAO.newInstance();
	List<StoryVO> list=dao.storyUserData(id);	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title> 
	
	<link rel="stylesheet" href="../css/hover.css">
	<link rel="stylesheet" href="../css/jquery.bxslider.css">
	<link rel="stylesheet" href="../css/board.css" /> 
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="../js/jquery.bxslider.min.js"></script>
  	
  	
	<style type="text/css">
  		#mask {  
		  position:absolute;  
		  left:0;
		  top:0;
		  background-color: #000;   
		  display: none;  
		  z-index: 1;
		}
		.slider {
			display: none;
		}
		
		@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
		font{font-family: "hanna"; font-size: 20pt;}
		a{text-decoration:none; color: black;}
		td{padding-left: 50px;}
		
		.navbar .navbar-nav {
  			display: inline-block;
  			float: none;
		}
		
		.navbar .navbar-collapse {
 			 text-align: center;
		}
		
	</style>
</head>

<script>
	var page=1;
	var storyno=1;
	var row1=1;
	var row2=2;
	var mySlider;
	$(window).scroll(function () { var scrollValue = $(document).scrollTop(); });
	function wrapWindowByMask(){
	    //화면의 높이와 너비를 구한다.
	    var maskHeight = $(document).height();  
	    var maskWidth = $(window).width();  
	
	    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	    $('#mask').css({'width':maskWidth*2,'height':maskHeight*2});  
		
	    //애니메이션 효과
	    $('#mask').fadeIn(0);      
	    $('#mask').fadeTo("slow",0.6); 
	    $('.slider').show();
	    $('.bx-viewport').show();
	    $('.bx-wrapper').show();
	}
	
	$(".hover").mouseleave(
			  function () {
			    $(this).removeClass("hover");
			  }
			);
		
	$(function(){
		$('.window .close').click(function (e) {  
		    //링크 기본동작은 작동하지 않도록 한다.
		    e.preventDefault();  
		    $('#mask, .window').hide();
		});       

		//검은 막을 눌렀을 때
		$('#mask').click(function () {  
		    $(this).hide();  
		    $('.bx-viewport').hide();
		    $('.bx-wrapper').hide();
		    $('.bx-wrapper').remove();
		});
		$(document).keypress(function(e) {
			if(e.keyCode==13)e.preventDefault();
		});//엔터키 방지
		//이미지 눌렀을 때
		$('figure.snip1384').click(function(){
			var storyno=$(this).children("img").attr("id");
			$.ajax({
				url: "intoMyStory.jsp",
				type:'post',
				data:{"storyno":storyno},
				dataType: 'html',
				success : function(data) {
					$("<div class='slider'></div>").appendTo($('.sPosition'));
					$('.slider').html(data);
					var mySlider=$('.slider').bxSlider({
						slideWidth:800 , 
						margin:0,
						adaptiveHeight: false,
						infiniteLoop: false,	//무한루프 방지
						hideControlOnEnd: true, //끝에서 버튼 안보임
						moveSlides:1,
						touchEnabled:false
						});
					
					wrapWindowByMask();
					}		
				});
			});
		});
	
</script>
<!-- Head -->
<body>
	<a href="../register/registerStory.jsp">게시글 작성</a>
	<center style="background-color: white;">
	<div id="mask"></div>
	<div class="sPosition"></div>
	<center>
		<table id="st_table">
			<%
			int j=0;
			int k=0;
			for(int i=0; i<Math.ceil((double)list.size()/4); i++) {
				%>
				<tr>
					<%
						if(i==0) {
							j=0;
							k=j+4;
						} else {
							k=j+4;
						}
					%>
					<%
					for(;j<k&&j<list.size(); j++) {
						%>
						<td>
							<figure class="snip1384">
										<img alt="sample83" src="<%=list.get(j).getPath()%>" 
										width="300" height="300" id="<%=list.get(j).getStoryno()%>">
								<figcaption>
									<center>
									<h3 style="vertical-align:middle;"><%=list.get(j).getStoryname() %></h3>
									</center>
									<i class="ion-ios-arrow-right"></i>
								</figcaption>
									
							</figure>
						</td>
						
						<%
					}
					%>
				</tr>
				<%
			}
			%>
		</table>
<!-- /table -->
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</body>
</html>