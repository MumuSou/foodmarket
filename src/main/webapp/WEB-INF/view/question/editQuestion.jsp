<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <jsp:include page="../layout/navbar.jsp" /> --%>
<jsp:include page="../layout/adminNavbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!DOCTYPE html>
<html>
<head>
<%-- <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet"> --%>
<%-- <link href="${contextRoot}/css/question.css" rel="stylesheet"> --%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	$(function() {
		$("#autokeyin").click(function() {
			document.getElementById("questionCategory").selectedIndex = "3";
			document.getElementById("insertQuestion").value = "成為好食光會員是否有任何條件？";
			document.getElementById("insertAnswer").value = "只需正確填寫資料後，即可成為好食光會員。";
		});
	});
</script>


<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
 <div class="container-fluid">
	<div class="row justify-content-center">
			<div class="col-9">
				<br>
				<h1 style="text-align: center">修改常見問題</h1>
				<br>
				<div class="card">
					<div class="card-header">修改常見問題</div>
					<div class="card-body">
						<form:form class="form" method="post"
							action="${contextRoot}/question/editQuestion"
							modelAttribute="Question" id="test2">
							<form:input path="id" type="hidden"></form:input>
							<table>
								<div class="form-group">
									<tr>
										<td><b>選擇問題分類：</b></td>
										<td><form:select path="questionCategory">
												<form:option value="-" label="-請選擇-" />
												<form:options items="${categoryList}" />
											</form:select></td>
									</tr>
								</div>
							</table>
							<br>
							<div class="form-group">
								<div>修改問題：</div>
								<form:textarea path="questionTitle" class="form-control" id="insertQuestion"/>
							</div>
							<div class="form-group">
								<div>修改回答：</div>
								<form:textarea path="answer" class="form-control" id="insertAnswer" />
							</div>
					<center><input type="submit" value="修改常見問題" class="btn btn-primary" id="test"/></center>

					</form:form>
					<div>
							<center><button id="autokeyin" class="btn btn-light" type="submit">一鍵修改問題</button></center>
						</div>
				</div>
			</div>
		</div>
		
		</div>
	</div>
	</div>
	
	
	<script>
				document.getElementById('test').addEventListener('click',function(){
					event.preventDefault();
					Swal.fire({
						  position: 'center',
						  icon: 'success',
						  title: '問題修改完成',
						  showConfirmButton: false,
						  timer: 2000
					}).then(function(isConfirm){
			            if(isConfirm){
				                $("#test2").submit();
				                    }
				})
				})
				</script>
</body>
</html>