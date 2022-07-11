<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../layout/adminNavbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<style>
table, td, th {
	border: 1px groove;
}
</style>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
</head>
<body>
	<script>
		$(function() {
			$("#autokeyin")
					.click(
							function() {
								document.getElementById("productname").value = "松花溏心皮蛋220g(4入)";
								document.getElementById("categoryid").selectedIndex = "4";
								document.getElementById("productprice").value = "86";
								document.getElementById("takedown").selectedIndex = "0";
								document.getElementById("productdesciption").value = "嚴選鴨蛋遵循古法製成，品質嚴格把關用心研製， 粒粒好蛋、唇齒留香。";
								document.getElementById("inventoryquantity").value = "2000";
							});
		});
		$(function() {
			$("#autokeyin2")
					.click(
							function() {
								document.getElementById("productname").value = "香Q熟鹹蛋266g(4入)";
								document.getElementById("categoryid").selectedIndex = "4";
								document.getElementById("productprice").value = "85";
								document.getElementById("takedown").selectedIndex = "1";
								document.getElementById("productdesciption").value = "嚴選鴨蛋遵循古法製成，品質嚴格把關用心研製， 粒粒好蛋、唇齒留香。";
								document.getElementById("inventoryquantity").value = "2000";
							});
		});
		$(function() {
			$("#autokeyin3")
					.click(
							function() {
								document.getElementById("productname").value = "土雞蛋*10入";
								document.getElementById("categoryid").selectedIndex = "4";
								document.getElementById("productprice").value = "115";
								document.getElementById("takedown").selectedIndex = "0";
								document.getElementById("productdesciption").value = "無抗生素反應，天然純淨、健康安心 一貫作業：從育種到生蛋嚴格監管，不打抗生素、不吃藥 營養配方：乾淨飼料加上活菌、…為健康加分";
								document.getElementById("inventoryquantity").value = "20000";
							});
		});
	</script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<main role="main" class="col-md-6  ml-sm-auto  ">
		<h1 class="h1">新增商品頁面</h1>
	</main>

	<div
		class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
		<div class="container-fluid">

			<br />

			<p />

			<div class="row justify-content-center">
				<div class="col-9">

					<div class="card">
						<div class="card-header">最新新增商品資訊</div>
						<div class="card-body">
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th style="text-align: center;" scope="col">商品名稱</th>
<!-- 										<th style="text-align: center;" scope="col">商品類別</th> -->
										<th style="text-align: center;" scope="col">價格</th>
										<th style="text-align: center;" scope="col">商品圖片</th>
										<th style="text-align: center;" scope="col">新增日期</th>
										<th style="text-align: center;" scope="col">商品介紹</th>
										<th style="text-align: center;" scope="col">庫存數量</th>
										<th style="text-align: center;" scope="col">上架狀態</th>
										<!-- 									<th scope="col">商品類別</th> -->
										<!-- 								<th scope="col">修改人員</th> -->
									</tr>
								</thead>
								<tr>
									<td style="text-align: center;"><c:out
											value="${lastestpMsg.productname}" /></td>
<%-- 									<td><c:out value="${lastestpMsg.productcategory}"/></td> --%>
<%-- 									<td style="text-align: center;"><c:out --%>
<%--  											value="${lastestpMsg.productcategoryBean.productcategoryname}" /></td>  --%>
									<td style="text-align: center;"><c:out
											value="${lastestpMsg.productprice}" /></td>
									<td style="text-align: center;">
										<%--       <c:out value="${lastestpMsg.productimg}" /> --%> <img
										style="width: 100px; height: 100px;"
										src="data:image/image/*;base64,${lastestpMsg.productimg}"
										alt="image" />
									</td>
									<td style="text-align: center;"><fmt:formatDate
											pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E "
											value="${lastestpMsg.added}" /></td>
									<%-- 							<td><c:out value="${lastestpMsg.administrator}" /></td> --%>
									<td style=";"><c:out
											value="${lastestpMsg.productdesciption}" /></td>
									<td style="text-align: center;"><c:out
											value="${lastestpMsg.inventoryquantity}" /></td>
									<td style="text-align: center;"><c:out
											value="${lastestpMsg.takedown}" /></td>
								</tr>
							</table>
						</div>
					</div>



				</div>

			</div>

			<br />

			<div class="row justify-content-center">
				<div class="col-9">
					<div class="card">
						<div class="card-header">請輸入新商品資訊
						<div class="btn-group " role="group">
								<button id="autokeyin" class="btn btn-light" type="submit">第1筆</button>
							</div>
							<div class="btn-group " role="group">
								<button id="autokeyin2" class="btn btn-light" type="submit">第2筆</button>
							</div>
