<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<link rel="stylesheet" href="../../css/main.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
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
			alert("아이디를 입력하세요.");
			f.id.focus();
			return false;
		}
		if(f.pass.value==''){
			alert("비밀번호를 입력하세요.");
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
			<caption class="text-center" >로그인</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
				<td rowspan="2"><input type="submit" value="로그인" class="btn btn-info"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="3">
				<input type="button" value="아이디 찾기" onclick="win_open('idForm')" class="btn btn-info">
				<input type="button" value="비밀번호 찾기" onclick="win_open('pwForm')" class="btn btn-info"> 
				<input type="button" value="회원가입" onclick="location.href='joinForm.me'" class="btn btn-info">
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