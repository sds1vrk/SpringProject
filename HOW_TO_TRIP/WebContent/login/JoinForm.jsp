<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8" import="email.*"%>
<%
	EmailCheck em=new EmailCheck();
	String authNum=em.RandomNum();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<script type="text/javascript"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<title>Join_Page</title>
</head>
<body>
	<script>
		//한글깨짐 방지
		function echeck() { 
			url = "email_check.jsp?email=" + userInfo.email.value;
			window.open(url, "이메일인증","width=470, height=300,left=1100px,top=400px");
		};
		app.use(function(req, res, next) {
			if (req.url && req.url.indexOf('.htm') > -1) {
				res.header('Content-Type', 'text/html');
			}
			next();
		});

		// CheckField
		function checkfield() {
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			//아이디 입력여부 검사
			if (userInfo.id == "") {
				alert("아이디를 입력하지 않았습니다.")
				userInfo.id.focus()
				return false;
			}
			//아이디 유효성 검사 (영문대소문자, 숫자만 허용)
			for (i = 0; i < document.userInfo.id.value.length; i++) {
				ch = document.userInfo.id.value.charAt(i)
				if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
					alert("아이디는 대소문자, 숫자만 입력가능합니다.")
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
			//비밀번호 입력여부 체크
			if (document.userInfo.pwd.value == "") {
				alert("비밀번호를 입력하지 않았습니다.")
				document.userInfo.pwd.focus()
				return false;
			}
			if (userInfo.pwd.value == userInfo.id.value) {
				alert("아이디와 비밀번호가 같습니다.")
				document.userInfo.pwd.focus()
				return false;
			}
			//비밀번호 길이 체크(4~8자 까지 허용)
			if (document.userInfo.pwd.value.length<4 || document.userInfo.pwd.value.length>12) {
				alert("비밀번호를 4~12자까지 입력해주세요.")
				document.userInfo.pwd.focus()
				document.userInfo.pwd.select()
				return false;
			}
			//비밀번호 일치여부 체크
			if (document.userInfo.pwd.value != document.userInfo.pwd1.value) {
				alert("비밀번호가 일치하지 않습니다")
				document.userInfo.pwd1.value = ""
				document.userInfo.pwd1.focus()
				return false;
			}
			// 이름 입력여부 체크
			if (document.userInfo.name.value == "" || document.userInfo.name.value.length < 2) {
				alert("이름을 2자 이상 입력해주십시오.")
				document.userInfo.name.focus()
				return false;
			}
			// 성별 체크여부
			if (document.userInfo.gender[0].checked == false && document.userInfo.gender[1].checked == false) {
				alert("성별을 체크 해주세요.");
				return false;
			}
			// 생년월일 체크여부 체크
			if (document.userInfo.birthyy.value == "") {
				alert("생년월일을 입력하지 않았습니다.")
				document.userInfo.birthyy.focus()
				return false;
			}
			// 이메일 입력여부 체크
			if (document.userInfo.email.value == "") {
				alert("이메일을 입력하지 않았습니다.")
				document.userInfo.email.focus()
				return false;
			}
			// 휴대폰 입력여부 체크
			if (document.userInfo.phone.value == "") {
				alert("휴대전화를 입력하지 않았습니다.")
				document.userInfo.phone.focus()
				return false;
			}
			// 우편번호 입력여부 체크
			if (document.userInfo.addr1.value == "" || document.userInfo.addr3.value == "" ) {
				alert("주소를 입력하지 않았습니다.")
				document.userInfo.addr3.focus()
				return false;
			}
			if(document.userInfo.mailCheck.value == ""){
				alert("이메일을 인증해 주세요")
				document.userInfo.email.focus()
				return false;
			}
			return true;
		}

		//이메일 선택
		function email_change() {
			if (userInfo.email.options[userInfo.email.selectedIndex].value == '') {
				userInfo.email2.disabled = true;
				userInfo.email2.value = "";
			}
			if (userInfo.email.options[userInfo.email.selectedIndex].value == 'direct') {
				userInfo.email2.disabled = false;
				userInfo.email2.value = "";
				userInfo.email2.focus();
			} else {
				userInfo.email2.disabled = true;
				userInfo.email2.value = userInfo.email.options[userInfo.email.selectedIndex].value;
			}
		}

		//우편번호
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = ''; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								fullAddr = data.roadAddress;

							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								fullAddr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
							if (data.userSelectedType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample6_address').value = fullAddr;

							// 커서를 상세주소 필드로 이동한다.
							document.getElementById('sample6_address2').focus();
						}
					}).open();
		}
		// 아이디 중복 여부를 판단
		function openConfirmid(userInfo) {
			// url과 사용자 입력 id를 조합
			url = "confirmId.jsp?id=" + userInfo.id.value;
			// 새로운 윈도우 열기
			window.open(url, "중복확인","width=470, height=300,left=1100px,top=400px");
		}
	</script>
	<center>
		<h2>Join</h2>
		<!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬  -->
		<div id="wrap">
			<form method="post" action="join_ok.jsp" name="userInfo" onsubmit="return checkfield()" class="form-inline"> 
				<table  class="table-responsive" style="height:700px; padding-bottom : 50px;">
					<tr>
						<td id="title">아이디</td>
						<td><input class="form-control" type="text" name="id" id="id" maxlength="15" readonly="readonly">
							<input class="btn btn-primary" type="button" name="confirm_id" value="중복확인" onClick="openConfirmid(this.form)">
							(4~15자의 영문 대소문자와 숫자로만
							입력)
							
						</td>
					</tr>
					<tr>
						<td id="title">비밀번호</td>
						<td><input class="form-control" type="password" name="pwd" maxlength="15">
							(아이디와 다르게 4~8자 입력)</td>
					</tr>
					<tr>
						<td id="title">비밀번호 확인</td>
						<td><input class="form-control" type="password" name="pwd1" maxlength="15">
						</td>
					</tr>
					<tr>
						<td id="title">이름</td>
						<td><input class="form-control" type="text" name="name" maxlength="15"></td>
					</tr>
					<tr>
						<td id="title">성별</td>
						<td>
							<input type="radio" name="gender" id="gender" value="남">남 
							<input type="radio" name="gender" id="gender" value="여">여</td>
					</tr>
					<tr>
						<td id="title" >생년월일</td>
						<td><input class="form-control"  type="text" name="birthyy" id="birthyy" size="4" maxlength="4">년
							<select class="form-control" name="birthmm" id="birthmm" onclick="document.getElementById('birthmm').value">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select>월
						<select class="form-control" name="birthdd" id="birthdd" onchange="this.options[this.selectedIndex].text">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>
						</select>일</td>
					</tr>
					<tr>
						<td id="title">이메일</td>
						<td><input class="form-control" type="text" name="email" id="email">
							<input class="btn btn-primary" type="button" value="이메일인증" onclick="echeck();">
							<input class="form-control" type="text" placeholder="인증여부"  id="mailCheck" style="width: 85px;">
						</td>
					</tr>
					<tr>
						<td id="title">휴대전화</td>
						<td><input class="form-control" type="text" name="phone" maxlength="11">
							(ex: 01042272429)</td>
					</tr>
					<tr>
						<td id="title">주소</td>
						<td>
							<input class="form-control"  type="text" name="addr1" id="sample6_postcode" placeholder="우편번호 " style="text-align: left" readOnly> 
							<input class="btn btn-primary" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input class="form-control" type="text" name="addr2" id="sample6_address" placeholder="주소" style="text-align: left" readOnly> 
							<input class="form-control" type="text" name="addr3" id="sample6_address2" style="text-align: left" placeholder="상세주소" onfocus="this.value=''"></td>
					</tr>
				</table>
				<br> 
					<input class="btn btn-primary" type="submit" value="가입"> 
					<input class="btn btn-danger" type="button" value="취소" onclick="location.href='../index.jsp'">
			</form>
		</div>
	</center>
</body>
</html>