<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import ="myBoard.*,java.util.*"%>
<jsp:useBean id="dao" class="myBoard.BoardDAO" /> 

<div align="center">
	<b>�� �� ��</b>
	<table border="0" width="800">
		<tr bgcolor="lightblue">
			<td align="right"><a href="writeForm.jsp">�۾���</a></td>
		</tr>
	</table>
	<table border="1" width="800">
		<tr bgcolor="pink">
			<th>��ȣ</th>
			<th width="30%">����</th>
			<th>�۾���</th>
			<th>�ۼ���</th>
			<th>��ȸ</th>
			<th>IP</th>
			<th>����</th>
		</tr>
		
	<%
		List<BoardDTO> list = dao.listBoard();
		if (list==null || list.size()==0){%>
		<tr>
			<td colspan="7">��ϵ� �Խñ��� �����ϴ�.</td>
		</tr>
<%	} else {
			for(BoardDTO dto : list){%>
		<tr>
			<td><%=dto.getNum()%></td>
			<td><a href="content.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject()%></a></td>
			<td><%=dto.getWriter()%></td>
			<td><%=dto.getReg_date()%></td>
			<td><%=dto.getReadcount()%></td>
			<td><%=dto.getIp()%></td>
			<td align="center">
<%			if (dto.getFilesize()==0){ %>
					<img src="../img/level.gif">
<%			}else { %>
					<img src="../img/folder.gif">
<%			} %>				
				</td>
			</tr>		
<%		} 
		}%>				
	</table>
</div>