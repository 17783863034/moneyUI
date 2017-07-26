<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生财有道-报表</title>
<link rel="stylesheet" type="text/css"
	href="${projectPath }/bootstrap/bootstrap.css">
<link href="${projectPath }/bootstrap/bootstrap-responsive.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${projectPath }/bootstrap/jquery-1.10.1.js"></script>
<script type="text/javascript"
	src="${projectPath }/bootstrap/bootstrap.js"></script>
<script type="text/javascript"
	src="${projectPath }/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${projectPath }/bootstrap/echarts.js"></script>
<script type="text/javascript">
	$(function() {
		var store = 1;
		var submitid = 1;
		//支出部分
		$(".chickTwoType").click(function() {
			var showType = this.innerHTML;
			$(".typeShow").html(showType);
			submitid = $(this).attr("id");
		});
		//收入部分
		$(".chickTwoType1").click(function() {
			var showType = this.innerHTML;
			$(".typeShow").html(showType);
			submitid = $(this).attr("id");
		});
		$(".clickAccount").click(function() {
			var showType = this.innerHTML;
			$(".accountShow").html(showType);

		});
	});
</script>
</head>
<body>
	<div class="container">
		<%@include file="/public_page/page_head.jsp"%>
		<div class="jumbotron">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span3">
						<ul id="myTab" class="nav nav-list">
							<li class="active"><a href="#home" data-toggle="tab"
								class="btn btn-warning"> 日常收支表 </a></li>
							<li><a href="#ios" data-toggle="tab" class="btn btn-primary">收支趋势表</a></li>
							<li class="dropdown"><a href="#" id="myTabDrop1"
								class="btn btn-danger dropdown-toggle " data-toggle="dropdown">其他表
									<b class="caret"></b>
							</a>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="myTabDrop1">
									<li><a class="btn btn-info" href="#jmeter" tabindex="-1"
										data-toggle="tab">对账报表</a></li>
									<li><a class="btn btn-success" href="#ejb" tabindex="-1"
										data-toggle="tab">资产负债表</a></li>
								</ul></li>
						</ul>
					</div>
					<div id="myTabContent" class="span9 tab-content">
						<div class="tab-pane fade in active" id="home">
<!-- 							<div class="dropdown allTime"> -->
<!-- 								<ul class="nav nav-pills"> -->
<!-- 									<li class="active"><a href="#">全部</a></li> -->
<!-- 									<li><a id="dLabel" role="button" data-toggle="dropdown" -->
<!-- 										class="btn btn-default" data-target="#" href="javascript:;"> -->
<!-- 											<span class="typeShow">选择分类</span> <span class="caret"></span> -->
<!-- 									</a> -->
<!-- 										<ul class="dropdown-menu multi-level" role="menu" -->
<!-- 											aria-labelledby="dropdownMenu"> -->
<%-- 											<c:forEach items="${allPayFirstType }" var="allPayFirsyType"> --%>
<!-- 												<li class="dropdown-submenu"><a -->
<!-- 													class="btn btn-info chickTwoType" tabindex="-1" -->
<%-- 													href="JavaScript:void(0)">${allPayFirsyType.payFirstName }</a> --%>
<!-- 												</li> -->
<%-- 											</c:forEach> --%>
<%-- 											<c:forEach items="${allIncomeFirstType }" --%>
<%-- 												var="allIncomeFirstType"> --%>
<!-- 												<li class="dropdown-submenu"><a -->
<!-- 													class="btn btn-info chickTwoType1" tabindex="-1" -->
<%-- 													href="JavaScript:void(0)">${allIncomeFirstType.incomeFirstName }</a> --%>
<!-- 												</li> -->
<%-- 											</c:forEach> --%>
<!-- 										</ul></li> -->
<!-- 									<li><a id="dLabel" role="button" data-toggle="dropdown" -->
<!-- 										class="btn btn-default" data-target="#" href="javascript:;"> -->
<!-- 											<span class="accountShow">选择账户</span> <span class="caret"></span> -->
<!-- 									</a> -->
<!-- 										<ul class="dropdown-menu" role="menu" -->
<!-- 											aria-labelledby="dropdownMenu"> -->
<%-- 											<c:forEach items="${allChildAcc }" var="allChildAcc"> --%>
<!-- 												<li class="dropdown-submenu"><a -->
<%-- 													class="btn btn-info clickAccount" href="JavaScript:void(0)">${allChildAcc.childaccName }</a></li> --%>
<%-- 											</c:forEach> --%>
<!-- 										</ul></li> -->
<!-- 									<li><a id="dLabel" role="button" data-toggle="dropdown" -->
<!-- 										class="btn btn-default" data-target="#" href="javascript:;"> -->
<!-- 											选择时间<span class="caret"></span> -->
<!-- 									</a> -->
<!-- 										<ul class="dropdown-menu multi-level" role="menu" -->
<!-- 											aria-labelledby="dropdownMenu"> -->
<!-- 											<li class="dropdown-submenu">从&nbsp<input type="text" -->
<!-- 												id="d241" -->
<!-- 												onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" -->
<!-- 												class="Wdate" style="width: 150px; height: 30px;" /><br /> -->
<!-- 												<br /> 到&nbsp<input type="text" id="d241" -->
<!-- 												onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" -->
<!-- 												class="Wdate" style="width: 150px; height: 30px;" /> <br /> -->
<!-- 												<button class="btn btn-default">确定</button> -->
<!-- 											</li> -->
<!-- 										</ul></li> -->
<!-- 									<li><input type="text" class="conditionclass" -->
<!-- 										id="exampleInputAmount" placeholder="搜备注关键字"> -->
<!-- 										<button type="submit" class="btn btn-primary sunmitClass">搜索</button> -->
<!-- 									</li> -->
<!-- 								</ul> -->