<!-- 							<div class="btn-group " role="group"> -->
<!-- 								<button id="autokeyin3" class="btn btn-light" type="submit">第3筆</button> -->
<!-- 							</div> -->
						</div>
						<div class="card-body">

							<%--   <form:form class="form" method="post" action="${contextRoot}/postMessage" modelAttribute="workMessages"> --%>
							<form:form class="form" method="post"
								action="${contextRoot}/postProduct" modelAttribute="workProduct"
								enctype="multipart/form-data" id="test2">

								<div class="form-group">
									<div>
										<div class="input-group-prepend">
											<label class="input-group-text" for="inputGroupSelect01">商品名稱</label>
											<%--   <form:textarea path="text" class="form-control"/> --%>
											<%--   <form:textarea path="productname" class="form-control"/> --%>
											<form:input path="productname" id="productname"
												class="form-control" />
										</div>
									</div>
									<br />
<!-- 																	<div> -->
<!-- 																		<div class="input-group mb-3"> -->
<!-- 																			<div class="input-group-prepend"> -->
<!-- 																				<label class="input-group-text" for="inputGroupSelect01">商品類別</label> -->
<!-- 																			</div> -->
<%-- 																			<form:select class="custom-select" id="inputGroupSelect01" --%>
<%-- 																				path="productcategory">  --%>
<!-- 																				<option value="蔬菜類">蔬菜類</option>  -->
<!-- 																				<option value="水果類">水果類</option>  -->
<!-- 																				<option value="肉品">肉品</option>  -->
<!-- 									 											<option value="海鮮">海鮮</option>  -->
<%-- 																			</form:select>  --%>
<!-- 																		</div>  -->
<!-- 																	</div> -->

