<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*,story.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("EUC-KR");
	String saveFolder = "snap";
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
		StoryDAO dao=StoryDAO.newInstance();
		if(snap==null) {
			snap=mul.getParameter("default_img");
		}
		String strStoryno=mul.getParameter("storyno");
		int storyno=Integer.parseInt(strStoryno);
		
		String strNumbering=mul.getParameter("numbering");
		int numbering=Integer.parseInt(strNumbering);
		
		String snapimg=mul.getParameter("snapimg");
		String snapcontent=mul.getParameter("snapContent");
		
		dao.updateSnap(storyno, numbering, snap, snapcontent);
		dao.commit();
		response.sendRedirect("../view/myStory.jsp?id="+session.getAttribute("id"));
		
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
%>