<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String num = request.getParameter("num");
	if (num ==null||num.trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
	}%>

<head>
	<title>게시글 삭제</title>
</head>
<body>
	<div align ="center"> 
	<b>글삭제</b><p>
		<form name="f" action="deleteProc.jsp" method="post">
		<input type="hidden" name="num" value="<%=num %>" />
		<table width="300" border= "1">
		<tr>
		<td bgcolor = "lightblue" align="center">비밀번호 입력</td>
		</tr>
		<tr>
		<td align="center">
						비밀번호 : <input type="password" name="passwd">
		</td>
		</tr>
		<tr>
		<td align="center" bgcolor = "lightblue">
		<input type="submit" value="글삭제">
		<input type="button" value="목록으로" onclick = "window.location='list.jsp'">
		</td>
		</tr>
		</table>
	</form>
</div>

</body>
</html>