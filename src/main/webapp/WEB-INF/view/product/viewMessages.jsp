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
	/*     BACKGROUND-COLOR: RGB(187, 229, 235); */
	/*     COLOR: RED; */
	/*     BORDER-COLLAPSE: COLLAPSE; */
	/* 	margin: 10px auto; */
	/* 	font-size: 125%; */
	/* 	padding: 10px; */
	/*     box-shadow: 5px 5px 2px gray; */
}

h5 {
	text-align: center;
}

.banner {
	width: 80%;
	margin: auto;
}

img {
	width: 200px;
}

.slick-slide {
	height: 45%;
}

.Btn-prev, .Btn-next {
	background: #6994B9;
}

.slick-slide img {
	margin: auto;
}

.card-text {
	margin-bottom: 10pt;
}

.stretched-link {
	
}
/* li{ */
/* border:3px rgb(66, 170, 218) solid ; */
/*     background-color: rgb(187, 229, 235); */
/*     color: red; */
/*     border-collapse: collapse; */
/*     margin: 10px auto; */
/*     font-size: 70%; */
/*     padding: 10px; */
/*     box-shadow: 5px 5px 2px gray; */
/* } */
</style>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
<%-- <link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick.css"/> --%>
<!-- // Add the new slick-theme.css if you want the default styling -->
<%-- <link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick-theme.css"/> --%>
</head>
<body>
	<br />
	<main role="main" class="col-md-6 ml-sm-auto  ">
		<h1 class="h1">所有商品頁面</h1>
	</main>
	<div
		class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
		<div class="container-fluid">


			<div class="row justify-content-center">
				<div class="col-10">
					<form class="form-inline my-2 my-lg-0"
						action="${contextRoot}/product/name" method="get">
						<input class="form-control mr-sm-2" type="text"
							placeholder="Search" aria-label="Search" id="name"
							name="productname" autocomplete="off" required>
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜尋</button>
					</form>
					<%-- 	<form:form action="${contextRoot}/product/name" method="get"> --%>
					<!-- 	<div class="div1"> -->
					<!-- 				<label for="id" class="id">商品名稱查詢 : </label>  -->
					<!-- 				<input type="text" id="name" name="productname" autocomplete="off" required /> -->
					<!-- 				<input type="submit" value="查詢"> -->
					<!-- 			</div> -->
					<%-- 			</form:form> --%>
				</div>
				<div class="col-1">
					<form:form action="${contextRoot}/product/productcategory"
						method="get">
						<div class="div1">

							<!-- 				<label for="id" class="id">商品類別查詢 : </label>  -->
							<!-- 				<input type="text" id="name" name="productcategory" autocomplete="off" required /> -->
							<!-- 				<input type="submit" value="查詢"> -->


							<!-- 			</div> -->
							<!-- 			<div class="dropdown"> -->
							<button class="btn btn-secondary dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-expanded="false">商品類別</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="${contextRoot}/product/all">所有商品訊息</a>
								<c:forEach var="productcategorytakeon"
									items="${productcategorytakeon}">
									<a class="dropdown-item "
										href="${contextRoot}/product/productcategory?categoryid=${productcategorytakeon.categoryid}">
										${productcategorytakeon.productcategoryname} </a>
								</c:forEach>
<!-- 								<a class="dropdown-item" -->
<%-- 									href="${contextRoot}/product/productcategory?productcategory=蔬菜類">蔬菜類</a> --%>
<!-- 								<a class="dropdown-item" -->
<%-- 									href="${contextRoot}/product/productcategory?productcategory=水果類">水果類</a> --%>
<!-- 								<a class="dropdown-item" -->
<%-- 									href="${contextRoot}/product/productcategory?productcategory=肉品">肉品</a> --%>
<!-- 								<a class="dropdown-item" -->
<%-- 									href="${contextRoot}/product/productcategory?productcategory=海鮮">海鮮</a> --%>
							</div>
						</div>
					</form:form>
					<br />
				</div>

				<hr />

				<br />

				<hr />

				<div class="col-18">
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th scope="col" style="text-align: center;">商品ID</th>
								<th scope="col" style="text-align: center;">商品名稱</th>
								<th scope="col" style="text-align: center;">商品類別</th>
