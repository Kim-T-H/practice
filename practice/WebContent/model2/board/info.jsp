<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
	<table style="width: 95%; margin:auto;">
		<caption>�Խù� �� ����</caption>
		<tr>
			<th width="20%">�۾���</th>
			<td width="80%" style="text-align: left">${b.id}</td>
		</tr>
		<tr>
			<th>����</th>
			<td style="text-align: left">${b.subject}</td>
		</tr>
		
		
		<c:choose>
				
				<c:when test="${param.btype==1 and !empty sessionScope.login}">
		<tr>
			<th>������ ���� ��� <br>���� ��ư�� �����ּ���.</th>
			<td><input type=button value="����" id=joinvote class="btn btn-info">
			<input type=button value="���� ���" id=joindelete class="btn btn-info"> </td>
		</tr>
		
		<tr>
			<th>���� �� ��Ȳ</th>
			<td><div id="joinList"></div></td>
			
		</tr>
				</c:when>
				<c:when test="${empty sessionScope.login}">
				<tr>
				<th colspan="2">�α��� �� ���� �����մϴ�.</th></tr>
				</c:when>
		</c:choose>
			
		<tr>
			<th>����</th>
			<td><table style="width: 100%; height: 250px;">
					<tr>
						<td
							style="border-width: 0px; vertical-align: top; text-align: left">
							${b.content}</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<th>÷������</th>
			<td><c:if test="${empty b.file1}">&nbsp;</c:if> <c:if
					test="${!empty b.file1}">
					<a href="file/${b.file1}">${b.file1}</a>
				</c:if></td>
		</tr>
		<c:if test="${!empty sessionScope.login}">
		<tr>
			<td colspan="2"><a
				href="updateForm.do?no=${b.no}&btype=${b.btype}">[����]</a> <a
				href="deleteForm.do?no=${b.no}&btype=${b.btype}">[����]</a> <a
				href="list.do?btype=${b.btype}">[���]</a></td>
		</tr>
		</c:if>
	</table>
	<br>
	<br>
	
	



		<table border="1" style="width: 100%; margin:auto;">
			
			<!-- �α��� ���� ��츸 ��� �ۼ� ���� -->
			<c:if test="${empty sessionScope.login }">
				<textarea rows="4" cols="50" readonly style="text-align: center;" >�α��� �� ��� �ۼ� �����մϴ�.</textarea>
			</c:if>
			
			<c:if test="${!empty sessionScope.login}">
			<div style="text-align:right">
			<input type="button"  value="��� �ۼ�" id="write" class="btn btn-info btn btn-default btn-lg">
			</div>
			<br>
				<tr bgcolor="#F5F5F5">
						<!-- ���̵� -->
						<td width="100">
							${sessionScope.login}
						</td>
						<!-- ���� �ۼ� -->
						<td width="400">
							<textarea name="com_content" rows="4" cols="50" id="com_content"></textarea>
						</td>
						<td width="100">
							<div style="text-align: center;">
								<button type="button" id="comment_submit" class="btn btn-info btn btn-default btn-lg" >��� ����</button>
			
								<button type="button" id="comment_write"  class="btn btn-info btn btn-default btn-lg">���� ����</button>
								
							</div>
						</td>

				</tr>
			</c:if>
		</table>
	<div id="commentList"></div>
	
	<input type="hidden" name="no" id = "no" value="${b.no}">
	<input type="hidden" name="btype" id = "btype" value="${b.btype}">
	<input type="hidden" name="id" id="id" value="${sessionScope.login}">
	<script type="text/javascript">
		$(function() {
			var commentList = $("#commentList");
			var joinList = $("#joinList");
			var list = [];
			var votelist = [];
			getComment();
			getVote();
			
			
			$("#comment_write").hide();
			
			function view() {
				console.log("view");
				commentList.empty();
				var table = "<table style='width: 100%; margin:auto;'>";
				$.each(list, function (i, v) {
					table += "<tr><th width='150'>"+v.id+"</th><td width='200'>"+v.com_date+"</td><td>"
						table += v.com_content+"</td><td>"
						if($("#id").val() == v.id){
							
							table += "<input type='button' value='����' id='writebtn' class='btn btn-info'></td>"
								table +="<td><input type='button' value='����' id='delete' class='btn btn-danger'></td>";
						}else{
							table +="</td><td></td>"
						}
						table +="</tr>"
				})
				table += "</table>";
				console.log(table);
				commentList.append(table);
			}
			
			
			$("#comment_submit").on("click", function() {
				if($("#com_content").val().trim() ==""){
					alert("����� �Է��ϼ���.");
					$("#com_content").val("").focus();
					
				}else{
				$.ajax({
					type: "post",
					url: "/practice/model2/ajax/createComment.do",
					data : {
						com_content : $("#com_content").val(),
						no : $("#no").val(),
						id : $("#id").val(),
						btype : $("#btype").val()
					},
					success: function (res) {
						alert("��� �����߽��ϴ�.");
						$("#com_content").val("");
						getComment();
					}
				})
				}
			})
			
			function getComment(){
				$.ajax({
					type : "post",
					url : "/practice/model2/ajax/getComment.do",
					data:{ 
						no: ${no}
					},
					success : function(res){
						var json = JSON.parse(res);
						console.log(json);
						list = json;
						view();
					}
				}) 
			} 
			
			$(document).on("click", "#writebtn", function () {
				console.log("click");
				var idx = $(this).parent().parent().index();
				comment_data = list[idx];
				$("#com_content").val(comment_data.com_content);
				$("#comment_write").show();
				$("#comment_submit").hide();
			})
			
			$(document).on("click", "#write", function () {
				console.log("click");
				$("#com_content").val("");
				$("#comment_write").hide();
				$("#comment_submit").show();
			})
		
			$(document).on("click", "#comment_write", function () {
				comment_data.com_content = $("#com_content").val();
				$.ajax({
					type: "post",
					url: "/practice/model2/ajax/updateComment.do",
					data : comment_data,
					success : function (res) {
						alert("��� ���� �Ǿ����ϴ�.");
						$("#com_content").val("");
						getComment();
					}
				})
			})
			
			$(document).on("click", "#delete", function () {
				if (!confirm("�����Ͻðڽ��ϱ�?")) {
			        return;
			    }
				var idx = $(this).parent().parent().index();
				comment_data = list[idx];
				console.log(comment_data);
				$.ajax({
					type: "post",
					url: "/practice/model2/ajax/deleteComment.do",
					data : comment_data,
					success : function (res) {
						alert("�����Ǿ����ϴ�.");
						getComment();
					},
					error: function (e) {
						alert("e:"+e.status);
					}
				})
		})
		
		
		
		
		//����  ��ǥ
		function getVote(){
				$.ajax({
					type : "post",
					url : "/practice/model2/ajax/getVote.do",
					data:{ 
						no: ${no},
						btype: ${b.btype}
					},
					success : function(res){
						console.log(res); 
						var json = JSON.parse(res);
						votelist = json;
						joinview();
					} 
				})    
			} 
		
		
		function joinview() {
				joinList.empty();
				var table = "<p>";
				var chk = false;
				$.each(votelist, function (i, v) {
					table += v.id+'('+v.name+')&nbsp;';
					if(v.id == $("#id").val()) {
						chk = true;
					}
				})
				if(chk){
					$("#joinvote").hide();
					$("#joindelete").show();
				}else{
					$("#joinvote").show();
					$("#joindelete").hide();
				}
				
				if($("#id").val() == ""){
					$("#joindelete").hide();
					$("#joinvote").hide();
				}
				
				table += "</p>";
				joinList.append(table);
			}
		
		
		
		$(document).on("click", "#joinvote", function () {
				$.ajax({
					type: "post",
					url: "/practice/model2/ajax/joinVote.do",
					data : {
						id : $("#id").val(),
						no : ${no},
						btype : ${b.btype} 
					},
					success : function (res) { 
						alert("���� ��� ����");
						getVote();
						
					},
					error: function (e) {
						console.log("e: "+e.status);
					}
				}) 
			})
			
			
			
			$(document).on("click", "#joindelete", function () {
				$.ajax({
					type: "post",
					url: "/practice/model2/ajax/joinDelete.do",
					data : {
						id : $("#id").val(),
						no : ${no},
						btype : ${b.btype} 
					},
					success : function (res) {
						alert("���� ���");
						getVote();
					},
					error: function (e) {
						console.log("e: "+e.status);
						
					}
				})
			})  
		
		})
		
		
	</script>
</body>
</html>
