<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%		request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="dto" class="myBoard.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%	if (dto.getPasswd() == null || dto.getPasswd().trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}%>
	
<jsp:useBean id="dao" class="myBoard.BoardDAO"/>
<%
	int res = dao.updateBoard(dto);
	String msg = null, url = null;
	if (res>0){
		msg = "글수정 성공!! 글목록페이지로 이동합니다.";
		url = "list.jsp";
	}else if (res<0){
		msg = "비밀번호가 틀렸습니다. 다시 입력해 주세요";
		url = "update.jsp?num=" + dto.getNum();
	}else {
		msg = "글수정 실패!! 글내용보기페이지로 이동합니다.";
		url = "content.jsp?num=" + dto.getNum();
	}
%>		
<script type="text/javascript">
alert("<%=msg%>")
location.href="<%=url%>"
</script>
