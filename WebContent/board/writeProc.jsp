<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*, java.io.*" %> 

<%
	MultipartRequest mr = null;
	String upPath = config.getServletContext().getRealPath("/board");
	int length = 10*1024*1024;
	try{
		mr = new MultipartRequest(request, upPath, length, "EUC-KR");
	}catch(IOException e){
		e.printStackTrace();
	}
	%>
	
<jsp:useBean id="dao" class="myBoard.BoardDAO" /> 
<%
	String ip = request.getRemoteAddr();	
	int res = dao.insertBoard(mr, ip);
	String msg = null, url = null;
	if (res > 0){
		msg = "게시글 등록 성공! 게시글 목록 페이지로 이동합니다.";
		url = "list.jsp";
	}else{
		msg = "게시글 등록 실패! 게시글 등록 페이지로 이동합니다.";
		url = "writeForm.jsp";
	}
	
 %>
<script type="text/javascript">
alert("<%=msg%>")
location.href="<%=url%>"
</script>
