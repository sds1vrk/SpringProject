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
	//�޷°�ü ����
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

<%--HTML �ڵ� ����--%>
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
<%--FORM �±� ����--%>
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
								color="#000000" >��</font> <font style="font-family: 'Hanna';" size="5" color="#000000"><b><%=month%></b></font>
								<font style="font-family: 'Hanna';" size="5" color="#000000">��

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
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" color="red" size="5">��</font></td>
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" size="5">��</font></td>
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" size="5">ȭ</font></td>
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" size="5">��</font></td></td>
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" size="5">��</font></td></td>
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" size="5">��</font></td></td>
			<td width="30" height="25" class="title"><font style="font-family: 'Hanna';" color="blue" size="5">��</font></td>
		</tr>
	<%
		while(true){
			day++;
			
			//��¥�� day ������ ����
			myCalendar.set(myCalendar.DAY_OF_MONTH, day);
			
			//�޷��� ��¥�� �����޷� �Ѿ�� day ���̶� �޶���
			if (day != myCalendar.get(myCalendar.DAY_OF_MONTH)) {
				break;
			}
			
			if (day == 1) {
				out.println("<tr align='right' valign='top'>");
				
				//���� ����ŭ ��ĭ �����
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
			
			//������ �Ͽ����̸� ���������� ǥ��
			if (myCalendar.get(myCalendar.DAY_OF_WEEK) == myCalendar.SUNDAY) {
				out.println("<font color=red size='4'style="+"\"font-family: 'Hanna';\""+" >");
				out.println(myCalendar.get(myCalendar.DAY_OF_MONTH));
				out.println("</font>");
				
			} else if (myCalendar.get(myCalendar.DAY_OF_WEEK) == myCalendar.SATURDAY) {
				//������ ������̸� �Ķ������� ǥ��					
				out.println("<font color=blue size='4'style="+"\"font-family: 'Hanna';\""+" >");
				out.println(myCalendar.get(myCalendar.DAY_OF_MONTH));
				out.println("</font>");
				
			} else if (t_year == year & t_month == month & t_day == day) {
				//������ ��� ��Ʈ�� ũ�� ������ ����������				
				out.println("<font color=#EE7EAD size='4'style="+"\"font-family: 'Hanna';\""+" ><b>");
				out.println(myCalendar.get(myCalendar.DAY_OF_MONTH));
				out.println("</b></font>");
			
			} else {
				out.println("<font size='4'style="+"\"font-family: 'Hanna';\""+" >");
				out.println(myCalendar.get(myCalendar.DAY_OF_MONTH));
				out.println("</font>");
			}
			out.println("</a></td>");
			
			//������ ������̸� �����ٷ� ����
			if (myCalendar.get(myCalendar.DAY_OF_WEEK) == myCalendar.SATURDAY) {
				out.println("</tr>");
			}
		}
		
		
		//�������� ����Ϸ� ������ �ʾ����� ���� �ݾ���
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
		