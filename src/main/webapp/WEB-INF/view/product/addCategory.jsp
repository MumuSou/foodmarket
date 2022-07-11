<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../layout/adminNavbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<main role="main" class="col-md-6  ml-sm-auto  ">
 <h1 class="h1">新增商品總類頁面</h1>
</main>

<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
 <div class="container">

	<div class="row justify-content-center">
		<div class="col-9">
			<div class="card">
				<div class="card-header">請輸入新商品類別資訊</div>
				<div class="card-body">

					<%--   <form:form class="form" method="post" action="${contextRoot}/postMessage" modelAttribute="workMessages"> --%>
					<form:form class="form" method="post"
						action="${contextRoot}/postCategory" modelAttribute="productcategory"
						enctype="multipart/form-data">

						<div class="form-group">
							<div>
								<div class="input-group-prepend">
									<label class="input-group-text" for="inputGroupSelect01">商品類別名稱</label>
									<%--   <form:textarea path="text" class="form-control"/> --%>
									<%--   <form:textarea path="productname" class="form-control"/> --%>
									<form:input path="productcategoryname" class="form-control" />
								</div>
							</div>
							<br />


							<div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">上架狀態</label>
									</div>
									<form:select class="custom-select" id="inputGroupSelect01"
										path="takeon">
										<option value="上架中">上架</option>
										<option value="已下架">下架</option>
									</form:select>
								</div>
							</div>
							</div>
							<br/>
							
						
						

							




						<!-- <div> -->
						<%--      <img id="frame" class="rounded-sm" alt="productImg" src="data:image/${workProduct.imgtype};base64,${workProduct.productimg}" alt="image" width="100px" height="100px"> --%>
						<!--      </div> -->

				<br/>
						<input type="submit" name="submit" value="新增商品類別">

					</form:form>

				</div>
			</div>

		</div>

	</div>



</div>
</div>

