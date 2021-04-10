<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="dao.*,email.*,java.util.*"%>
    
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	System.out.println("name:"+name);
	String email=request.getParameter("email");
	System.out.println("email:"+email);
	UserDAO dao=UserDAO.newInstance();
	String si = dao.searchId(name, email);
	System.out.println("si:"+si);
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>아이디 찾기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<style type="text/css">
	.btn-primary{
	border: 0;
	background-color: #FFD8D8;
	}
	</style>
</head>
<body>
<%if(si!=""){%>
	<center>
		<font>회원님의 id는 <%=si %>입니다.</font>
		<br>
		<input class="btn btn-primary" type="button" onclick="self.location='../index.jsp'" value="로그인 화면">
		<input class="btn btn-primary" type="button" onclick="self.location='search_pwd.jsp'" value="비밀번호 찾기">
	</center>
	<%
}else{
	%>
	<center>
		<font>아이디와 이메일을 확인해 주세요</font>
		<br>
		<input class="btn btn-primary" type="button" onclick="self.location='search_id.jsp'" value="다시 입력하기">
	</center>
	<%
}
	%>
</body>
</html>