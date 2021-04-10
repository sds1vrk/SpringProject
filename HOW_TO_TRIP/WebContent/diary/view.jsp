<%@ page info="diary calendar" %>
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" import="java.sql.*,java.io.*,java.net.*,java.util.*,trip.*" %>




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
	vo=dao.modeView(year,month,day, loginID);
	String country=vo.getCountry();
	CodeToCountry totext=new CodeToCountry();
	String korcounrty=totext.codeToCountry(country);
%>
<html>
<head>
<title>일정</title>

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
<body LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
<br><br><br><br><br>
<table width="300" height="200" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td align="center" valign="top">
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
		<td width="300" height="20" align="left" class="title">&nbsp;<font><%= year %>년 <%= month %>월 <%= day %>일</font></td>
	</tr>
	<tr>
		<td width="300" height="20" align="left" class="title">&nbsp;<font>여행국가&nbsp;:&nbsp;<%=korcounrty%></font></td>
	</tr>
	<tr>
		<td width="300" height="20" align="left" class="title">&nbsp;<font>숙박&nbsp;:&nbsp;<%= vo.getResort() %></font></td>
	</tr>
	<tr>
		<td width="300" height="20" align="left" class="title">&nbsp;<font>관광지&nbsp;:&nbsp;<%=vo.getPlace() %></font></td>
	</tr>
	<tr>
		<td width="300"></td>
	</tr>
	
	
	
	</table>
	<table width="300"  height="25" border="0" cellspacing="0" cellpadding="0" align="center">
	
	
	<tr>
		<td width="300" height="20" align="center">
			<a href="calendar.jsp"><img src="../jsp_img/list.gif" border="0" alt="diary_list.gif" align="absmiddle"></a>
			<a href="update.jsp?year=<%= year %>&month=<%= month %>&day=<%= day %>"><img src = "../jsp_img/modify.gif" border="0" alt="modify.gif" align="absmiddle"></a>
			<a href="delete.jsp?id=<%= loginID %>&year=<%= year %>&month=<%= month %>&day=<%= day %>"><img src = "../jsp_img/delete.gif" border="0" alt="delete.gif" align="absmiddle"></a>			
		</td>
	</tr>
	<tr>
		<td width="300" height="1" bgcolor="#FFD8D8"></td>
	</tr>
	<tr>
		<td wdith="300" height="2" bgcolor="#FFD8D8"></td>
	</tr>
	
	</table>		
		</td>
	</tr>
</table>
</body>
</html>