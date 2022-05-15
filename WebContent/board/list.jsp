<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import ="myBoard.*,java.util.*"%>
<jsp:useBean id="dao" class="myBoard.BoardDAO" /> 

<div align="center">
	<b>글 목 록</b>
	<table border="0" width="800">
		<tr bgcolor="lightblue">
			<td align="right"><a href="writeForm.jsp">글쓰기</a></td>
		</tr>
	</table>
	<table border="1" width="800">
		<tr bgcolor="pink">
			<th>번호</th>
			<th width="30%">제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회</th>
			<th>IP</th>
			<th>파일</th>
		</tr>
		
	<%
		List<BoardDTO> list = dao.listBoard();
		if (list==null || list.size()==0){%>
		<tr>
			<td colspan="7">등록된 게시글이 없습니다.</td>
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