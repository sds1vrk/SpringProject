<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*,story.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String saveFolder = "story";
	String encType="euc-kr";
	int maxSize = 1024*1024*5;
	ServletContext ct=getServletContext();
	String realFolder=ct.getRealPath(saveFolder);
	String snap;
	
	try{
		MultipartRequest mul=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
		Enumeration<?> file=mul.getFileNames();
		snap=(String)file.nextElement();
		snap=mul.getFilesystemName(snap);
		if(snap==null) {
			snap=mul.getParameter("default_img");
		}
		StoryDAO dao=StoryDAO.newInstance();
		String storyname=mul.getParameter("title");
		String strStoryno=mul.getParameter("storyno");
		int storyno=Integer.parseInt(strStoryno);
		dao.updateStory(storyno, storyname, snap);
		response.sendRedirect("updateSnap.jsp?storyno="+storyno);
	}catch(Exception e) {
		System.out.println(e.getMessage());
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