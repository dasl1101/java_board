<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String num = request.getParameter("num");
	if (num ==null||num.trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
	}%>

<head>
	<title>�Խñ� ����</title>
</head>
<body>
	<div align ="center"> 
	<b>�ۻ���</b><p>
		<form name="f" action="deleteProc.jsp" method="post">
		<input type="hidden" name="num" value="<%=num %>" />
		<table width="300" border= "1">
		<tr>
		<td bgcolor = "lightblue" align="center">��й�ȣ �Է�</td>
		</tr>
		<tr>
		<td align="center">
						��й�ȣ : <input type="password" name="passwd">
		</td>
		</tr>
		<tr>
		<td align="center" bgcolor = "lightblue">
		<input type="submit" value="�ۻ���">
		<input type="button" value="�������" onclick = "window.location='list.jsp'">
		</td>
		</tr>
		</table>
	</form>
</div>

</body>
</html>