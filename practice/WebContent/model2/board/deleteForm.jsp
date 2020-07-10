<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/deleteForm.jsp --%>    
<!DOCTYPE html>
<html><head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="EUC-KR">
<title>게시판 삭제 화면</title>
<link rel="stylesheet" href="../../css/main.css">
</head><body>
<form action="delete.do" name="f" method="post">
<input type="hidden" name="no" value="${param.no}">
<table style="width: 90%; margin:auto;">
  <caption>게시글 삭제 화면</caption>
  <tr><td>작성자 비밀번호</td>
      <td><input type="password" name="pass"></td></tr>
  <tr><td colspan="2">
     <input type="submit" value="게시글삭제" class='btn btn-info'></td></tr>
</table></form></body></html>