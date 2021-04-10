<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="dao.*,email.*"%>
    
<%
	String id=request.getParameter("id");
	String email=request.getParameter("email");
	UserDAO dao=UserDAO.newInstance();
	UserVO vo=new UserVO();
	vo=dao.searchPwd(id, email);
	String pwd=vo.getPwd();
	SearchPwd sp=new SearchPwd();
	sp.sendEmail(email, pwd);
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>비밀번호 찾기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<style type="text/css">
	.btn-primary{
	border: 0;
	background-color: #FFD8D8;
	}
	</style>
</head>
<body>
<%if(pwd!=null) {%>
	<center>
		<font>비밀번호가 회원님의 이메일로 전송되었습니다.</font>
		<br>
		<input class="btn btn-primary" type="button" onclick="self.location='../index.jsp'" value="로그인 화면으로">
	</center>
	<%
}else{
	%>
	<center>
		<font>아이디와 이메일을 확인해 주세요</font>
		<br>
		<input class="btn btn-primary" type="button" onclick="self.location='search_pwd.jsp'" value="다시입력하기">
	</center>
	<%
}
	%>
</body>
</html>