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
		   alert("����� �����ϼ���.");
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
			<caption>��� ���� â</caption>
			<tr>
				<td><textarea name="com_update" rows="6" cols="60" id="com_update" ></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="��� ���� �Ϸ�"> </td>
			</tr>
		</table>
	</form>
</body>
</html>