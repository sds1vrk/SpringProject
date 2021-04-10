<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="dao.*"%>
<%
   String id = request.getParameter("id");
   String pw = request.getParameter("pwd");
   
   UserDAO dao = UserDAO.newInstance();
   int res = dao.isLogin(id,pw);
   
   if(res==0){
      %>
      <script type="text/javascript">
         alert("아이디가 맞지 않습니다.")
         history.back();
      </script>
      <%
   }else if(res==1){
      %>
      <script type="text/javascript">
         alert("비밀번호가 맞지 않습니다.")
         history.back();
      </script>
      <%
   }else if(res==2){
	   String name=dao.getLogData(id);
	   session.setAttribute("id", id);
	   session.setAttribute("name", name);
	   response.sendRedirect("../mainpage/main.jsp");
   }
%>