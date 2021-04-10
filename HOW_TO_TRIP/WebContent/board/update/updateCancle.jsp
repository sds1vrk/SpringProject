<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="story.*"%>
<%
	String strStoryno=request.getParameter("storyno");
	if(strStoryno==null)
		strStoryno="1";
	int storyno=Integer.parseInt(strStoryno);
	StoryDAO dao=StoryDAO.newInstance();
	dao.rollback();
	response.sendRedirect("../view/myStory.jsp?storyno="+storyno);
%>