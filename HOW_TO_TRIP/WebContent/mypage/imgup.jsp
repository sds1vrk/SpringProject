<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*,dao.*"%>


<%
 request.setCharacterEncoding("euc-kr");
 //프로젝트내에 만들어질 폴더를 저장할 이름 변수 선언
 String realFolder = "";
 //실제 판들어질 폴더명 설정
 String saveFolder = "profile";
 String encType="euc-kr";
 int maxSize = 1024*1024*5;
 ServletContext ct=getServletContext();
 realFolder=ct.getRealPath(saveFolder);
 String profile=null;
  try{
	 MultipartRequest mul=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
	 Enumeration<?> file=mul.getFileNames();
	 profile=(String)file.nextElement();
	 profile=mul.getFilesystemName(profile);
	 UserDAO dao=UserDAO.newInstance();
	 dao.updateProfile((String)session.getAttribute("id"), profile);
	 response.sendRedirect("initView.html");
	 
 }catch(Exception e){
	 e.printStackTrace();
 }

%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	
</script>

<title>Insert title hee</title>
</head>
<body>
</body>
</html>


