<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String num = request.getParameter("num");
	String passwd = request.getParameter("passwd");
	if(num==null||passwd==null||num.trim().equals("")
			||passwd.trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
	}
%>
<jsp:useBean id="dao" class="myBoard.BoardDAO"/>

<%
	int res = dao.deleteBoard(Integer.parseInt(num), passwd);
	String msg = null, url =null;
	if(res>0){
		msg = "글 삭제 성공! 게시글 목록 페이지로 이동합니다.";
		url = "list.jsp";
	}else if (res<0){
		msg = "비밀번호가 틀렸습니다. 다시 입력해 주세요";
		url = "delete.jsp?num=" + num;
	}else {
		msg = "글삭제 실패!! 글내용보기페이지로 이동합니다.";
		url = "content.jsp?num=" + num;
	}
%> 
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
