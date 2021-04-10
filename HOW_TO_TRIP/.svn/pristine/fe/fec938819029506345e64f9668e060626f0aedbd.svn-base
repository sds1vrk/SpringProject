<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="story.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String strStoryno=request.getParameter("storyno");
	int storyno=Integer.parseInt(strStoryno);	

	String strNumbering=request.getParameter("numbering");
	if(strNumbering==null) 
		strNumbering="1";
	int numbering=Integer.parseInt(strNumbering);
	pageContext.setAttribute("storyno", storyno);
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		function insert(index) {
			if(index==1){
				document.registerForm.action='registerSnap_ok.jsp';
			}
			if(index==2){
				document.registerForm.action='register.jsp';
			}
			document.registerForm.submit();
		}
		function getThumbnailPrivew(html, $target) {
			var maxSize = 5 * 1024 * 1024 //50MB
			var fileSize = 0;
			var browser = navigator.appName;

			if (html.files && html.files[0]) {
				if ($("#file").val() != "") {
					if (browser == "Microsoft Internet Explorer") {
						var oas = new ActiveXObject("Scripting.FileSystemObject");
						fileSize = oas.getFile(file.value).size;
					} else
						fileSize = file.files[0].size;
					var ext = $('#file').val().split('.').pop().toLowerCase();

					if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {

						alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');

						return;

					} else if (fileSize > maxSize) {
						alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.    ");
						return;
					} else {
						var reader = new FileReader();
						reader.onload = function(e) {
							$target.css('display', '');
							//$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
							$target.html('<img src="' + e.target.result + '" border="0" alt="" width=500px;height=500px; />');
						}
						reader.readAsDataURL(html.files[0]);
					}

				}

			}
		}
	</script>
</head>
<body>
	<center>
		<%="#"+numbering%>	
			<form name="registerForm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="numbering" value="<%=numbering%>">
				<input type="hidden" name="storyno" value="<%=storyno%>">
				<table>
					<tr>
							<input type="button" value="스냅추가" onclick="insert(1);"/>
					</td>
					</tr>
					<td>
						대표이미지<input type="file" name="file"id="file" accept="image/*" capture="camera"onchange="getThumbnailPrivew(this,$('#img'))" required /><br/><br/>
					</td>
					<div id="img"
						style="height:500px; width: 500px; max-width: 500px; border: 1px solid #000;"></div>
					</div>
					<tr>
						<td colspan="3" align="center"><textArea name="snapContent" cols="50" rows="10" placeholder="어떤 여행이었나요?"></textArea></td>
					</tr>
					<tr>
						<td><input type="button" value="등록" onclick="insert(2);"/></td>
						<td><a href="registerCancle.jsp">취소</a></td>
					</tr>
				</table>
			</form>
					
	</center>
	
</body>
</html>