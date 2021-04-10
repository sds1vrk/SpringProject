<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="story.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id=(String)session.getAttribute("id");
	String strStoryno=request.getParameter("storyno");
	int storyno=Integer.parseInt(strStoryno);
	StoryDAO dao=StoryDAO.newInstance();
	StoryVO vo=dao.getStoryVO(storyno);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%	
	System.out.println("사용자id:"+vo.getId());
	System.out.println("게시글id:"+id);
	if(id.equals(vo.getId())){
	dao.deleteStory(storyno);
	System.out.println("요깅 삭제");
	%>
	<script type="text/javascript">
	alert("삭제완료");
	</script>
	<%
	response.sendRedirect("../view/myStory.jsp?id="+session.getAttribute("id"));
	} else {
		%>
		<script type="text/javascript"> 
		alert("권한이 없습니다");
		history.back();
		</script> 
		<%
	}
%>
</body>
</html>