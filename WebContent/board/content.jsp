<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="myBoard.*,java.util.*"%>
<jsp:useBean id="dao" class="myBoard.BoardDAO" />

<%	String num = request.getParameter("num");
	if(num == null|| num.trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
		}

	 
	BoardDTO dto = dao.getBoard(Integer.parseInt(num));
%>
<div align = "center">
	<h3>�۳��� ����</h3>
	<table width = "600" border = "1">
		<tr>
		<td bgcolor ="lightblue" width="20%">��ȣ</td>
		<td align = "center" width="30%"><%=dto.getNum()%></td>
		<td bgcolor ="lightblue" width="20%">��ȸ��</td>
		<td align = "center" width="30%"><%=dto.getReadcount()%></td>
		</tr>
		<tr>
		<td bgcolor ="lightblue">�ۼ���</td>
		<td align = "center"><%=dto.getWriter()%></td>
		<td bgcolor ="lightblue">�ۼ���</td>
		<td align = "center"><%=dto.getReg_date()%></td>
		</tr>
		<tr>
		<td bgcolor ="lightblue">����</td>
		<td align = "center" colspan = 3><%=dto.getSubject()%></td>
		</tr>
		<tr>
		<td bgcolor ="lightblue">����</td>
		<td colspan = 3><%=dto.getContent()%></td>
		</tr>
<%
		if (dto.getFilesize() > 0){
			String upPath = application.getRealPath("/board");%>
		<tr>
		<td bgcolor ="lightblue" width = "20%">���ϸ�</td>
		<td width = "80%" colspan = "3">
			<a href = "<%=upPath%>/<%=dto.getFilename() %>">
						<%=dto.getFilename()%></a>
			</td>
		</tr>						 	
<%} %>	
		<tr>
		<td align="right" bgcolor ="lightblue" colspan="4">
		<input type = "button" value="�����ϱ�" onclick="window.location='update.jsp?num=<%=dto.getNum()%>'">
		<input type = "button" value="�����ϱ�" onclick="window.location='delete.jsp?num=<%=dto.getNum()%>'">
		<input type = "button" value="�۸��" onclick="window.location='list.jsp'"></td>
	</table>
</div>