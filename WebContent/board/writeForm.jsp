<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>�� �� ��</title>
</head>
<body>
<script type="text/javascript">

	function check(){
		if(f.writer.value==""){
			alert("�̸��� �Է��� �ּ���!")
			return false
		}	
		if (f.subject.value==""){
			alert("������ �Է��� �ּ���!")
			f.subject.focus()
			return false
		}	
		if (f.content.value==""){
			alert("������ �Է��� �ּ���!")
			f.content.focus()
			return false
		}	
		if (f.passwd.value==""){
			alert("��й�ȣ�� �Է��� �ּ���!")
			f.passwd.focus()
			return false
		}	
		return true
	}



</script>
<div align="center">
	<form name="f" action="writeProc.jsp" method="post" onsubmit="return check()"
											enctype="multipart/form-data">
	<table width = "600" border="1">
		<tr>
		<td align="center" bgcolor="lightblue" colspan="3">�۾���</td>
		</tr>
		<tr >
		<th bgcolor="lightblue" width ="20%">�̸�</th>
		<td><input type="text" name="writer" size="50"> </td>
		</tr>
		<tr >
		<th bgcolor="lightblue" width ="20%">����</th>
		<td><input type="text" name="subject" size="50"> </td>
		</tr>
		<tr >
		<th bgcolor="lightblue" width ="20%">Email</th>
		<td><input type="text" name="email" size="50"> </td>
		</tr>
		<tr >
		<th bgcolor="lightblue" width ="20%">����</th>
		<td><textarea name="content" rows="10" cols="50"></textarea> </td>
		</tr>
		<tr>
		<th bgcolor="lightblue" width ="20%">���ϸ�</th>
		<td><input type ="file" name ="filename"></td>
		</tr>
		<tr >
		<th bgcolor="lightblue" width ="20%">��й�ȣ</th>
		<td><input type="password" name="passwd"> </td>
		</tr>
		<tr bgcolor="lightblue">
				<td align="center" colspan="2">
		<input type="submit" value="�۾���"> 
		<input type="reset" value="�ٽþ���">
		<input type="button" value="��Ϻ���" onclick="window.location='list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>