<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*,story.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String saveFolder = "story";
	String encType="euc-kr";
	int maxSize = 1024*1024*5;
	ServletContext ct=getServletContext();
	String realFolder=ct.getRealPath(saveFolder);
	try{
		MultipartRequest mul=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
		String strNumbering=mul.getParameter("numbering");
		if(strNumbering==null)
			strNumbering="1";
		int numbering=Integer.parseInt(strNumbering);
		
		String strStoryno=mul.getParameter("storyno");
		if(strStoryno==null)
			strStoryno="1";
		int storyno=Integer.parseInt(strStoryno);
		
		StoryDAO dao=StoryDAO.newInstance();
		dao.deleteSnap(storyno, numbering);
		response.sendRedirect("updateSnap.jsp?storyno="+storyno+"&numbering="+numbering);
	}catch(Exception ex){
		
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