<%@ page info="diary calendar" %>
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" import="java.io.*,java.net.*,java.util.*,trip.*" %>


<%

	CalenderDAO dao=CalenderDAO.newInstance();
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	String query = new String();
	String url = new String();
	String selected = new String();
	//달력객체 생성
	Calendar myCalendar = Calendar.getInstance();
	
	int year = 0;
	int month = 0;
	int previous_year = 0;
	int previous_month = 0;
	int next_year = 0;
	int next_month = 0;
	int day = 0;
	String id="";
	
	
	int t_year = 0;
	int t_month = 0;
	int t_day = 0;
		
	t_year = myCalendar.get(myCalendar.YEAR);
	t_month = myCalendar.get(myCalendar.MONTH)+1;
	t_day = myCalendar.get(myCalendar.DAY_OF_MONTH);
	if (strYear == null) {
		year = myCalendar.get(myCalendar.YEAR);
	} else {
		year = Integer.parseInt(strYear);
	}
	
	if(strMonth == null) {
		month = myCalendar.get(myCalendar.MONTH);
	} else {
		month = Integer.parseInt(strMonth) -1;
	}
	
	myCalendar.set(myCalendar.YEAR, year);
	myCalendar.set(myCalendar.MONTH, month);
	month = month + 1;
	previous_year = myCalendar.get(myCalendar.YEAR) - 1;
	previous_month = myCalendar.get(myCalendar.MONTH);
	
	if (previous_month < 1) {
		previous_month = 12;
	} else if(previous_month > 12) {
		previous_month = 1;
	}
	next_year = myCalendar.get(myCalendar.YEAR) + 1;
	next_month = myCalendar.get(myCalendar.MONTH) + 2;
	if (next_month < 1) {
		next_month = 12;
	} else if (next_month > 12) {
		next_month = 1;
	}
	String loginID=(String)session.getAttribute("id");
	%>