<!-- 							</div> -->
							<div class="hero-unit">
								<h2>日常收支表</h2>
								<p>2017.01.01-2017.07.11</p>
							</div>
							<div class="span12">
								<h3>支出堆积图</h3>
								<div id="main" style="width: 600px; height: 400px;"></div>
								<a class="btn" href="#">View details &raquo;</a>
							</div>
							<div class="span12">
								<table class="table table-bordered table-hover text-center" id="paytable">
									<tr>
										<th>一级分类</th>
										<th>金额</th>
									</tr>
									
								
								</table>
							</div>
							<div class="span12">
								<h3>收入堆积图</h3>
								<div id="main1" style="width: 600px; height: 400px;"></div>
								<a class="btn" href="#">View details &raquo;</a>
							</div>
							<div class="span12">
								<table class="table table-bordered table-hover text-center" id="gettable">
									<tr>
										<th>一级分类</th>
										<th>金额</th>
									</tr>
								
								
								</table>
							</div>
						</div>
						<!-- 第二个页面 -->
						<div class="tab-pane fade" id="ios">
							<div class="col-md-12 column">
								<div class="collapse navbar-collapse"
									id="bs-example-navbar-collapse-1">
									<ul class="nav nav-pills">
										<li class="active"><a href="#">全部</a></li>
										<li><a id="dLabel" role="button" data-toggle="dropdown"
											class="btn btn-default" data-target="#" href="javascript:;">
												<span class="typeShow">选择分类</span> <span class="caret"></span>
										</a>
											<ul class="dropdown-menu multi-level" role="menu"
												aria-labelledby="dropdownMenu">
												<c:forEach items="${allPayFirstType }" var="allPayFirsyType">
													<li class="dropdown-submenu"><a
														class="btn btn-info chickTwoType" tabindex="-1"
														href="JavaScript:void(0)">${allPayFirsyType.payFirstName }</a>
													</li>
												</c:forEach>
												<c:forEach items="${allIncomeFirstType }"
													var="allIncomeFirstType">
													<li class="dropdown-submenu"><a
														class="btn btn-info chickTwoType1" tabindex="-1"
														href="JavaScript:void(0)">${allIncomeFirstType.incomeFirstName }</a>
													</li>
												</c:forEach>
											</ul></li>
										<li>
											<ul class="nav nav-pills">
												<li>从&nbsp<input type="text" id="d241"
													onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
													class="Wdate" style="width: 150px; height: 30px;" /><br />
													<br />
												</li>
												<li>到&nbsp<input type="text" id="d241"
													onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
													class="Wdate" style="width: 150px; height: 30px;" /> <br />
												</li>
												<li>
													<button class="btn btn-default">确定</button>
												</li>
											</ul>
										</li>
										<li><input type="text" class="conditionclass"
											id="exampleInputAmount" placeholder="搜备注关键字">
											<button type="submit" class="btn btn-primary sunmitClass">搜索</button>
										</li>
									</ul>
								</div>
							</div>
							<div class="hero-unit">
								<h2>收支趋势图</h2>
								<p>2017.01.01-2017.07.11</p>
							</div>
							<div class="span12">
								<div id="main2" style="width: 600px; height: 400px;"></div>
								<a class="btn" href="#">View details &raquo;</a>
							</div>
							<div class="span12">
								<table class="table table-bordered table-hover text-center">
									<tr>
										<th>时间</th>
										<th>收入</th>
										<th>支出</th>
										<th>结余</th>
									</tr>
									<tr>
										<td>总计</td>
										<td>吃鸡</td>
										<td>￥9999</td>
										<td>￥9999</td>
									</tr>
									<tr>
										<td>衣服饰品</td>
										<td>买了个婊</td>
										<td>￥1111</td>
										<td>￥1111</td>
									</tr>
									<tr>
										<td>3123</td>
										<td>2412</td>
										<td>￥132</td>
										<td>￥132</td>
									</tr>
								</table>
							</div>
						</div>
						<!-- 第三个 -->
						<div class="tab-pane fade" id="jmeter">
							<div class="col-md-12 column">
								<ul class="nav nav-pills">
									<li><a id="dLabel" role="button" data-toggle="dropdown"
										class="btn btn-default" data-target="#" href="javascript:;">
											<span class="accountShow">现金</span> <span class="caret"></span>
									</a>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="dropdownMenu">
											<c:forEach items="${allChildAcc }" var="allChildAcc">
												<li class="dropdown-submenu"><a
													class="btn btn-info clickAccount" href="JavaScript:void(0)">${allChildAcc.childaccName }</a></li>
											</c:forEach>
										</ul></li>
									<li>
										<ul class="nav nav-pills">
											<li>从&nbsp<input type="text" id="d241"
												onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
												class="Wdate" style="width: 150px; height: 30px;" /><br />
												<br />
											</li>
											<li>到&nbsp<input type="text" id="d241"
												onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
												class="Wdate" style="width: 150px; height: 30px;" /> <br />
											</li>
											<li>
												<button class="btn btn-default">确定</button>
											</li>
										</ul>
									</li>
								</ul>
							</div>
							<div class="hero-unit">
								<h2>现金对账表</h2>
								<p>2017.01.01-2017.07.31</p>
							</div>
							<div class="span12">
								<table class="table table-condensed table-hover ">
									<c:if test="${empty requestScope.page.list}">
										<tr>
											<td>暂时没有账单数据！</td>
										</tr>
									</c:if>
									<c:if test="${!empty requestScope.page.list}">
										<c:forEach items="${requestScope.page.list}" var="check">
											<tr class="warning">
												<td style="width: 104px;"><fmt:formatDate
														value="${check.checkTime}" pattern="yyyy-MM-dd" /></td>
												<td style="width: 104px;">${check.checkType}</td>
												<c:if test="${check.checkInOrNot}">
													<td style="width: 104px;">收</td>
												</c:if>
												<c:if test="${!check.checkInOrNot}">
													<td style="width: 104px;">支</td>
												</c:if>
												<td style="width: 104px;">${check.checkMoney}</td>
												<td style="width: 104px;">1111</td>
												<td style="width: 104px;">${check.checkAccount}</td>
												<td style="width: 104px;">1111</td>
												<td style="width: 104px;">${check.checkAdverseAccount}</td>
												<td style="width: 104px;">${check.checkRemark}</td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="9"><c:set var="pageUrl"
													value="${projectPath }/create/managerMoney/check/toMarkAccountPage"
													scope="page"></c:set> <%@include
													file="/WEB-INF/manager_log/navigator_page.jsp"%>
											</td>
										</tr>
									</c:if>

								</table>
							</div>
						</div>
						<!--第四个 -->
						<div class="tab-pane fade" id="ejb">
							<div class="hero-unit">
								<h2>资产负债表</h2>
								<p>2017.01.01-2017.07.11</p>
								<div id="main3" style="width: 600px; height: 400px;"></div>
								<p>小提示：新算法——余额为负数的账户金额已列入统计。</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<div class="footerNav">
				<a rel="nofollow" href="http://www.atguigu.com">关于我们</a> | <a
					rel="nofollow" href="http://www.atguigu.com">服务条款</a> | <a
					rel="nofollow" href="http://www.atguigu.com">免责声明</a> | <a
					rel="nofollow" href="http://www.atguigu.com">网站地图</a> | <a
					rel="nofollow" href="http://www.atguigu.com">联系我们</a>
			</div>
			<div class="copyRight">Copyright ?2017-2017atguigu.com 版权所有</div>
		</div>
	</div>
	<script type="text/javascript">
	

	
	var typesPay;
	var sumAmountsPay;
 	function ajaxGetPayAndCome(){
 		$.post(
				"${projectPath }/create/managerMoney/chart/ajaxGetPayAndCome",
				function(result){
					//支出表
					var context="";
					var total=0;
					$.each(result.payFirstList,function(i,resultType){
						
						context+='<tr>                                   ';
						context+='	<td>'+resultType.type+'</td>                           ';
						context+='	<td>'+resultType.sumAmount+'</td>                           ';
						context+='</tr>                                  ';
						total+=resultType.sumAmount;
					});
				    context+='<tr >                                  ';
					context+='	<td colspan="2">支出总计：￥'+total+'</td>';
					context+='</tr>                                  ';
					
					$("#paytable").append(context);
					
					//收入表
					var context1="";
					var total1=0;
					$.each(result.incomeFirstList,function(i,resultType){
						
						context1+='<tr>                                   ';
						context1+='	<td>'+resultType.type+'</td>                           ';
						context1+='	<td>'+resultType.sumAmount+'</td>                           ';
						context1+='</tr>                                  ';
						total1+=resultType.sumAmount;
					});
				    context1+='<tr >                                  ';
					context1+='	<td colspan="2">收入总计：￥'+total1+'</td>';
					context1+='</tr>                                  ';
					
					$("#gettable").append(context1);
					
					
					
					typesPay=result.typesPay;
					typesCome=result.typesCome;
					
					sumAmountsPay=result.sumAmountsPay;
					sumAmountsCome=result.sumAmountsCome;
					
					var myChart = echarts.init(document.getElementById('main'));
					

					// 指定图表的配置项和数据
					option = {
						color : [ '#3398DB' ],
						tooltip : {
							trigger : 'axis',
							axisPointer : { // 坐标轴指示器，坐标轴触发有效
								type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
							}
						},
						grid: {  
		                    y2: 140  
		                },  
		                xAxis: {  
		                    type: 'category',  
		                    boundaryGap: [0, 0.01],  
		                    name: '投标人',  
		                    data: typesPay,  
		                    axisLabel:{  
		                         interval:0,//横轴信息全部显示  
		                         rotate:-30,//-30度角倾斜显示  
		                    }  
		                } ,
						yAxis : [ {
							type : 'value'
						} ],
						series : [ {
							name : '直接访问',
							type : 'bar',
							barWidth : '60%',
							data : sumAmountsPay,
							itemStyle : {
								normal : {
									color : function(params) {
										var colorList = [ '#C33531', '#EFE42A', '#64BD3D',
												'#EE9201', '#29AAE3', '#B74AE5', '#0AAF9F',
												'#E89589' ];
										return colorList[params.dataIndex]
									},
									label : {
										show : false
									}
								}
							}
						} ]
					};

					// 使用刚指定的配置项和数据显示图表。
					myChart.setOption(option);
					
					
					
					var myChart1 = echarts.init(document.getElementById('main1'));

					// 指定图表的配置项和数据
					option1 = {
						color : [ '#3398DB' ],
						tooltip : {
							trigger : 'axis',
							axisPointer : { // 坐标轴指示器，坐标轴触发有效
								type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
							}
						},
						grid : {
							left : '3%',
							right : '4%',
							bottom : '3%',
							containLabel : true
						},
						xAxis : [ {
							type : 'category',
							data : typesCome,
							axisTick : {
								alignWithLabel : true
							}
						} ],
						yAxis : [ {
							type : 'value'
						} ],
						series : [ {
							name : '直接访问',
							type : 'bar',
							barWidth : '60%',
							data : sumAmountsCome,
							itemStyle : {
								normal : {
									color : function(params) {
										var colorList = [ '#C33531', '#EFE42A', '#64BD3D',
												'#EE9201', '#29AAE3', '#B74AE5', '#0AAF9F',
												'#E89589' ];
										return colorList[params.dataIndex]
									},
									label : {
										show : false
									}
								}
							}
						} ]
					};

					// 使用刚指定的配置项和数据显示图表。
					myChart1.setOption(option1);
				},
				"json"
		);
 	};	
	
 	ajaxGetPayAndCome();

		
		
		var myChart2 = echarts.init(document.getElementById('main2'));
		option2 = {
			title : {
				text : '七日年化收益率(%)'
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '基金', '股票' ]
			},
			toolbox : {
				show : false,
				feature : {
					dataZoom : {
						yAxisIndex : 'none'
					},
					dataView : {
						readOnly : false
					},
					magicType : {
						type : [ 'line', 'bar' ]
					},
					restore : {},
					saveAsImage : {}
				}
			},
			xAxis : {
				type : 'category',
				boundaryGap : false,
				data : [ '2017-05-16', '2017-05-17', '2017-05-18',
						'2017-05-19', '2017-05-20', '2017-05-21', '2017-05-22' ]
			},
			yAxis : {
				type : 'value',
				axisLabel : {
					formatter : '{value} '
				}
			},
			series : [ {
				name : '基金',
				type : 'line',
				data : [ 1, 1, 5, 3, 2, 3, 2 ],
				markPoint : {
					data : [ {
						type : 'max',
						name : '最大值'
					}, {
						type : 'min',
						name : '最小值'
					} ]
				},
				markLine : {
					data : [ {
						type : 'average',
						name : '平均值'
					} ]
				}
			}, {
				name : '股票',
				type : 'line',
				data : [ 1, -2, 2, 5, 3, 2, 4 ],
				markPoint : {
					data : [ {
						name : '周最低',
						value : -2,
						xAxis : 1,
						yAxis : -1.5
					} ]
				},
				markLine : {
					data : [ {
						type : 'average',
						name : '平均值'
					}, [ {
						symbol : 'none',
						x : '90%',
						yAxis : 'max'
					}, {
						symbol : 'circle',
						label : {
							normal : {
								position : 'start',
								formatter : '最大值'
							}
						},
						type : 'max',
						name : '最高点'
					} ] ]
				}
			} ]
		};
		myChart2.setOption(option2);
		var myChart3 = echarts.init(document.getElementById('main3'));

		// 指定图表的配置项和数据
		option3 = {
			title : {
				text : '某培训机构学员访问来源',
				subtext : '纯属虚构',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				left : 'left',
				data : [ '花呗欠款', '白条欠款', '信用卡欠款', '小额贷款', '裸贷' ]
			},
			series : [ {
				name : '负债来源',
				type : 'pie',
				radius : '55%',
				center : [ '50%', '60%' ],
				data : [ {
					value : 3351,
					name : '花呗欠款'
				}, {
					value : 3102,
					name : '白条欠款'
				}, {
					value : 2348,
					name : '信用卡欠款'
				}, {
					value : 1359,
					name : '小额贷款'
				}, {
					value : 15487,
					name : '裸贷'
				} ],
				itemStyle : {
					emphasis : {
						shadowBlur : 10,
						shadowOffsetX : 0,
						shadowColor : 'rgba(0, 0, 0, 0.5)'
					}
				}
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart3.setOption(option3);
	</script>
</body>
</html>