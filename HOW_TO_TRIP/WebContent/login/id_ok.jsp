<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="dao.*"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	UserDAO manager = UserDAO.newInstance();
	int check = manager.confirmId(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
	function setParentText() {
		opener.document.getElementById("id").value = document
				.getElementById("check_id").value
		window.close()
	}
</script>
<title>id_ok</title>
</head>
<body>
	<%
		System.out.println(check);
		if (check == -1) {
			System.out.println(check);
	%>
	<center>
		<table id="table_content">
			<tr>
				<td width="35%" align="center" height="150px;">
					<h2><%=id%>는 사용할 수 있는 아이디입니다.</h2> 
					<input type="hidden" name="id" id='check_id' size="15" value="<%=id%>"> 
					<input type="button" name="use_id" value="아이디 사용" onclick="setParentText()">
				</td>
			</tr>
		</table>
	</center>
	<%
		}
		if (check == 1) {
			System.out.println(check);
	%>
	<script>
		alert("이미 존재하는 아이디입니다.");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>