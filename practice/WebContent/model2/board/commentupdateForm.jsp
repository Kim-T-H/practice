<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
   function inchk(f) {
	   if(f.com_update.value == "") {
		   alert("댓글을 수정하세요.");
		   f.com_update.value="";
		   f.com_update.focus();
		   return false;
	   }
	   return true;
   }
</script>
</head>
<body>
<form action="commentupdate.do" name="f" method="post"
		onsubmit="return inchk(this)">
		<table>
			<caption>댓글 수정 창</caption>
			<tr>
				<td><textarea name="com_update" rows="6" cols="60" id="com_update" ></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="댓글 수정 완료"> </td>
			</tr>
		</table>
	</form>
</body>
</html>