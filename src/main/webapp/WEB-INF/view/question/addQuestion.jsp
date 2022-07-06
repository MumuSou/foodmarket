<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/adminNavbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%-- <link href="${contextRoot}/css/bootstrap.css" rel="stylesheet"> --%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	$(function() {
		$("#autokeyin").click(function() {
			document.getElementById("questionCategory").selectedIndex = "1";
			document.getElementById("insertQuestion").value = "我該如何成為好食光會員？";
			document.getElementById("insertAnswer").value = "點選網頁右上方的「註冊」，填寫資料後即可成為好食光會員喔。";
		});
	});
</script>

<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-9">
				<br>
				<h1 style="text-align: center">新增常見問題</h1>
				<br>
				<div class="card">
					<div class="card-header" style="font-size: 22px">新增常見問題</div>
					<div class="card-body">

						<form:form class="form" method="post"
							action="${contextRoot}/question/postQuestion"
							modelAttribute="Question" id="test2">
							<table>
								<tr>
									<td><b>選擇問題分類：</b></td>
									<td><form:select path="questionCategory" id="questionCategory">
											<form:option value="-" label="-請選擇-" />
											<form:options items="${categoryList}" />
										</form:select></td>
								</tr>
							</table>
							<br>
							<div class="form-group">
								<div>輸入問題：</div>
								<form:textarea path="questionTitle" class="form-control" placeholder="輸入問題" id="insertQuestion"/>
							</div>
							<div class="form-group">
								<div>輸入回答：</div>
								<form:textarea path="answer" class="form-control" placeholder="輸入回答" id="insertAnswer" />
							</div>
							<div role="group">
							<center><input type="submit" class="btn btn-primary" value="新增常見問題" id="test" /></center>
							</div>
						</form:form>
						<div>
							<center><button id="autokeyin" class="btn btn-light" type="submit">一鍵新增問題</button></center>
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
						  title: '問題新增完成',
						  showConfirmButton: false,
						  timer: 2000
					}).then(function(isConfirm){
			            if(isConfirm){
				                $("#test2").submit();
				                    }
				})
				})
				</script>



</div>