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
		msg = "�ۼ��� ����!! �۸���������� �̵��մϴ�.";
		url = "list.jsp";
	}else if (res<0){
		msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���";
		url = "update.jsp?num=" + dto.getNum();
	}else {
		msg = "�ۼ��� ����!! �۳��뺸���������� �̵��մϴ�.";
		url = "content.jsp?num=" + dto.getNum();
	}
%>		
<script type="text/javascript">
alert("<%=msg%>")
location.href="<%=url%>"
</script>
