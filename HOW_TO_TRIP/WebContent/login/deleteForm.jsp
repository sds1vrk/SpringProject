<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
   if(session.getAttribute("id") == null){
	   response.sendRedirect("main.jsp");
   }else{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>회원탈퇴</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<center>
		<form name="myform" action="delete_ok.jsp" method="post" class="form-inline">
			<table  class="table-responsive">
				<tr>
					<td>아이디 </td> 
						<td><input class="form-control"  type="text" name="id" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<td>비밀번호 </td>
						<td><input class="form-control" type="password" name="pwd" size="15" maxlength="8"></td>
				</tr>
				<tr>
					<td>
						<input class="btn btn-danger" type="submit" value="회원탈퇴"> 
						<input class="btn btn-primary" type="button" value="취 소" onclick="location.href='../mypage/mypage.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
<%}%>