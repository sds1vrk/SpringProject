<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="trip.*"%>
  <%
	request.setCharacterEncoding("EUC-KR");
	CalenderDAO dao=CalenderDAO.newInstance();
	CalenderVO vo=new CalenderVO();
	String loginID = (String)session.getAttribute("id");
	String year = new String();
	String month = new String();
	String day = new String();	
	year    = request.getParameter("year");
	month = request.getParameter("month");
	day    = request.getParameter("day");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
<!--
A:link{font-size:9pt;  font-family: "hanna"; text-decoration:none;color:#3E3E3E}
A:visited{font-size:9pt;  font-family: "hanna"; text-decoration:none;color:#3E3E3E}
A:hover {font-size: 9pt;  font-family: "hanna"; text-decoration: underline;color: #F29708;}
font{font-family: "hanna"; font-size: 20pt;}
.title {font-size: 9pt;  font-family: "hanna"; color:#504F4F}
-->
button{font-family:"hanna";width: 50px;height: 30px;background-color: #FFD8D8; border-color:#FFD8D8; border-radius: 10px;}
</style>

</head>
<body>
<br><br><br><br><br>
<table width="300" height="200" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="300" height="5"></td>
	</tr>
	<tr>
		<td width="300" height="3" bgcolor="#FFD8D8"></td>
	</tr>
	<tr>
		<td width="300" height="2" bgcolor="#FFD8D8"></td>
	</tr>
	<tr>
		<br>
	</tr>
	<tr>		
		<td width="300" height="50" align="left" class="title"><img src = "../jsp_img/point.gif" border="0" align="absmiddle">&nbsp;<font><%= year %>년</font> <font><%= month %>월</font> <font><%= day %>일</font> <br><br>&nbsp;&nbsp;<font>스캐줄은 없습니다.</font></td>
	</tr>
	<tr>
		<td width="300"></td>
	</tr>

	
	
	<table>
	<table width="300"  height="25" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="300" height="20" align="center">		
			<a href="calendar.jsp"><button style= "font-family:'hanna';width: 50px;height: 30px;">달력</button></a>
			<a href="insert.jsp?year=<%= year %>&month=<%= month %>&day=<%= day %>"><button>작성</button></a>			
		</td>
	</tr>
	<tr>
		<td width="300" height="1" bgcolor="#FFD8D8"></td>
	</tr>
	<tr>
		<td wdith="300" height="2" bgcolor="#FFD8D8"></td>
	</tr>
	
	</table>
</body>
</html>