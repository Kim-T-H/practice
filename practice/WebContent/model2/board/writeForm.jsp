<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /WebContent/model2/board/writeForm.jsp --%>    
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>�Խ��� �۾���</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
   function inputcheck() {
	   f = document.f;
	  
	 
	   if(f.subject.value=="") {
		   alert("������ �Է��ϼ���");
		   f.subject.focus();
		   return;
	   }
	  /* if(f.content.value=="") {
		   alert("������ �Է��ϼ���");
		   f.content.focus();
		   return;
	  }
	  */ 
	   f.submit(); //form ��ü�� submit �߻�. 
   }
</script>
</head>
<body>
<form action="write.do?btype=${param.btype}" method="post" 
       enctype="multipart/form-data" name="f">
  <table>
   <caption>�Խ��� �۾���</caption>
  		<c:choose>
				<c:when test="${param.btype==0 or param.btype==2}">
	<tr><td>����</td><td><input type="text" name="subject"></td></tr>
				</c:when>
				<c:when test="${param.btype==1 }">
	<tr><td>����</td><td><input type="text" name="subject" value="� �ð�:  			,���:"></td></tr>
				</c:when>
			</c:choose>

   <tr><td>����</td><td><textarea rows="15" name="content"  id="content1"></textarea></td></tr>
   <script>CKEDITOR.replace("content1", { filebrowserImageUploadUrl : "imgupload.do"})</script>
   <tr><td>÷������</td><td><input type="file" name="file1"></td></tr>
   <tr><td colspan="2">
     <a href="javascript:inputcheck()">[�Խù����]</a></td></tr>
  </table>
   <input type="hidden" name="id" id="id" value="${sessionScope.login}">
  </form></body></html>