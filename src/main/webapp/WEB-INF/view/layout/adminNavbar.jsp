<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
 content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
 content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">

<link rel="canonical"
 href="https://getbootstrap.com/docs/4.6/examples/dashboard/">

<link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick.css"/>
<!-- // Add the new slick-theme.css if you want the default styling -->
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick-theme.css"/>

<!-- Custom styles for this template -->
<link href="${contextRoot}/css/dashboard.css" rel="stylesheet">

<title>好食光市場後臺系統</title>

<style>
.bd-placeholder-img {
 font-size: 1.125rem;
 text-anchor: middle;
 -webkit-user-select: none;
 -moz-user-select: none;
 -ms-user-select: none;
 user-select: none;
}

@media ( min-width : 768px) {
 .bd-placeholder-img-lg {
  font-size: 3.5rem;
 }
}
</style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark sticky-top " >

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <ul class="navbar-nav mr-auto ">
    
      <li class="nav-item active">
      <a class="nav-link active" href="${contextRoot}/member/findAll">管理員首頁 <span class="sr-only">(current)</span></a>
      </li>
     	
    </ul>
    
     <button class="btn btn-outline-warning my-2 my-sm-0 ml-2" type="button" onclick="location.href='${contextRoot}/adminLogout'">登出</button>

  </div>
  
</nav>

<div class="container-fluid">
  <div class="row">
   <nav id="sidebarMenu"
    class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
    <div class="sidebar-sticky pt-3">
<!--  ==================================================================================================    -->
    <div class="panel panel-primary leftMenu">
    <div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse"
         data-target="#collapseListGroup1" role="tab">
		<a class="nav-link" href="${contextRoot}/member/findAll"> <span data-feather="user"></span> 會員管理 </a>
    </div>
  </div><!--panel end-->
  <!--  ==================================================================================================    -->
      <div class="panel panel-primary leftMenu">
    <div class="panel-heading" id="collapseListGroupHeading2" data-toggle="collapse"
         data-target="#collapseListGroup2" role="tab">
		<a class="nav-link" href="#"> <span data-feather="coffee"></span> 論壇管理 </a>
    </div>
    <!-- .panel-collapse和.collapse標明摺疊元素 .in表示要顯示出來 -->
    <div id="collapseListGroup2" class="panel-collapse collapse in" role="tabpanel"
         aria-labelledby="collapseListGroupHeading2">
      <ul class="list-group">
        <li class="list-group-item">
          <a class="dropdown-item" href="${contextRoot}/recipe/manageradd">新增食譜</a>
        </li>
        <li class="list-group-item">
          <a class="dropdown-item" href="${contextRoot}/recipe/backall">所有食譜訊息</a>
        </li>
      </ul>
    </div>
  </div><!--panel end-->
 <!--  ==================================================================================================    --> 
   <div class="panel panel-primary leftMenu">
    <div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse"
         data-target="#collapseListGroup3" role="tab">
		<a class="nav-link" href="#"> <span data-feather="shopping-bag"></span> 商城管理 </a>
    </div>
    <!-- .panel-collapse和.collapse標明摺疊元素 .in表示要顯示出來 -->
    <div id="collapseListGroup3" class="panel-collapse collapse in" role="tabpanel"
         aria-labelledby="collapseListGroupHeading3">
      <ul class="list-group">
        <li class="list-group-item">
          <a class="dropdown-item" href="${contextRoot}/product/add">新增商品訊息</a>
        </li>
        <li class="list-group-item">
          <a class="dropdown-item" href="${contextRoot}/product/all">所有商品訊息</a>
        </li>
        <li class="list-group-item">
          <a class="dropdown-item" href="${contextRoot}/productcategory/add">新增商品類別</a>
        </li>
        <li class="list-group-item">
          <a class="dropdown-item" href="${contextRoot}/productcategory/all">所有商品類別訊息</a>
        </li>
      </ul>
    </div>
  </div><!--panel end-->
 <!--  ==================================================================================================    --> 
   <div class="panel panel-primary leftMenu">
    <div class="panel-heading" id="collapseListGroupHeading4" data-toggle="collapse"
         data-target="#collapseListGroup4" role="tab">
		<a class="nav-link" href="#"> <span data-feather="file"></span> 訂單管理 </a>
    </div>
    <!-- .panel-collapse和.collapse標明摺疊元素 .in表示要顯示出來 -->
    <div id="collapseListGroup4" class="panel-collapse collapse in" role="tabpanel"
         aria-labelledby="collapseListGroupHeading4">
      <ul class="list-group">
        <li class="list-group-item">
          <a class="dropdown-item" href="${contextRoot}/orderRecord/all">訂單列表</a>
        </li>
