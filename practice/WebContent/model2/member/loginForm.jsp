<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css">
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
function inputcheck(f){
		if(f.id.value == ''){
			alert("���̵� �Է��ϼ���.");
			f.id.focus();
			return false;
		}
		if(f.pass.value==''){
			alert("��й�ȣ�� �Է��ϼ���.");
			f.pass.focus();
			return false;
		}
		return true;
	}
	function win_open(page) {
		   var op = "width=500, height=350, left=50,top=150";
		   open(page+".me","",op);
	  }

</script>
</head>
<body>

	

	<form action="login.me" method="post" name="f"
		onsubmit="return inputcheck(this)">
		<table style="width: 80%; margin:auto;">
			<caption class="text-center" >�α���</caption>
			<tr>
				<th>���̵�</th>
				<td><input type="text" name="id"></td>
				<td rowspan="2"><input type="submit" value="�α���" class="btn btn-info"></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="3">
				<input type="button" value="���̵� ã��" onclick="win_open('idForm')" class="btn btn-info">
				<input type="button" value="��й�ȣ ã��" onclick="win_open('pwForm')" class="btn btn-info"> 
				<input type="button" value="ȸ������" onclick="location.href='joinForm.me'" class="btn btn-info">
				</td></tr>
		</table>
	</form>
	<br><br>
	<div
		style="width: 50%; height: 700px; float: left; border: 1px solid white">
		<div id="listside1"></div>
	</div>
	<div
		style="width: 50%; height: 700px; float: right; border: 1px solid white">
		<div id="listside2"></div>
	</div>
</body>
</html>