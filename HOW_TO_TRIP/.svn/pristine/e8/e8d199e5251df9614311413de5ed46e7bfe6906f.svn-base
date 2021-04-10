<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="java.sql.Timestamp"%>
<%
	// request가 처리가 이루어지는 jsp파일에 한글이 깨지지 않도록! getParameter위에 써야함!
	request.setCharacterEncoding("utf-8");
%>
<!-- 
<jsp:useBean id="dao" class="dao.UserVO">
	<jsp:setProperty name="dao" property="*" />
</jsp:useBean>
 -->
<%
	String ID=request.getParameter("id");
	String PWD=request.getParameter("pwd");
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
	dao.setReg_date(new Timestamp(System.currentTimeMillis()));
	
	dao.setReg_date(new Timestamp(System.currentTimeMillis()));			// 가입시간 자동 등록
    UserDAO manager = UserDAO.newInstance();
    manager.getJoinData(dao);
%>

<script>
	location.href="../index.jsp";
</script>