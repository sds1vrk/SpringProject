<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="org.json.simple.JSONObject,java.io.PrintWriter,java.util.*,java.io.PrintWriter,story.*"%>
<%
	String strPaging=request.getParameter("page");
	System.out.println(strPaging);
	if(strPaging==null) 
		strPaging="1";
	int paging=Integer.parseInt(strPaging);
	
	StoryDAO dao=new StoryDAO();
	List<StoryVO> storylist=dao.storyPageData(paging);
	
	JSONObject jsonObject= new JSONObject();
	List<Object> list=new ArrayList<Object>();
	
	for(StoryVO vo:storylist){
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("img", vo.getPath());
		map.put("title",vo.getStoryname());
		map.put("storyno",String.valueOf(vo.getStoryno()));
		list.add(map);
	}
	jsonObject.put("storylist",list);
	out.print(jsonObject);
	System.out.print(jsonObject);
%>

