<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id=(String)session.getAttribute("id");
	if(id==null) {
	 out.println("<script>alert('�α������ּ���.');</script>");
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

					alert('gif,png,jpg,jpeg ���ϸ� ���ε� �Ҽ� �ֽ��ϴ�.');

					return;

				} else if (fileSize > maxSize) {
					alert("÷������ ������� 5MB �̳��� ��� �����մϴ�.    ");
					return;
				} else {
					var reader = new FileReader();
					reader.onload = function(e) {
						//$target.css('background-image', 'url(\"' + e.target.result + '\")'); // ������� ������
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
		<h3>���� �̾߱�</h3>
		<form action="registerStory_ok.jsp" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						����<input type="text" size="100" name="title" required><br/><br/>
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
				��ǥ�̹���<input type="file" name="file"id="file" accept="image/*" capture="camera"onchange="getThumbnailPrivew(this,$('#img'))" />
				<tr>
					<td>
						<input type="submit" value="����">
						<a href="registerCancle.jsp">���</a>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>