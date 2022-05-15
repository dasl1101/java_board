<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>글 쓰 기</title>
</head>
<body>
<script type="text/javascript">

	function check(){
		if(f.writer.value==""){
			alert("이름을 입력해 주세요!")
			return false
		}	
		if (f.subject.value==""){
			alert("제목을 입력해 주세요!")
			f.subject.focus()
			return false
		}	
		if (f.content.value==""){
			alert("내용을 입력해 주세요!")
			f.content.focus()
			return false
		}	
		if (f.passwd.value==""){
			alert("비밀번호를 입력해 주세요!")
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
		<td align="center" bgcolor="lightblue" colspan="3">글쓰기</td>
		</tr>
		<tr >
		<th bgcolor="lightblue" width ="20%">이름</th>
		<td><input type="text" name="writer" size="50"> </td>
		</tr>
		<tr >
		<th bgcolor="lightblue" width ="20%">제목</th>
		<td><input type="text" name="subject" size="50"> </td>
		</tr>
		<tr >
		<th bgcolor="lightblue" width ="20%">Email</th>
		<td><input type="text" name="email" size="50"> </td>
		</tr>
		<tr >
		<th bgcolor="lightblue" width ="20%">내용</th>
		<td><textarea name="content" rows="10" cols="50"></textarea> </td>
		</tr>
		<tr>
		<th bgcolor="lightblue" width ="20%">파일명</th>
		<td><input type ="file" name ="filename"></td>
		</tr>
		<tr >
		<th bgcolor="lightblue" width ="20%">비밀번호</th>
		<td><input type="password" name="passwd"> </td>
		</tr>
		<tr bgcolor="lightblue">
				<td align="center" colspan="2">
		<input type="submit" value="글쓰기"> 
		<input type="reset" value="다시쓰기">
		<input type="button" value="목록보기" onclick="window.location='list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>