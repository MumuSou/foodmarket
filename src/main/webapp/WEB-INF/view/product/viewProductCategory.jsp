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
table, td ,th {
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
<title>商品類別管理</title>
<%-- <link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick.css"/> --%>
<!-- // Add the new slick-theme.css if you want the default styling -->
<%-- <link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick-theme.css"/> --%>
</head>
<body>
	<br />
	<main role="main" class="col-md-6 ml-sm-auto  ">
 <h1 class="h1">所有商品類別頁面</h1>
</main>
<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
	<div class="container">


		<div class="row justify-content-center">

			<div class="col-18">

				<!-- 					<div class="card"> -->
				<!-- 						<div class="card-header"> -->
				<!-- 							最新訊息(時間) -->
				<%-- 							<fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss E EEEE" --%>
				<%-- 								value="${workMessage.added}" /> --%>
				<!-- 						</div> -->
				<!-- 						<div class="card-body"> -->
				<%-- 							<c:out value="${workMessage.text}" /> --%>

				<!-- 						</div> -->
				<!-- 					</div> -->
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th scope="col">商品類別ID</th>
							<th scope="col">商品類別名稱</th>
<!-- 							<th scope="col">新增日期</th> -->
							<th scope="col">上架狀態</th>
<!-- 							<th scope="col">修改人員</th> -->
							<th scope="col">功能</th>
						</tr>
					</thead>
					<c:forEach var="productcategory" items="${page.content}">
						<tbody>
							<tr>
								<th scope="row"><c:out value="${productcategory.categoryid}" /></th>
								<td ><c:out value="${productcategory.productcategoryname}" /></td>
<%-- 								<td><fmt:formatDate --%>
<%-- 										pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss  EEEE" --%>
<%-- 										value="${productcategory.added}" /></td> --%>

								<td><c:out value="${productcategory.takeon}" /></td>
								<td>
								<div>
										<a
											href="${contextRoot}/product/editCategory?categoryid=${productcategory.categoryid}"><button
												class="btn btn-info">編輯</button></a>
									</div> <br />
									<div>
										<a onclick="return confirm('真的要刪除嗎?')"
											href="${contextRoot}/productcategory/delete?categoryid=${productcategory.categoryid}"><button
												class="btn btn-danger" class=".check_pid">刪除</button></a>
									</div>
									</td>
							</tr>
						</tbody>
					</c:forEach>
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
	</div>

		<br />

		<hr />

</body>

</html>