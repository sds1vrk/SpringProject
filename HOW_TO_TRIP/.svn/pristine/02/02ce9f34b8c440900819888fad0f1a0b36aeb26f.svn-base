<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	UserDAO manager = UserDAO.newInstance();
    int check = manager.confirmId(id);
    pageContext.setAttribute("check", check);
%>
<html>
<head>
	<title>ID 중복확인</title>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<script src="http:////code.jquery.com/jquery-1.8.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script>
	//예외처리
	function checkValue() {
		//아이디 유효성 검사 (영문대소문자, 숫자만 허용)
		for (i = 0; i < document.userInfo.id.value.length; i++) {
			ch = document.userInfo.id.value.charAt(i)
			if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')
					&& !(ch >= 'A' && ch <= 'Z')) {
				alert("아이디는 대소문자,숫자만 입력가능합니다.")
				document.userInfo.id.focus()
				document.userInfo.id.select()
				return false;
			}
		}
		//아이디에 공백 사용하지 않기
		if (document.userInfo.id.value.indexOf(" ") >= 0) {
			alert("아이디에 공백을 사용할 수 없습니다.")
			document.userInfo.id.focus()
			document.userInfo.id.select()
			return false;
		}
		//아이디 길이 체크 (4~15자)
		if (document.userInfo.id.value.length<4 || document.userInfo.id.value.length>15) {
			alert("아이디를 4~15자까지 입력해주세요.")
			document.userInfo.id.focus()
			document.userInfo.id.select()
			return false;
		}
		return true;
	}
</script>
</head>
<body>
   <center>
      <form action="id_ok.jsp" method="post" name="userInfo" onsubmit="return checkValue()">
         <table id="table_content">
            <tr>
               <td id="title">아이디</td>
               <td align="center" height="150px;">
               <input class="form-control" type="text" name="id" id="id" maxlength="15"> 
               </td>
               <td>
               <input class="btn btn-primary" type="submit" name="check" value="중복확인">
               </td>
            </tr>
         </table>
      </form>
   </center>
</body>
</html>