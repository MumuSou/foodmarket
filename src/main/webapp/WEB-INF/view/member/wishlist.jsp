<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/memberNavbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的收藏</title>

<style type="text/css">
#contentTable {
	table-layout: fixed;
	/* bootstrap-table設定colmuns中某列的寬度無效時，需要給整個表設定css屬性 */
	word-break: break-all;
	word-wrap: break-all; /* 自動換行 */
}

.table tr td {
	vertical-align: middle;
}
</style>

</head>
<body>

	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 mt-4">
		<h1 class="h2">我的收藏</h1>
	</main>

	<c:choose>
		<c:when test="${num>0}">

			<div
				class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
				<div class="container">
					<div class="row justify-content-center">
						<table id="contentTable" class="table table-condensed ">
							<tr>
								<th style="width: 20px;">
								<th style="width: 150px;">
								<th style="width: 150px;">
								<th style="width: 150px;">
								<th style="width: 80px;"><c:forEach var="wishList"
										items="${page.content}">

										<tr id="${wishList.product.getProductid()}"
											class="text-center">
											<td>${wishList.product.getProductid()}</td>

											<td><img style="width: 100px; height: 100px;"
												src="data:image/image/*;base64,${wishList.product.getProductimg()}"
												alt="image" /></td>

											<td><a
												href="${contextRoot}/product/product?productid=${wishList.product.getProductid()}">${wishList.product.getProductname()}</a></td>

											<td>${wishList.product.getProductdesciption()}
											<td><button type="button" class="btn btn-danger"
													id="delete${wishList.product.getProductid()}"
													onclick="checkDelete(${wishList.product.getProductid()},${loginUserId})">取消收藏</button></td>
									</c:forEach>
						</table>

						<!-- 	頁數顯示 -->
						<div class="w-100"></div>
						<nav aria-label="Page navigation example">
							<ul class="pagination">

								<c:choose>
									<c:when test="${page.number == 0}">
										<li class="page-item disabled"><a class="page-link"
											href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:when>

									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${contextRoot}/wishList/${loginUserId}?p=${page.number+1 -1}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:otherwise>
								</c:choose>


								<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
									<c:choose>

										<c:when test="${pageNumber == page.number+1}">
											<li class="page-item disabled"><a class="page-link"
												href="${contextRoot}/wishList/${loginUserId}?p=${pageNumber}"><c:out
														value="${pageNumber}" /></a></li>
										</c:when>

										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${contextRoot}/wishList/${loginUserId}?p=${pageNumber}"><c:out
														value="${pageNumber}" /></a></li>
										</c:otherwise>

									</c:choose>
								</c:forEach>

								<c:choose>
									<c:when test="${page.number == page.totalPages-1}">
										<li class="page-item disabled"><a class="page-link"
											href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:when>

									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${contextRoot}/wishList/${loginUserId}?p=${page.number +2}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:otherwise>
								</c:choose>

							</ul>
						</nav>
						<!-- =========================================================================================================================== -->
					</div>
				</div>
			</div>

		</c:when>

		<c:otherwise>
		<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
			<div class="container">
				<div class="row justify-content-center">
					<h2>
						收藏是空的，<a href='${contextRoot}/HOME'>快去逛逛</a>
					</h2>
				</div>
			</div>
		</div>
		</c:otherwise>
	</c:choose>

	<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
	<script type="text/javascript">
function deleteOne(Pid,Cid) {
	
	var productId = Pid;
	
	var userId = Cid;
	
	var params = {"productId":''+productId,"userId":''+ userId};
	
	console.log(params)

    $.ajax({
      type: "post"
      , url: "http://localhost:8080/foodmarket/wishList/addOrCancel"
      ,	contentType:'application/json'
      , data: JSON.stringify(params)
      , success: function(res){
    	  $('#'+Pid).remove();
    	  location.reload(true);
      }
    });
  }

function checkDelete(Pid,Cid){
	var check = confirm('確定要刪除嗎？');
	if (check) {   
		deleteOne(Pid,Cid)
	}else{	
	}
}


</script>

</body>
</html>