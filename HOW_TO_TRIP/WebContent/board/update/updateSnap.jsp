<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="story.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String strNumbering=request.getParameter("numbering");
	if(strNumbering==null)
		strNumbering="1";
	int numbering=Integer.parseInt(strNumbering);
	
	String strStoryno=request.getParameter("storyno");
	if(strStoryno==null)
		strStoryno="1";
	int storyno=Integer.parseInt(strStoryno);
	
	StoryDAO dao=StoryDAO.newInstance();
	SnapVO vo=dao.snapUpdateData(storyno, numbering);
	int maxNumbering=dao.lastOfSnap(storyno);
	String isNextId=null;
	
	if(maxNumbering>numbering) {
		isNextId="next";
	} else {
		isNextId="noNext";
	} 
	pageContext.setAttribute("isNextId", isNextId);
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src=https://code.jquery.com/jquery-3.2.1.min.js></script>
	
	<script>
		function update(index) {
			if(index==1){
				document.updateForm.action='update.jsp';
			}
			if(index==2){
				document.updateForm.action='updateSnap_ok.jsp';
			}
			if(index==3){
				document.updateForm.action='updateSnapDelete.jsp';
			} 
			document.updateForm.submit();
		};
		
		$(function(){
			var isNextId=${isNextId};
			$('#noNext').hide();
		});
		
		function getThumbnailPrivew(html, $target) {
			var maxSize = 5 * 1024 * 1024 //5MB
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
						alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
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
<body>
	<center>
		<h3>${isNextId }</h3>
		<h3><%=storyno %></h3>
		<h3><%=numbering %></h3>
			<form name="updateForm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="numbering" value="<%=numbering%>">
				<input type="hidden" name="storyno" value="<%=storyno%>">
				<input type="hidden" name="default_img" value="<%=vo.getSnapimg()%>">
				<table>
					<tr>
						<td>(뒤로)</td>
						<td>
							<div id="noNext">
								<input type="button" value="다음" onclick="update(2);"/>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="img" style="height:500px; width: 500px; max-width: 500px; border: 1px solid #000;">
								<img alt="" src="<%=vo.getPath()%>" width=500px; height=500px;>
							</div>
						<td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							대표이미지<input type="file" name="file"id="file" accept="image/*" capture="camera"onchange="getThumbnailPrivew(this,$('#img'))" />&nbsp;
							<input type="button" value="스냅삭제" onclick="update(3);"/>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<input value="<%=vo.getSnapcontent()%>" name="snapContent" type="text">
						</td>
					</tr>
					<tr>
						<td><input type="button" value="수정완료" onclick="update(1);"/></td>
						<td><a href="updateCancle.jsp?storyno=<%=storyno%>">취소</a></td>
					</tr>
				</table>
			</form>
	</center>
</body>
</html>