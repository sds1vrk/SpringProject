<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="java.sql.Timestamp"%>
<% 
   if(session.getAttribute("id") == null){
	   response.sendRedirect("../mypage/initView.html");
   }else{
	request.setCharacterEncoding("utf-8");
%>
<!-- 
<jsp:useBean id="dao" class="dao.UserVO">
	<jsp:setProperty name="dao" property="*" />
</jsp:useBean>
 -->
<%
	String ID=(String)session.getAttribute("id");
	String PWD=request.getParameter("pw");
	String NAME=request.getParameter("name");
	String GENDER=request.getParameter("gender");
	String BIRTHYY=request.getParameter("birthyy");
	String BIRTHMM=request.getParameter("birthmm");
	String BIRTHDD=request.getParameter("birthdd");
	String EMAIL=request.getParameter("email");
	String PHONE=request.getParameter("phone");
	String ADDR1=request.getParameter("addr1");
	String ADDR2=request.getParameter("addr2");
	String ADDR3=request.getParameter("addr3");
	dao.setId(ID);
	dao.setPwd(PWD);
	dao.setName(NAME);
	dao.setGender(GENDER);
	dao.setBirth(BIRTHYY, BIRTHMM, BIRTHDD);
	dao.setEmail(EMAIL);
	dao.setPhone(PHONE);
	dao.setAddr(ADDR1,ADDR2,ADDR3);
	UserDAO manager = UserDAO.newInstance();
	manager.updateUser(dao);
%>

<html>
<head>
<title>회원정보수정</title>
<meta http-equiv="Refresh" content="5;url=main.jsp">
</head>
<body>
	<h3>회원정보 수정</h3>
	<div align="center">회원정보가 정상적으로 수정되었습니다.</div>
</body>
</html>
<%}%>