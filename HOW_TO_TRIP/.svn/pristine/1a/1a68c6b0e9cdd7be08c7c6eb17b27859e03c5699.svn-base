<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="story.*"%>
<%@page import="org.json.simple.JSONObject,java.io.PrintWriter,java.util.*,java.io.PrintWriter,dao.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String strStoryno=request.getParameter("storyno");
	String strSnapno=request.getParameter("snapno");
	String content=request.getParameter("comment");
	String fid=request.getParameter("fid");
	System.out.println(strStoryno);
	System.out.println(strSnapno);
	System.out.println(content);
	int storyno=Integer.parseInt(strStoryno);
	int snapno=Integer.parseInt(strSnapno);
	String id=(String)session.getAttribute("id");
	
	StoryDAO dao=StoryDAO.newInstance();
	dao.insertComment(snapno, id, content);
	response.sendRedirect("../view/fStory.jsp?storyno="+storyno+"&id="+fid);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>