<!-- 																	<br /> -->

									<div>
										<%-- 									<form:form class="form" method="post" --%>
										<%--  										action="${contextRoot}/postProduct"  --%>
										<%-- 										modelAttribute="WorkProduct"  --%>
										<%-- 										enctype="multipart/form-data">  --%>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<label class="input-group-text" for="inputGroupSelect01">商品類別</label>
											</div>
											<select class="custom-select" id="categoryid"
												name="productcategoryid">
												<c:forEach var="productcategorytakeon"
													items="${productcategorytakeon}">
													<c:choose>
														<c:when
															test="${WorkProduct.productcategoryid == productcategorytakeon.categoryid}">
															<option selected="selected"
																value="${productcategorytakeon.categoryid}">${productcategorytakeon.productcategoryname}</option>
														</c:when>
														<c:otherwise>
															<option value="${productcategorytakeon.categoryid}">${productcategorytakeon.productcategoryname}</option>
														
														</c:otherwise>
													</c:choose>

												</c:forEach>
											</select>
											<%-- 									<form:select class="custom-select" id="inputGroupSelect01" path="categoryid"> --%>
											<%-- 										<c:forEach var="productcategorytakeon" items="${productcategorytakeon}">  --%>
											<%-- 									<option value="${productcategorytakeon.categoryid}">${productcategorytakeon.productcategoryname}</option> --%>
											<%-- 								</c:forEach>  --%>
											<%--  									</form:select>   --%>
											<%-- 									<form:select class="custom-select" id="inputGroupSelect01" path="productcategoryid"> --%>
											<!-- 									<option value="蔬菜類">蔬菜類</option> -->
											<%-- 										<form:options var="productcategorytakeon" items="${productcategorytakeon}" itemLabel="productcategoryid" itemValue="productcategoryid" htmlEscape="false"/>  --%>
											<%-- 									<option value="${productcategorytakeon.categoryid}">${productcategorytakeon.productcategoryname}</option> --%>
											<%--  									</form:select>   --%>
										</div>
										<%-- 									</form:form> --%>
									</div>

									<br />

									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="inputGroupSelect01">價格</label>
										</div>
										<form:input path="productprice" id="productprice"
											class="form-control" />
									</div>
									<!-- 							價格 -->
									<%-- 							<form:input path="productprice" class="form-control" /> --%>



									<br />

									<div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<label class="input-group-text" for="takedown">上架狀態</label>
											</div>
											<form:select class="custom-select" id="takedown"
												path="takedown">
												<option value="上架中">直接上架</option>
												<option value="已下架">暫不上架</option>
											</form:select>
										</div>
									</div>

									<br />

									<!-- 							<div class="input-group mb-3"> -->
									<!-- 									<div class="input-group-prepend"> -->
									<!-- 										<label class="input-group-text" for="inputGroupSelect01">修改人員</label> -->
									<!-- 									</div> -->
									<form:hidden path="administrator" class="form-control" />
									<!-- 						</div> -->

									<br />

									<%--   <form action=""> --%>
									<%--   <form:input path="productimg" class="form-control" /> --%>

									<!--   <input type="file" name="file" id="img_upload_file" multiple="multiple" accept=".jpg,.jpeg,.gif" required/><br/> -->
									<!-- <input type="hidden" name="img_upload_base" id="img_upload_base" /> -->
									<!-- <label>圖片預覽</label>  -->
									<%-- <img id="img_upload_show"  style="width: 100px; height: 100px;" src= "data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image" /> --%>
									<%--   </form> --%>


									<div>
										<label class="input-group-text" for="inputGroupSelect01">商品介紹</label>
										<form:textarea path="productdesciption" id="productdesciption"
											class="form-control" />
									</div>

									<br />

									<div>
										<label class="input-group-text" for="inputGroupSelect01">庫存數量</label>
										<form:input path="inventoryquantity" id="inventoryquantity"
											class="form-control" />
									</div>

									<br />

									<!-- 							<label for="productcategoryBean">商品種類</label> -->
									<!-- 				<select  id="select" name="select"> -->
									<%-- 				<c:forEach var="productcategoryBean" items="${productcategory1}"> --%>
									<%-- 				<c:choose> --%>
									<%-- 					<c:when test="${product.productCategoryBean.productCategoryId == productCategoryBean.productCategoryId}"> --%>
									<%-- 					<option  selected="selected" value="${productcategoryBean.categoryId}">${productcategoryBean.productcategoryName}</option> --%>
									<%-- 					</c:when> --%>
									<%-- 					<c:otherwise> --%>
									<%-- 					<option value="${productCategoryBean.productCategoryId}">${productCategoryBean.productCategoryName}</option> --%>
									<%-- 				</c:otherwise></c:choose> --%>
									<%-- 				</c:forEach> --%>
									<!-- 				</select> -->

									<br />

									<div>
										<label class="input-group-text" for="inputGroupSelect01">商品圖片</label>
									</div>
									<div class="custom-file">
										<form:input path="productimg" type="file" accept="image/* "
											onchange="loadFile(event)" class="custom-file-input"
											id="customFileLang" lang="es" />
										<label class="custom-file-label" for="customFileLang">請選擇圖片</label>
									</div>

									<br /> <br /> <br />


									<div>
									<div class="input-group-prepend">
									<label class="input-group-text" for="customFileLang">圖片預覽</label>
									</div>
										<img id="output" style="width: 250px; height: 250px;" />
									</div>
									<script>
										// function preview() {
										//     frame.src=URL.createObjectURL(event.target.files[0]);
										// }
										// $("#img_upload_file").change(function() {
										//         var file = this.files[0];
										//         var reader = new FileReader();
										//         reader.readAsDataURL(file);//呼叫自帶方法進行轉換
										//         reader.onload = function(e) {
										//             $("#img_upload_show").attr("src", this.result);//將轉換後的編碼存入src完成預覽
										//             $("#img_upload_base").val(this.result);//將轉換後的編碼儲存到input供後臺使用
										//         }; 
										//     });

										var loadFile = function(event) {
											var reader = new FileReader();
											reader.onload = function() {
												var output = document
														.getElementById('output');
												output.src = reader.result;
											};
											reader
													.readAsDataURL(event.target.files[0]);
										};
									</script>



									<!-- <div> -->
									<%--      <img id="frame" class="rounded-sm" alt="productImg" src="data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image" width="100px" height="100px"> --%>
									<!--      </div> -->

								</div>
								<br />
								<input id="test" class="btn btn-primary" type="submit"
									value="新增商品">

							</form:form>
							

							<script>
								document.getElementById('test')
										.addEventListener('click', function() {
											event.preventDefault();
											Swal.fire({
												position : 'center',
												icon : 'success',
												title : '商品新增完成',
												showConfirmButton : false,
												timer : 2000
											}).then(function(isConfirm) {
												if (isConfirm) {
													$("#test2").submit();
												 var table = document.querySelector('.table');
													window.attachEvent("onload", table)
												}
// 													location.reload();
											})
// 													window.location.href = "http://localhost:8080/foodmarket/product/add";
										})

							</script>
						</div>
					</div>

				</div>

			</div>




		</div>
	</div>
</body>

</html>
