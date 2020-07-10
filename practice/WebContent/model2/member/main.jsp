<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="EUC-KR">
<title>�α��� �Ǿ��� ��</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
$(function(){
	   $.ajax("/practice/model2/board/listside.do?btype=0",{
		   success : function(data){
			   console.log(data);
			   $("#listside1").html(data);
		   }
	   })
	setTimeout(function() {
		   $.ajax("/practice/model2/board/listside.do?btype=1",{
			   success : function(data){
				   console.log(data);
				   $("#listside2").html(data);
			   }
		   })
	}, 5);
})
</script>
</head>
<body>
	<table style="width: 80%; margin:auto;">
		<tr>
			<td>${sessionScope.login}�� �α��� �Ǿ����ϴ�.</td>
		</tr>
		<tr>
			<td><input type="button" value="�α׾ƿ�" class="btn btn-info"
				onclick="location.href='logout.me'">
			<c:if test="${sessionScope.login == 'admin'}">
					<input type="button" value="ȸ�� ��� ����" onclick="location.href='list.me'" class="btn btn-info">
			</c:if>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<br>

	<div
		style="width: 45%; height: 700px; float: left; border: 1px solid white">
		<div id="listside1"></div>
	</div>
	<div
		style="width: 45%; height: 700px; float: right; border: 1px solid white">
		<div id="listside2"></div>
	</div>
</body>
</html>