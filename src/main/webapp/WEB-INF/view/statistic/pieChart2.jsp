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
<script src="${contextRoot}/js/drilldown.src.js"></script>
<%-- <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet"> --%>
<meta charset="UTF-8">
<title>各分類銷售量分布</title>

</head>
<body>

<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3 pb-2 mb-3 border-bottom">
 <div class="container-fluid">
 	 <div class="row justify-content-center">
			<div id="chart1" style="min-width: 1050px; height: 550px;"></div>
		</div>
	</div>
	</div>
	<script>
		var rtnMapLabels = [];
		var rtnMapData = [];
		var rtnMapResult = [];
		var rtnMapVegetableResult = [];
		var rtnMapMeatResult = [];
		var rtnMapFruitResult = [];
		var rtnMapSeafoodResult = [];

		$.get("${contextRoot}/productCountCategory",
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
				rtnMapResult.push([ sorted1[i].name, sorted1[i].value, sorted1[i].name ])
			}
			
			$.get("${contextRoot}/productCountVegetable",
					function(rtnMapVegetable) {
						var array = [];
						for ( var key in rtnMapVegetable) {
							array.push({
								name : key,
								value : rtnMapVegetable[key]
							});
						}
						var sortedVegetable = array.sort(function(a, b) {
							return (a.value < b.value) ? 1
									: ((b.value < a.value) ? -1 : 0)
						});
						for (var i = 0; i < sortedVegetable.length; i++) {
							rtnMapVegetableResult.push([sortedVegetable[i].name, sortedVegetable[i].value])
						}
						
			$.get("${contextRoot}/productCountMeat",
						function(rtnMapMeat) {
							var array = [];
							for ( var key in rtnMapMeat) {
								array.push({
									name : key,
									value : rtnMapMeat[key]
								});
							}
							var sortedMeat = array.sort(function(a, b) {
								return (a.value < b.value) ? 1
										: ((b.value < a.value) ? -1 : 0)
							});
							for (var i = 0; i < sortedMeat.length; i++) {
								rtnMapMeatResult.push([sortedMeat[i].name, sortedMeat[i].value])
							}
					$.get("${contextRoot}/productCountFruit",
									function(rtnMapFruit) {
										var array = [];
										for ( var key in rtnMapFruit) {
											array.push({
												name : key,
												value : rtnMapFruit[key]
											});
										}
										var sortedFruit = array.sort(function(a, b) {
											return (a.value < b.value) ? 1
													: ((b.value < a.value) ? -1 : 0)
										});


										for (var i = 0; i < sortedFruit.length; i++) {
											rtnMapFruitResult.push([sortedFruit[i].name, sortedFruit[i].value])
										}
						$.get("${contextRoot}/productCountSeafood",
												function(rtnMapSeafood) {
													var array = [];
													for ( var key in rtnMapSeafood) {
														array.push({
															name : key,
															value : rtnMapSeafood[key]
														});
													}
													var sortedSeafood = array.sort(function(a, b) {
														return (a.value < b.value) ? 1
																: ((b.value < a.value) ? -1 : 0)
													});


													for (var i = 0; i < sortedSeafood.length; i++) {
														rtnMapSeafoodResult.push([sortedSeafood[i].name, sortedSeafood[i].value])
													}
										console.log(rtnMapVegetableResult);
										console.log(rtnMapMeatResult);
										console.log(rtnMapSeafoodResult);
										console.log(rtnMapFruitResult);
										console.log(rtnMapResult);
										Highcharts.chart('chart1', {
												chart : {
													type : 'pie',
													spacingTop: 40,
													style: {
														fontFamily: 'Calibri Light',
													}
												},
// 												colors : [ '#ED5565',
// 														'#5D9CEC', '#A0D468',
// 														'#FFCE54', '#48CFAD',
// 														'#AC92EC', '#AAB2BD',
// 														'#D770AD', '#c42525',
// 														'#a6c96a' ],
												 accessibility: {
											        announceNewData: {
											            enabled: true
											        },
											        point: {
											            valueSuffix: '%'
											        }
											    },
												title : {
													text : '各分類銷售量分布',
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
												series : [ 
													{
													name : "產品分類",
													data :[{
												        "name": sorted1[0].name,
												        "y": sorted1[0].value,
												        "drilldown": sorted1[0].name
												      },
												      {
												        "name": sorted1[1].name,
												        "y": sorted1[1].value,
												        "drilldown": sorted1[1].name
												      },
												      {
												        "name": sorted1[2].name,
												        "y": sorted1[2].value,
												        "drilldown": sorted1[2].name
													      },
												      {
												        "name": sorted1[3].name,
												        "y": sorted1[3].value,
												        "drilldown": sorted1[3].name
													      }
												      
												    ],
													size : 350,  //這個是圖的大小
													dataLabels: {
									                        style:{
									                        	fontSize: '18px'  //這個是圓餅圖label的大小
									                        }                  
									                   }
													
												} ],
												drilldown: {
											        series: [{
											                name: "蔬菜類",
											                id: "蔬菜類",
											                data: rtnMapVegetableResult
											            },
											            {
											                name: "水果類",
											                id: "水果類",
											                data: rtnMapFruitResult
											            },
											            {
											                name: "肉品",
											                id: "肉品",
											                data: rtnMapMeatResult
											            },
											            {
											                name: "海鮮",
											                id: "海鮮",
											                data: rtnMapSeafoodResult
											            },
										            
											        ]
												}
											});
											
						});
						});
			});
			});
		});


	</script>
</body>
</html>