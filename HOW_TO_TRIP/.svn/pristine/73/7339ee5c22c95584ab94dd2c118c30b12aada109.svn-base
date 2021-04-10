<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*,story.*"%>
<%
	 request.setCharacterEncoding("EUC-KR");
	 String realFolder = "";
	 //실제 판들어질 폴더명 설정
	 String saveFolder = "story";
	 String encType="euc-kr";
	 int maxSize = 1024*1024*5;
	 ServletContext ct=getServletContext();
	 realFolder=ct.getRealPath(saveFolder);
	 String snap;
	 String id=(String)session.getAttribute("id");
	  try{
		 MultipartRequest mul=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
		 Enumeration<?> file=mul.getFileNames();
		 snap=(String)file.nextElement();
		 snap=mul.getFilesystemName(snap);
		 StoryDAO dao=StoryDAO.newInstance();
		 String storyname=mul.getParameter("title");
		 dao.insertStory(snap, id, storyname);
		 int storyno=dao.getMaxStoryno();
		 response.sendRedirect("registerSnap.jsp?storyno="+storyno);
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	
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