<!--         <li class="list-group-item"> -->
<%--           <a class="dropdown-item" href="${contextRoot}/product/all">所有商品訊息</a> --%>
<!--         </li> -->
      </ul>
    </div>
  </div><!--panel end-->
  <!--  ==================================================================================================    -->
   <div class="panel panel-primary leftMenu">
    <div class="panel-heading" id="collapseListGroupHeading5" data-toggle="collapse"
         data-target="#collapseListGroup5" role="tab">
		<a class="nav-link" href="#"> <span data-feather="sun"></span> 活動管理 </a>
    </div>
    <!-- .panel-collapse和.collapse標明摺疊元素 .in表示要顯示出來 -->
    <div id="collapseListGroup5" class="panel-collapse collapse in" role="tabpanel"
         aria-labelledby="collapseListGroupHeading5">
      <ul class="list-group">
        <li class="list-group-item">
          <a class="dropdown-item" href="${contextRoot}/blogad/getAll">部落格廣告</a>
        </li>
        <li class="list-group-item">
          <a class="dropdown-item" href="${contextRoot}/shopad/getAll">商城廣告</a>
        </li>
      </ul>
    </div>
  </div><!--panel end-->
  <!--  ==================================================================================================    -->
   <div class="panel panel-primary leftMenu">
    <div class="panel-heading" id="collapseListGroupHeading6" data-toggle="collapse"
         data-target="#collapseListGroup6" role="tab">
		<a class="nav-link" href="${contextRoot}/statistic"> <span data-feather="file-text"></span> 報表管理 </a>
    </div>
  </div><!--panel end-->
<!--  ==================================================================================================    -->
   <div class="panel panel-primary leftMenu">
    <div class="panel-heading" id="collapseListGroupHeading6" data-toggle="collapse"
         data-target="#collapseListGroup6" role="tab">
		<a class="nav-link" href="#"> <span data-feather="file-text"></span> 報表管理 </a>
    </div>
    <!-- .panel-collapse和.collapse標明摺疊元素 .in表示要顯示出來 -->
    <div id="collapseListGroup6" class="panel-collapse collapse in" role="tabpanel"
         aria-labelledby="collapseListGroupHeading6">
      <ul class="list-group">
        <li class="list-group-item">
          <a class="dropdown-item" href="${contextRoot}/statistic">商品銷量分布</a>
        </li>
        <li class="list-group-item">
          <a class="dropdown-item" href="${contextRoot}/statisticCategory">各分類銷售量分布</a>
        </li>
      </ul>
    </div>
  </div><!--panel end-->
<!--  ==================================================================================================    -->
   <div class="panel panel-primary leftMenu">
    <div class="panel-heading" id="collapseListGroupHeading7" data-toggle="collapse"
         data-target="#collapseListGroup7" role="tab">
		<a class="nav-link" href="#"> <span data-feather="help-circle"></span> 問題管理 </a>
    </div>
    <!-- .panel-collapse和.collapse標明摺疊元素 .in表示要顯示出來 -->
    <div id="collapseListGroup7" class="panel-collapse collapse in" role="tabpanel"
         aria-labelledby="collapseListGroupHeading6">
      <ul class="list-group">
        <li class="list-group-item">
          <a class="dropdown-item" href="${contextRoot}/question/addQuestion">新增常見問題</a>
        </li>
        <li class="list-group-item">
          <a class="dropdown-item" href="${contextRoot}/question/viewAllQuestion">所有常見問題</a>
        </li>
      </ul>
    </div>
  </div><!--panel end-->
<!--  ==================================================================================================    -->
    </div>
   </nav>
  </div>
 </div>
 
<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${contextRoot}/js/slick.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
  crossorigin="anonymous"></script>
 <script>
  window.jQuery
    || document
      .write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
 </script>
 <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

 <script src="${contextRoot}/js/Chart.min.js"></script>
 <script src="${contextRoot}/js/dashboard.js"></script>
 
<script src="${contextRoot}/js/feather.min.js"></script>
<script> feather.replace()</script> 

</body>
</html>