<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id=(String)session.getAttribute("id");
	if(id==null) {
	 out.println("<script>alert('로그인해주세요.');</script>");
	 out.println("<script>history.back();</script>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
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
						//$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
						$target.html('<img src="' + e.target.result + '" border="0" alt="" width=500px; height=500px; />');
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
		<h3>나의 이야기</h3>
		<form action="registerStory_ok.jsp" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						제목<input type="text" size="100" name="title" required><br/><br/>
					</td>
				</tr>
				<tr>
					<td>
						  <br/><br/>
					</td>
				</tr>
				<div id="img"
					style="height:500px; width: 500px; max-width: 500px; border: 1px solid #000;"></div>
				</div>
				대표이미지<input type="file" name="file"id="file" accept="image/*" capture="camera"onchange="getThumbnailPrivew(this,$('#img'))" />
				<tr>
					<td>
						<input type="submit" value="다음">
						<a href="registerCancle.jsp">취소</a>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>