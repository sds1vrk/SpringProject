<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="org.json.simple.JSONObject,java.io.PrintWriter,java.util.*,java.io.PrintWriter,story.*"%>
<%
	String strSnapno=request.getParameter("snapno");
	int snapno=Integer.parseInt(strSnapno);
	String comment=request.getParameter("comment");
	String id=(String)session.getAttribute("id");
	String sno=request.getParameter("snapno");
	StoryDAO dao=new StoryDAO();
	
	System.out.println("sno:"+snapno);
	System.out.println("comm:"+comment);
	System.out.println("id:"+id);
	dao.insertComment(snapno,id,comment);

	JSONObject jsonObject= new JSONObject();
	HashMap<String,String> map=new HashMap<String,String>();
	map.put("id", id);
	map.put("comment",comment);
	map.put("snapno",sno);
	
	jsonObject.put("comm",map);
	out.print(jsonObject);
	System.out.print(jsonObject);
%>