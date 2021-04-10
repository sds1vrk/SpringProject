<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>아이디 찾기</title>
<script type="text/javascript">
	function check() {
		if (searchForm.name.value == "") {
			alert("이름을 입력하세요");
			searchForm.name.focus();
			return false;
		}
		if (searchForm.email.value == "") {
			alert("이메일을 입력하세요");
			searchForm.email.focus();
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
.btn-primary{
border: 0;
background-color: #FFD8D8;
}
</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" style="height:100px; background-color: #FFD8D8;border:none; ">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#" style="color:white;">
          	<span class="glyphicon glyphicon-plane" style="font-size: 65px;">여행어때?</span>
          </a>
        </div>
      </div>
</nav>
<div style="position: relative;top: 100px;">
	<center>
	<br><br>
		<h1>아이디 찾기<br><br></h1>
		<form id="searchForm" action="search_id_ok.jsp" onsubmit="return check()">
			<table>
				<tr>
					<td style="padding: 10px;">
						<input class="form-control" id="name" name="name" type="text" placeholder="이름 입력" value="">
					</td>
				</tr>
				
				<tr>
					<td style="padding: 10px;">
						<input class="form-control" id="email" name="email" type="text" placeholder="이메일 입력" value="">
					</td>
				</tr>
				<tr>
					<td style="padding: 10px;">
						<center>
							<input class="btn btn-primary" type="submit" value="입력"> 
						</center>
					</td>	
				</tr>
			</table>
		</form>
	</center>
</div>	
</body>
</html>