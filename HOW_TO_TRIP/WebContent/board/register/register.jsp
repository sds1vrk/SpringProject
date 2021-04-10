<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*,story.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%	
	String realFolder = "";
	//실제 판들어질 폴더명 설정
	String saveFolder = "snap";
	String encType="euc-kr";
	int maxSize = 1024*1024*5;
	ServletContext ct=getServletContext();
	realFolder=ct.getRealPath(saveFolder);
	String id="jung";/* (String)session.getAttribute("id"); */
	int numbering=0;
	int storyno=0;
	String snapimg=null;
	 try{
		 MultipartRequest mul=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
		 Enumeration<?> file=mul.getFileNames();
		 String snap=(String)file.nextElement();
		 snap=mul.getFilesystemName(snap);
		 StoryDAO dao=StoryDAO.newInstance();
		 numbering=Integer.parseInt(mul.getParameter("numbering"));
		 storyno=Integer.parseInt(mul.getParameter("storyno"));
		 snapimg=snap;
		 String snapcontent=mul.getParameter("snapContent");
		 dao.insertSnap(storyno,numbering, snapimg, snapcontent);
		 //dao.setStorynoToSnap(storyno);
		 dao.commit();
		 response.sendRedirect("../view/myStory.jsp?id="+session.getAttribute("id"));
		 
		 
	}catch(Exception e){
		out.print(e.getMessage());
	}
	
%>
</head>
<body>

</body>
</html>