<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="trip.*"%>
 <%
 request.setCharacterEncoding("EUC-KR");
CalenderDAO dao=CalenderDAO.newInstance();
String loginID=(String)session.getAttribute("id");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
dao.modeDelete(year, month, day, loginID);
response.sendRedirect("calendar.jsp");
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
button{font-family:"hanna";width: 50px;height: 30px;background-color: #ed786a; border-color:#ed786a; border-radius: 10px;}
</style>
</head>
<body>

</body>
</html>