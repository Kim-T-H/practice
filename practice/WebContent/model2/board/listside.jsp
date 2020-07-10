<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /WebContent/model1/board/list.jsp
   1. ���������� 10���� �Խù��� ����ϱ�.
      pageNum �Ķ���Ͱ��� ���� => ���� ���� 1�� �����ϱ�.
   2. �ֱ� ��ϵ� �Խù��� ���� ���� ��ġ��.
   3. db���� �ش� �������� ��µ� ������ ��ȸ�Ͽ� ȭ�鿡 ���.
           �Խù��� ��ºκ�
           ������ ���� ��� �κ�        
--%>
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>�Խù� ��� ����</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function listdo(page){
		f=document.sf;
		f.pageNum.value=page;
		f.submit();
	}
</script>
</head>

<body>

<table style="width: 80%; margin:auto;">

<caption>
	<c:choose>
				<c:when test="${param.btype==0 }">
					���� ����
				</c:when>
				<c:when test="${param.btype==1 }">
					� ����/���� 
				</c:when>
	</c:choose>

</caption>
 <c:if test="${boardcount==0}">
 <tr><td colspan="5">��ϵ� �Խñ��� �����ϴ�.</td></tr>
 </c:if>
 <c:if test ="${boardcount>0}">
<tr><td colspan="5" style="text-align:right">�۰���:${boardcount}</td></tr>
 <tr><th width="8%">��ȣ</th><th width="50%">����</th>
     <th width="14%">�ۼ���</th><th width="17%">�����</th>
     <th width="11%">��ȸ��</th></tr>
     
<c:forEach var="b" items="${list}">
 <tr><td>${boardnum}</td><c:set var="boardnum" value="${boardnum-1}"/> 
 <td style="text-align: left">
  <c:if test="${!empty b.file1}">
	<a href="file/${b.file1}" style="text-decoration: none;">@</a>
  </c:if>
  <c:if test="${empty b.file1}"> &nbsp;&nbsp;&nbsp;</c:if>

	
   
    <a href="../board/info.do?no=${b.no}&btype=${b.btype}">${b.subject}</a>
 </td><td>${b.id}</td>
 
 <td><fmt:formatDate var="rdate" value="${b.date}" pattern="yyyy-MM-dd" />
 	<c:if test="${today==rdate}">
 		<fmt:formatDate value="${b.date}" pattern="HH:mm:ss" />
 	</c:if>
 	<c:if test="${today != rdate}">
 		<fmt:formatDate value="${b.date}" pattern="yyyy-MM-dd HH:mm" />
 	</c:if>
 
 </td>
       <td>${b.see}</td></tr>    
</c:forEach>
  
</c:if>
<%--��ϵ� �Խù� ���� �κ� ���� --%>
 
</table></body></html>