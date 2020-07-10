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
<form action="list.do" method="post" name="sf" style="text-align:center;">
 <input type="hidden" name="btype" value="${param.btype }">
<input type="hidden" name="pageNum" value="1">
<select  name="column">
<option value="">�����ϼ���.</option>
<option value="subject">����</option>
<option value="id">�̸�</option>
<option value="content">����</option>

</select>
<script>document.sf.column.value = "${param.column}";</script>
<input type="text" name="find" value="${param.find}" style="width:650px;">
<input type="submit" value="�˻�" class="btn btn-info">
</form>
<table style="width: 100%; margin:auto;">


<caption>
			<c:choose>
				<c:when test="${param.btype==0 }">
					���� ����
				</c:when>
				<c:when test="${param.btype==1 }">
					� ����/���� 
				</c:when>
				<c:when test="${param.btype==2 }">
					� ��/���� ���� �Խ���
				</c:when>
			</c:choose>
</caption>
 <c:if test="${boardcount==0}">
 <tr><td colspan="5">��ϵ� �Խñ��� �����ϴ�.</td></tr>
 </c:if>
 <c:if test ="${boardcount>0}">
<tr ><td colspan="5" style="text-align:right">�۰���:${boardcount}</td></tr>
 <tr><th width="8%">��ȣ</th><th width="50%">����</th>
     <th width="14%">���̵�</th><th width="17%">�ۼ� ��</th>
     <th width="11%">��ȸ ��</th></tr>
     
<c:forEach var="b" items="${list}">
 <tr><td>${boardnum}</td><c:set var="boardnum" value="${boardnum-1}"/> 
 <td style="text-align: left">
  <c:if test="${!empty b.file1}">
	<a href="file/${b.file1}" style="color: red;">@</a>
  </c:if>
  <c:if test="${empty b.file1}"> &nbsp;&nbsp;&nbsp;</c:if>


   
    <a href="info.do?no=${b.no}&btype=${b.btype}">${b.subject}</a>
   
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
 <tr><td colspan="5">
 <%-- ������ ó���ϱ� --%>
 		<c:if test="${pageNum <=1}">[����]</c:if>
 		<c:if test="${pageNum >1 }">
 		 <a href="javascript:listdo(${pageNum-1 })">[����]</a>
 		</c:if>
 		<c:forEach var="a" begin="${startpage}" end="${endpage}">
 			<c:if test="${a == pageNum}">[${a}]</c:if>
 			<c:if test="${a != pageNum}">
 			 <a href="javascript:listdo(${a})">[${a}]</a>
 			</c:if>
 			</c:forEach>
      <c:if test="${pageNum >= maxpage}">[����]</c:if>
      <c:if test="${pageNum < maxpage }">
      	<a href="javascript:listdo(${pageNum+1 })">[����]</a>
      </c:if>
 </td></tr>  
</c:if>
<%--��ϵ� �Խù� ���� �κ� ���� --%>
  <tr><td colspan="5" style="text-align:right">
    <c:if test="${sessionScope.login == 'admin' and param.btype==1}"> <a href="writeForm.do?btype=${param.btype}">[�۾���]</a></c:if>
    <c:if test="${param.btype==0 and !empty sessionScope.login or param.btype==2 and !empty sessionScope.login}"> <a href="writeForm.do?btype=${param.btype}">[�۾���]</a></c:if>
    <c:if test="${empty sessionScope.login }">�α��� �� �۾��� �����մϴ�. </c:if>
    </td></tr>
</table></body></html>