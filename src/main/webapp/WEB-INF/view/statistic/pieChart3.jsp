<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/adminNavbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<%-- <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script> --%>
<script src="${contextRoot}/js/highcharts.src.js"></script>
<script src="${contextRoot}/js/exporting.src.js"></script>

<%-- <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet"> --%>
<meta charset="UTF-8">
<title>銷售圓餅圖</title>

</head>
<body>

<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
 <div class="container-fluid">
 	 <div class="row justify-content-center">
			<div id="chart1" style="min-width: 825px; height: 550px;"></div>
		</div>
	</div>
	</div>
	<script>
		var rtnMapLabels = [];
		var rtnMapData = [];
		var rtnMapResult = [];
		var download
		var myPieChart;
		const data = {
				name : rtnMapLabels,
				y : rtnMapData,
				drilldown : rtnMapLabels
			};
		$.get(
						"${contextRoot}/productCountVegetable",
						function(rtnMap) {
							var array = [];
							for ( var key in rtnMap) {
								array.push({
									name : key,
									value : rtnMap[key]
								});
							}
							var sorted1 = array.sort(function(a, b) {
								return (a.value < b.value) ? 1
										: ((b.value < a.value) ? -1 : 0)
							});


							for (var i = 0; i < sorted1.length; i++) {
								rtnMapResult.push([ sorted1[i].name,
										sorted1[i].value,sorted1[i].name ])
							}
							console.log(rtnMapResult)
							Highcharts.chart('chart1', {
												chart : {
													type : 'pie',
													spacingTop: 40,
													style: {
														fontFamily: 'Calibri Light',
													}
												},
												colors : [ '#ED5565',
														'#5D9CEC', '#A0D468',
														'#FFCE54', '#48CFAD',
														'#AC92EC', '#AAB2BD',
														'#D770AD', '#c42525',
														'#a6c96a' ],
												title : {
													text : '銷售圓餅圖',
// 													margin: 25,  //調整title和圖之間的距離
													style : {
														color : '#000',
														
													}
												},
												exporting: {
													 sourceWidth: 900,
												     sourceHeight: 650,
											    },
												tooltip : {
													shared : false,
													valueSuffix : '件'
												},
												credits : {
													enabled : false
												},
												plotOptions : {
													pie : {
														allowPointSelect : true,
														cursor : 'pointer',
														dataLabels : {
															enabled : true,
															format : '<b>{point.name}</b> {point.percentage:.1f} %',
															style : {
																color : (Highcharts.theme && Highcharts.theme.contrastTextColor)
																		|| 'black',
																width: '100px'
															}
														}
													},
													areaspline : {
														fillOpacity : 0.1
													},
													series : {
														groupPadding : .15
													}
												},
												series : [ {
													name : 'Category',
													type : 'pie',
// 													drilldown: {
// 												        series: [
// 												            {
// 												                name: "Chrome",
// 												                id: "Chrome",
// 												                data: [
// 												                ]
// 												            },
// 												            {
// 												                name: "Firefox",
// 												                id: "Firefox",
// 												                data: [
// 												                ]
// 												            },
// 												            {
// 												                name: "Internet Explorer",
// 												                id: "Internet Explorer",
// 												                data: [
												                    
// 												                ]
// 												            },
// 												            {
// 												                name: "Safari",
// 												                id: "Safari",
// 												                data: [
												                   
// 												                ]
// 												            },
// 												            {
// 												                name: "Edge",
// 												                id: "Edge",
// 												                data: [
												                    
// 												                ]
// 												            },
// 												            {
// 												                name: "Opera",
// 												                id: "Opera",
// 												                data: [
												                   
// 												                ]
// 												            }
													data : rtnMapResult,
													size : 350,  //這個是圖的大小
													dataLabels: {
									                        style:{
									                        	fontSize: '18px'  //這個是圓餅圖label的大小
									                        }                  
									                   }
												} ]

											});
						});


	</script>
</body>
</html>