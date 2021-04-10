<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>

<%
    String user_Id = (String)session.getAttribute("id"); 
	UserDAO dao = UserDAO.newInstance();
    UserVO vo = dao.getmember(user_Id);
    String gender =vo.getGender();
    String birth2 = vo.getBirth2();
    String birth3 = vo.getBirth3();
    String addr1=vo.getAddr1();
    String addr2=vo.getAddr2();
    String addr3=vo.getAddr3();
   
%>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
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
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Modify_Info</title>
</head>
<body>
<center>
	<h1>회원수정</h1>
	<form method="post" action="modify_ok.jsp" name="userinput" class="form-inline">
		<table class="table-responsive" style="height:700px; padding-bottom : 50px;">
			<tr>
				<td id="title">아이디</td>
				<td><input class="form-control" type="text" name="id" id="id" value="<%=vo.getId()%>"></td>
			</tr>
			<tr>
				<td id="title">비밀번호</td>
				<td><input type="password" name="pw" maxlength="15" value="<%=vo.getPwd()%>"></td>
			</tr>
			<tr>
				<td id="title">비밀번호 확인</td>
				<td><input class="form-control" type="password" name="pw2" maxlength="15" value="<%=vo.getPwd()%>"></td>
			</tr>
			<tr>
				<td id="title">이름</td>
				<td><input class="form-control" type="text" name="name" value="<%=vo.getName()%>"></td>
			</tr>
			<tr>
				<td id="title">성별</td>
				<td><input type="radio" name="gender" id="gender" value="남" <%=(gender.equals("남"))?"checked":""%>>남
					<input type="radio" name="gender" id="gender" value="여" <%=(gender.equals("여"))?"checked":""%>>여</td>
			</tr>
			<tr>
				<td id="title">생년월일</td>
				<td><input class="form-control" type="text" name="birthyy" id="birthyy" size="4"
					maxlength="4"value="<%=vo.getBirth1()%>">년 <select class="form-control" name="birthmm" id="birthmm"
					onclick="document.getElementById('birthmm').value">
						<option value="1" <%=birth2.equals("1")?" selected":""%>>1</option>
						<option value="2" <%=birth2.equals("2")?" selected":""%>>2</option>
						<option value="3" <%=birth2.equals("3")?" selected":""%>>3</option>
						<option value="4" <%=birth2.equals("4")?" selected":""%>>4</option>
						<option value="5" <%=birth2.equals("5")?" selected":""%>>5</option>
						<option value="6" <%=birth2.equals("6")?" selected":""%>>6</option>
						<option value="7" <%=birth2.equals("7")?" selected":""%>>7</option>
						<option value="8" <%=birth2.equals("8")?" selected":""%>>8</option>
						<option value="9" <%=birth2.equals("9")?" selected":""%>>9</option>
						<option value="10" <%=birth2.equals("10")?" selected":""%>>10</option>
						<option value="11" <%=birth2.equals("11")?" selected":""%>>11</option>
						<option value="12" <%=birth2.equals("12")?" selected":""%>>12</option>
				</select>월<select class="form-control" name="birthdd" id="birthdd"
					onchange="this.options[this.selectedIndex].text">
						<option value="1" <%=birth3.equals("1")?" selected":""%>>1</option>
						<option value="2" <%=birth3.equals("2")?" selected":""%>>2</option>
						<option value="3" <%=birth3.equals("3")?" selected":""%>>3</option>
						<option value="4" <%=birth3.equals("4")?" selected":""%>>4</option>
						<option value="5" <%=birth3.equals("5")?" selected":""%>>5</option>
						<option value="6" <%=birth3.equals("6")?" selected":""%>>6</option>
						<option value="7" <%=birth3.equals("7")?" selected":""%>>7</option>
						<option value="8" <%=birth3.equals("8")?" selected":""%>>8</option>
						<option value="9" <%=birth3.equals("9")?" selected":""%>>9</option>
						<option value="10" <%=birth3.equals("10")?" selected":""%>>10</option>
						<option value="11" <%=birth3.equals("11")?" selected":""%>>11</option>
						<option value="12" <%=birth3.equals("12")?" selected":""%>>12</option>
						<option value="13" <%=birth3.equals("13")?" selected":""%>>13</option>
						<option value="14" <%=birth3.equals("14")?" selected":""%>>14</option>
						<option value="15" <%=birth3.equals("15")?" selected":""%>>15</option>
						<option value="16" <%=birth3.equals("16")?" selected":""%>>16</option>
						<option value="17" <%=birth3.equals("17")?" selected":""%>>17</option>
						<option value="18" <%=birth3.equals("18")?" selected":""%>>18</option>
						<option value="19" <%=birth3.equals("19")?" selected":""%>>19</option>
						<option value="20" <%=birth3.equals("20")?" selected":""%>>20</option>
						<option value="21" <%=birth3.equals("21")?" selected":""%>>21</option>
						<option value="22" <%=birth3.equals("22")?" selected":""%>>22</option>
						<option value="23" <%=birth3.equals("23")?" selected":""%>>23</option>
						<option value="24" <%=birth3.equals("24")?" selected":""%>>24</option>
						<option value="25" <%=birth3.equals("25")?" selected":""%>>25</option>
						<option value="26" <%=birth3.equals("26")?" selected":""%>>26</option>
						<option value="27" <%=birth3.equals("27")?" selected":""%>>27</option>
						<option value="28" <%=birth3.equals("28")?" selected":""%>>28</option>
						<option value="29" <%=birth3.equals("29")?" selected":""%>>29</option>
						<option value="30" <%=birth3.equals("30")?" selected":""%>>30</option>
						<option value="31" <%=birth3.equals("31")?" selected":""%>>31</option>
				</select>일</td>
			</tr>
			<tr>
				<td id="title">이메일</td>
				<td><input class="form-control" type="text" name="email" id="email" value="<%=vo.getEmail()%>"
					onfocus="this.value=''"> (ex. wlgns919@hanmail.net)</td>
			</tr>
			<tr>
				<td id="title">휴대전화</td>
				<td><input class="form-control" type="text" name="phone" maxlength="11" value="<%=vo.getPhone()%>">
					(ex: 01042272429)</td>
			</tr>
			<tr>
				<td id="title">주소</td>
				<td><input class="form-control" type="text" name="addr1" id="sample6_postcode"  value="<%=addr1%>" style="text-align: left" readOnly> 
					<input class="btn btn-primary" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input class="form-control" type="text" name="addr2" id="sample6_address" value="<%=addr2%>" style="text-align: left" readOnly> 
					<input class="form-control" type="text" name="addr3" id="sample6_address2" style="text-align: left" value="<%=addr3%>" onfocus="this.value=''"></td>
			</tr>
		</table>
		<br><input class="btn btn-primary" type="submit" value="수정"> 
			<input class="btn btn-danger" type="button" value="취소" onclick="location.href='../mypage/initView.html'">
	</form>
	</center>
</body>
</html> 