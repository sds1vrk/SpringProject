<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="story.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id=(String)session.getAttribute("id");
	String strStoryno=request.getParameter("storyno");
	if(strStoryno==null) 
		strStoryno="1";
	int storyno=Integer.parseInt(strStoryno);

	StoryDAO dao=StoryDAO.newInstance();
	StoryVO vo=dao.getStoryVO(storyno);	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%
		if(!(id.equals(vo.getId()))) {
			%>
		<script>
			alert("권한이 없습니다.");
			history.back();
		</script>
			<%
		}
	%>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		function update(index) {
			if(index==1){
				document.updateForm.action='updateStoryCommit.jsp';
			}
			if(index==2){
				document.updateForm.action='updateStory_ok.jsp?';
			}
			document.updateForm.submit();
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
		<%=storyno %>
		<form name="updateForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="storyno" value="<%=storyno%>">
			<input type="hidden" name="default_img" value="<%=vo.getTitleimage() %>">
			<h3>나의 이야기</h3>
			<table>
				<tr>
					<td>
						제목<input type="text" value=<%=vo.getStoryname()%>
						size="100" name="title" required><br/><br/>
					</td>
				</tr>
				<tr>
					<td>
						<div id="img" style="height:500px; width: 500px; max-width: 500px; border: 1px solid #000;">
							<img alt="" src="<%=vo.getPath()%>" width=500px; height=500px;>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						대표이미지<input type="file" name="file" id="file" accept="image/*" capture="camera"onchange="getThumbnailPrivew(this,$('#img'))" /><br/><br/>
					</td>
				</tr>
			</table>
				<input type="button" value="수정완료" onclick="update(1);"/>
				<input type="button" value="다음" onclick="update(2);"/>
		</form>
	</center>
</body>
</html>