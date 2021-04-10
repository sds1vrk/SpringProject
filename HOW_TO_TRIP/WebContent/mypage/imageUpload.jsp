<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	function getThumbnailPrivew(html, $target) {
		var maxSize = 5 * 1024 * 1024 //30MB
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
						$target.html('<img src="' + e.target.result + '" border="0" alt="" />');
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

		<style>
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	width: 100%;
	max-width: 100%;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
input[type="submit"]{
background: #FFD8D8;


border-radius: 3px 3px 3px 3px;
border-color: #FFD8D8;
color: #ffffff;

padding: 6px 12px;
}

 input[type="submit"]:hover  {

background: #FFD8D8 !important;
border-color: #FFD8D8;
border-radius: 3px 3px 3px 3px;

color: #ffffff;

padding: 6px 12px;

}
</style>

		<form name="form" id="form" action="imgup.jsp" method="post"
			enctype="multipart/form-data" autocomplete="off">
			<div class="filebox">
				<label for="file">프로필 사진 변경(Click)</label> <input type="file" name="file"
					id="file" accept="image/*" capture="camera"
					onchange="getThumbnailPrivew(this,$('#cma_image'))" /> <br /> <br />
				<div id="cma_image"
					style="width: 100%; max-width: 100%; border: 1px solid #000; display: none;"></div>
			</div>
			<input type="submit" value="제출">
		</form>
	</center>


</body>
</html>