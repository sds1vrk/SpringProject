<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	if (session.getAttribute("id") == null) {
		response.sendRedirect("../mypage/mypage.jsp");
	} 
	else {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		UserDAO manager = UserDAO.newInstance();
		int check = manager.userCheck(id, pwd);

		if (check == 1) {
			manager.deletemember(id);
			session.invalidate();
		} else {
			%>
				<script tpye="text/javascript">
					alert("아이디 혹은 비밀번호를 확인해주세요.");
					history.back();
				</script>
			<%
		}	
	}
%>

<html>
<head>
	<title>회원탈퇴</title>
</head>
<body>
	<center>
		<table>
		
		</table>
	</center>
	<center>
		<table>
			<tr>
				<td>회원정보가 삭제되었습니다.</td>
			</tr>
			<tr>
				<td><input type="button" value="확인"  onClick="location.href='../index.jsp'"></td>
			</tr>
		</table>
	</center>
</body>
</html>