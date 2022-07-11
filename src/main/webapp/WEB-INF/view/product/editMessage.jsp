<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../layout/adminNavbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改商品</title>
</head>
<body>

<main role="main" class="col-md-6  ml-sm-auto  ">
 <h1 class="h1">修改商品頁面</h1>
</main>

<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
 <div class="container-fluid">


		<div class="row justify-content-center">
			<div class="col-9">
				<div class="card">
					<div class="card-header"><h2>修改商品</h2></div>
					<div class="card-body">

						<form:form class="form" method="post" modelAttribute="pMsg" 
						enctype='multipart/form-data'>

							<form:input path="productid" type="hidden" />
							<form:input path="added" type="hidden" />
							<div class="form-group">
								<div>
									<%--   <form:textarea path="text" class="form-control"/> --%>
									<label class="input-group-text" for="inputGroupSelect01">商品名稱</label>
									<form:input path="productname" class="form-control" />
<!-- 									商品類別編號 -->
<%-- 									<form:input path="productcategory" class="form-control" /> --%>
									<div>
									
									<br/>
									<div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">商品類別</label>
									</div>
									<input class="form-control" id="categoryid"
										name="categoryid" type="hidden" value="${pMsg.productcategoryBean.categoryid}"/>
										<input class="form-control" id=""
										name=""  style="pointer-events: none" value="${pMsg.productcategoryBean.productcategoryname}"/>
<%-- 									<form:input class="form-control" id="inputGroupSelect01"  --%>
<%-- 										path="productcategoryBean.productcategoryname" style="pointer-events: none"/>   --%>
<!-- 									<select class="custom-select" id="categoryid" -->
<!-- 												name="productcategoryid"> -->
<!-- 											<select class="custom-select" id="categoryid" -->
<!-- 												name="productcategoryid"> -->

<%-- 												<c:forEach var="productcategorytakeon" --%>
<%--  													items="${productcategorytakeon}">   --%>
<%-- 													<c:choose>   --%>
<%-- 														<c:when   --%>
<%-- 															test="${pMsg.categoryid == pMsg.productcategoryBean.categoryid}">   --%>
<!-- 															<option selected="selected" -->
<%--  																value="${pMsg.productcategoryBean.categoryid}">${pMsg.productcategoryBean.productcategoryname}</option>   --%>
<%-- 														</c:when>   --%>
<%--  														<c:otherwise>   --%>
<%--  															<option value="${pMsg.productcategoryBean.categoryid}">${pMsg.productcategoryBean.productcategoryname}</option>   --%>
<%-- 														</c:otherwise>   --%>
<%--  													</c:choose>   --%>

<%--   												</c:forEach>   --%>
<!--  											</select>  -->
								</div>
								</div>
							</div>
									<label class="input-group-text" for="inputGroupSelect01">價格</label>
									<form:input path="productprice" class="form-control" />
									
					</div> 
									<br />
									
									
<!-- 									庫存數量 -->
<%-- 									<form:input path="inventoryquantity" class="form-control" /> --%>
<!-- 									<br /> -->

							<div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="takedown">上架狀態</label>
									</div>
									<form:select class="custom-select" id="takedown" name="takedown"
										path="takedown" >
										<form:option value="上架中">上架</form:option>
										<form:option value="已下架">下架</form:option>
										</form:select>
								</div>
							</div>
							
							<br/>
										<div>
								<label class="input-group-text" for="inputGroupSelect01">商品介紹</label>
								<form:textarea path="productdesciption" class="form-control" />
							</div>

							<br />

							<div>
								<label class="input-group-text" for="inputGroupSelect01">庫存數量</label>
								<form:input path="inventoryquantity" class="form-control" />
							</div>
							
							<br/>
							
							
<!-- 							<div> -->
<!-- 								<label class="input-group-text" for="inputGroupSelect01">商品介紹</label> -->
<%-- 								<form:textarea path="productdesciption" class="form-control" /> --%>
<!-- 							</div> -->

<!-- 							<br /> -->

<!-- 							<div> -->
<!-- 								<label class="input-group-text" for="inputGroupSelect01">庫存數量</label> -->
<%-- 								<form:input path="inventoryquantity" class="form-control" /> --%>
<!-- 							</div> -->
							
<!-- 							<br/> -->
							
							

									<form:input path="administrator" class="form-control"
										type="hidden" />
										
										
										<div>
										<label class="input-group-text" for="inputGroupSelect01">商品圖片</label>
									<%--   <form:input path="productimg" class="form-control"/> --%>
										</div>
									<div>
										<form:input path="productimg" type="file" accept="image/*"
											onchange="loadFile(event)"/>
									<div class="input-group-prepend">
<!-- 									<label class="input-group-text" for="customFileLang">原始圖片</label> -->
									</div>
									<img id="output" style="width: 250px; height: 250px;"
										src="data:image/*;base64,${pMsg.productimg}"
										alt="image" />
									</div>
<!-- 									<br /> -->
<!-- 									<div class="input-group-prepend"> -->
<!-- 									<label class="input-group-text" for="customFileLang">修改後圖片</label> -->
<!-- 									</div> -->
<!-- 									 <img id="output" style="width: 250px; height: 250px;" /> -->
									
									<script>
										var loadFile = function(event) {
											var reader = new FileReader();
											reader.onload = function() {
												var output = document
														.getElementById('output');
												output.src = reader.result;
											};
											reader.readAsDataURL(event.target.files[0]);
													
										};
																			
// 										$(function() {
// 											$('#prodimg').hide();
// 										});

// 										function preview() {
// 											logo.src = URL
// 													.createObjectURL(event.target.files[0]);
// 											if ((event.target.files[0].type)
// 													.startsWith("image")) {
// 												$('#prodimg').show();
// 											}
// 										}
									</script>
								</div>
							<div>
							<input type="submit" name="submit" class="btn btn-outline-success" value="修改訊息" onclick="return confirm('真的要修改嗎?')">
							<input class="btn btn-outline-danger" type="button" name="back" value="返回"onClick="javascript:history.back()">
							</div>
						</form:form>
							</div>
							



					</div>
				</div>

			</div>

		</div>
		</div>
</body>
</html>