<%--HTML 코드 시작--%>
<html>
<head>
<title>CALENDER</title>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
A:link{font-size:9pt; font-family:"Nanum Pen Script"; text-decoration:none;color:#3E3E3E}
A:visited{font-size:9pt; font-family:"Nanum Pen Script"; text-decoration:none;color:#3E3E3E}
A:hover {font-size: 9pt; font-family:"Nanum Pen Script"; text-decoration: underline;color: #F29708;}

.title {font-size: 9pt; font-family:"Nanum Pen Script"; color:#504F4F}

</style>



</head>
<body LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
<%--FORM 태그 시작--%>
<div class="cotainer">
<form method="post" action="calendar.jsp">
<center>
	<br>
	<font style="font-family: 'Hanna';" size="10" color="#000000">TRAVEL CALENDER</font>
</center>
<center>
<table style="background-color: rgba(255, 255, 255, 0.2); 
	width: 400; height: 400; border-radius: 10%; border:medium;">
	<tr>
		<td align="center" valign="top" >
		<br>
		<br>
	<table  border="0" width="250" height="40" valign="top"
						style="table-layout: fixed;">
		<tr>
							<td width="10%" height="50" align="center"><a
								href="calendar.jsp?year=<%=previous_year%>&month=<%=month%>"><img
									src="../jsp_img/left_year.gif" border="0" align="absmiddle"></a>
								<a
								href="calendar.jsp?year=<%=previous_month == 12 ? previous_year : year%>&month=<%=previous_month%>"><img
									src="../jsp_img/left_month.gif" border="0" align="absmiddle"></a>
							</td>
							<td wdith="80%" align="center" class="title"><font style="font-family: 'Hanna';" size="5"
								color="#000000"><b><%=year%></b></font> <font style="font-family: 'Hanna';" size="5"
								color="#000000" >년</font> <font style="font-family: 'Hanna';" size="5" color="#000000"><b><%=month%></b></font>
								<font style="font-family: 'Hanna';" size="5" color="#000000">월

									<td width="10%" align="center"><a
										href="calendar.jsp?year=<%=next_month == 1 ? next_year : year%>&month=<%=next_month%>"><img
											src="../jsp_img/right_month.gif" border="0" align="absmiddle"></a>
										<a href="calendar.jsp?year=<%=next_year%>&month=<%=month%>"><img
											src="../jsp_img/right_year.gif" border="0" align="absmiddle"></a>
								</td>
						</tr>
	</table>
	<table cellpadding="10px" align="center" width="210" height="250" 
						style="table-layout: fixed; word-break: break-all;">
		<tr align="center" valing="middle">
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" color="red" size="5">일</font></td>
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" size="5">월</font></td>
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" size="5">화</font></td>
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" size="5">수</font></td></td>
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" size="5">목</font></td></td>
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" size="5">금</font></td></td>
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" color="blue" size="5">토</font></td>
		</tr>
	<%
		while(true){
			day++;
			
			//날짜를 day 값으로 세팅
			myCalendar.set(myCalendar.DAY_OF_MONTH, day);
			
			//달력의 날짜가 다음달로 넘어가면 day 값이랑 달라짐
			if (day != myCalendar.get(myCalendar.DAY_OF_MONTH)) {
				break;
			}
			
			if (day == 1) {
				out.println("<tr align='right' valign='top'>");
				
				//요일 수만큼 빈칸 만들기
				for (int j = 1; j < myCalendar.get(myCalendar.DAY_OF_WEEK); j++) {
					out.print("<td width='30' height='20'>&nbsp;</td>");
				}
			}
			
				id="";
				id = dao.checkDay(Integer.toString(year), Integer.toString(month), Integer.toString(day), loginID);
				if (loginID.equals(id) ){
				out.println("<td width='30' height='20' align='center' background='../jsp_img/bg.png'>");
				url = "view.jsp?id="+id+"&year="+year+"&month="+month+"&day="+day;
				} else {
				out.println("<td width='30' height='20' align='center'>");
				url = "view_none.jsp?year="+year+"&month="+month+"&day="+day;
				}
				out.println("<a href='"+url+"'>");
			
			//요일이 일요일이면 빨간색으로 표시
			if (myCalendar.get(myCalendar.DAY_OF_WEEK) == myCalendar.SUNDAY) {
				out.println("<font color=red size='4'style="+"\"font-family: 'Hanna';\""+" >");
				out.println(myCalendar.get(myCalendar.DAY_OF_MONTH));
				out.println("</font>");
				
			} else if (myCalendar.get(myCalendar.DAY_OF_WEEK) == myCalendar.SATURDAY) {
				//요일이 토요일이면 파란색으로 표시					
				out.println("<font color=blue size='4'style="+"\"font-family: 'Hanna';\""+" >");
				out.println(myCalendar.get(myCalendar.DAY_OF_MONTH));
				out.println("</font>");
				
			} else if (t_year == year & t_month == month & t_day == day) {
				//오늘일 경우 폰트는 크고 색깔은 검은색으로				
				out.println("<font color=#EE7EAD size='4'style="+"\"font-family: 'Hanna';\""+" ><b>");
				out.println(myCalendar.get(myCalendar.DAY_OF_MONTH));
				out.println("</b></font>");
			
			} else {
				out.println("<font size='4'style="+"\"font-family: 'Hanna';\""+" >");
				out.println(myCalendar.get(myCalendar.DAY_OF_MONTH));
				out.println("</font>");
			}
			out.println("</a></td>");
			
			//요일이 토요일이면 다음줄로 내림
			if (myCalendar.get(myCalendar.DAY_OF_WEEK) == myCalendar.SATURDAY) {
				out.println("</tr>");
			}
		}
		
		
		//마지막이 토요일로 끝나지 않았으면 줄을 닫아줌
		if (myCalendar.get(myCalendar.DAY_OF_WEEK) != myCalendar.SATURDAY){
			out.println("</tr>");
		}
		
	%>
	
	</table>
</td>
</tr>
</table>
</center>
</form>
</div>

</body>
</html>
		