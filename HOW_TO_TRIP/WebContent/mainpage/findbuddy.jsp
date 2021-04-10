<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@page import="org.json.simple.JSONObject,java.io.PrintWriter,java.util.*,java.io.PrintWriter,dao.*"%>
<%
String dest=request.getParameter("country_selector_code");
String sday=request.getParameter("sday");
String eday=request.getParameter("eday");
StringTokenizer st=new StringTokenizer(sday,"-");
String	syy=null;
String	sdd=null;
String	smm=null;
String	eyy=null;
String	emm=null;
String	edd=null;
while(st.hasMoreTokens()){//여행시작날 분해
	syy=st.nextToken().replaceAll("-","");
	smm=st.nextToken().replaceAll("-","");
	sdd=st.nextToken().replaceAll("-","");
}
StringTokenizer st1=new StringTokenizer(eday,"-");
while(st1.hasMoreTokens()){//여행마지막날 분해
	eyy=st1.nextToken().replaceAll("-","");
	emm=st1.nextToken().replaceAll("-","");
	edd=st1.nextToken().replaceAll("-","");
}
UserDAO dao=UserDAO.newInstance();
List<UserVO> memberlist=dao.findBuddy(dest, syy, smm, sdd, eyy, emm, edd);
JSONObject jsonObject= new JSONObject();
List<Object> list=new ArrayList<Object>();
if(memberlist==null){
	HashMap<String,String> map=new HashMap<String,String>();
	map.put("id",null);
	map.put("img",null);
	list.add(map);
}
else{
for(UserVO vo:memberlist){
	HashMap<String,String> map=new HashMap<String,String>();
	map.put("id", vo.getId());
	map.put("img",vo.getProfileimg());
	list.add(map);
}
}
jsonObject.put("memberlist", list);
out.print(jsonObject);
%>