<!-- 								<th scope="col" style="text-align: center;">商品類別</th> -->
								<th scope="col" style="text-align: center;">價格</th>
								<th scope="col" style="text-align: center;">商品圖片</th>
								<th scope="col" style="text-align: center;">新增日期</th>
								<th scope="col" style="text-align: center;">商品介紹</th>
								<th scope="col" style="text-align: center;">庫存數量</th>
								<th scope="col" style="text-align: center;">上架狀態</th>
								<th scope="col" style="text-align: center;">功能</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="workProduct" items="${page.content}">
								<tr>
									<th style="text-align: center;" scope="row"><c:out
											value="${workProduct.productid}" /></th>
											
									<td style="text-align: center;"><c:out
											value="${workProduct.productname}" /></td>
									<td style="text-align: center;"><c:out
											value="${workProduct.productcategoryBean.productcategoryname}" /></td>
<%-- 									<td style="text-align: center;"><c:out --%>
<%-- 											value="${workProduct.productcategory}" /></td> --%>
									<td style="text-align: center;"><c:out
											value="${workProduct.productprice}" /></td>
									<td style="text-align: center;"><img
										style="width: 100px; height: 100px;"
										src="data:image/image/*;base64,${workProduct.productimg}"
										alt="image" /></td>
									<td style="text-align: center;"><fmt:formatDate
											pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss  E"
											value="${workProduct.added}" /></td>

									<td style=""><c:out
											value="${workProduct.productdesciption}" /></td>
									<td style="text-align: center;"><c:out
											value="${workProduct.inventoryquantity}" /></td>
									<td style="text-align: center;"><c:out
											value="${workProduct.takedown}" /></td>
									<%-- 							<c:forEach var="productcategoryBean" items="${pcage.content}">	 --%>
											
<%-- 											<c:out value="${workProduct.productcategoryBean.productcategoryname}"></c:out> --%>
									<%-- 								</c:forEach> --%>
									<td style="text-align: center;"><div>
											<a
												href="${contextRoot}/product/editProduct?productid=${workProduct.productid}"><button
													class="btn btn-info">編輯</button></a>
										</div> <br />
										<div>
											<a onclick="return confirm('真的要刪除嗎?')"
												href="${contextRoot}/product/delete?productid=${workProduct.productid}"><button
													class="btn btn-danger" class=".check_pid">刪除</button></a>
										</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>

			</div>






			<br />

		</div>

		<!-- 	<div class="row justify-content-center container"> -->

		<!-- 		<div class="col-9"> -->
		<%-- 			<c:forEach var="pageNumber" begin="1" end="${page.totalPages}"> --%>
		<%-- 				<c:choose> --%>
		<%-- 					<c:when test="${page.number != pageNumber-1}"> --%>
		<%-- 						<a href="${contextRoot}/product/all?p=${pageNumber}"><c:out --%>
		<%-- 								value="${pageNumber}" /></a> --%>
		<%-- 					</c:when> --%>

		<%-- 					<c:otherwise> --%>
		<%-- 						<c:out value="${pageNumber}" /> --%>
		<%-- 					</c:otherwise> --%>

		<%-- 				</c:choose> --%>

		<%-- 				<c:if test="${pageNumber != page.totalPages}"> --%>
		<!-- 							| -->
		<%-- 							</c:if> --%>
		<%-- 			</c:forEach> --%>


		<!-- 		</div> -->
		<!-- 		</div> -->

		<!-- 	頁數顯示 -->
		<div class="w-100"></div>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">

				<c:choose>
					<c:when test="${page.number == 0}">
						<li class="page-item disabled"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:when>

					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="${contextRoot}/product/all?p=${page.number+1 -1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>


				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
					<c:choose>

						<c:when test="${pageNumber == page.number+1}">
							<li class="page-item disabled"><a class="page-link"
								href="${contextRoot}/product/all?p=${pageNumber}"><c:out
										value="${pageNumber}" /></a></li>
						</c:when>

						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${contextRoot}/product/all?p=${pageNumber}"><c:out
										value="${pageNumber}" /></a></li>
						</c:otherwise>

					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${page.number == page.totalPages-1}">
						<li class="page-item disabled"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:when>

					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="${contextRoot}/product/all?p=${page.number +2}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</nav>
	</div>

	<br />

	<hr />




</body>

</html>