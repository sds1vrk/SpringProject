<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="trip.*"%>
<%
    request.setCharacterEncoding("EUC-KR");
    CalenderDAO dao=CalenderDAO.newInstance();
    String country = request.getParameter("country_selector_code");
	String resort = request.getParameter("resort");
	String place = request.getParameter("place");
	String year=request.getParameter("year");
	String month=request.getParameter("month");
	String day=request.getParameter("day");
	String id=request.getParameter("id");
	dao.modeUpdate(year, month, day, country, resort, place, id);
	response.sendRedirect("calendar.jsp");	
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>