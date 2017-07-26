<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- EasyUI开发环境搭建 -->
<!-- I.JavaScript库文件 -->
<!-- i.jQuery库文件 -->
<script type="text/javascript"
	src="${projectPath }/jQuery/jquery.min.js"></script>

<!-- ii.EasyUI库文件 -->
<script type="text/javascript"
	src="${projectPath }/jQuery/jquery.easyui.min.js"></script>

<!-- iii.本地化文件 -->
<script type="text/javascript"
	src="${projectPath }/jQuery/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${projectPath }/script/echarts.js"></script>
<script type="text/javascript"
	src="${projectPath }/My97DatePicker/WdatePicker.js"></script>
<!-- II.CSS样式文件 -->
<!-- i.主题样式文件 -->
<link rel="stylesheet" type="text/css"
	href="${projectPath }/style/themes/gray/easyui.css" />

<!-- ii.图标样式文件 -->
<link rel="stylesheet" type="text/css"
	href="${projectPath }/style/themes/icon.css" />
<!-- bootstrap环境 -->
<script type="text/javascript"
	src="${projectPath }/bootstrap/bootstrap.js"></script>
<script src="${projectPath }/script/layer/layer.js"></script>
<link rel="stylesheet" type="text/css"
	href="${projectPath }/bootstrap/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${projectPath }/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="${projectPath }/css/main.css" />

<script type="text/javascript">
	$(function() {
		//优质基金查询条件
		var condition = 'byJjgm';
	
		//ajax请求显示优质股票
		function getFund() {
			$.post("${projectPath}/create/managerMoney/fund/getPrimeFund/"
					+ condition, function(result) {
				for (var i = 0; i < result.length; i++) {
					//添加数据
					$("#prime1_" + i).text(result[i].fundName);
					$("#prime2_" + i).text("基金类型：" + result[i].type);
					$("#prime3_" + i).text("一周基金净值变化：" + result[i].growth);
					$("#prime4_" + i).text("基金累积净值：" + result[i].fundLjjz);
					$("#prime5_" + i).text("基金规模" + result[i].fundJjgm);
					// 指定图表的配置项和数据
					option = {
						title : {
							text : '近期基金净值变化'
						},
						tooltip : {
							trigger : 'axis'
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
							data : result[i].days
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
							data : result[i].fundDwjzs,
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
						} ]
					};
					echarts.init(document.getElementById('main_' + i))
							.setOption(option);
				}
			}, "json");
		}
	
	
		
		$("#JJGrid2")
				.datagrid(
						{
							url : "${projectPath}/create/managerMoney/fund/getPrimeFund/"
									+ condition,
							fitColumns : true,
							singleSelect : true,
							pagination : true,
							toolbar : "#empToolBar"
						});
		$("#JJGrid3").datagrid({
			url : "${projectPath}/create/managerMoney/fund/getAllFund/1",
			fitColumns : true,
			singleSelect : true,
			pagination : true,
			toolbar : "#JJToolBar"
		});

		$("#recommendedButton1").click(function() {
			condition = "byJjgm";
			getFund();
			;

		});
		$("#recommendedButton2").click(function() {
			condition = "byDwzj";
			getFund();
		});
		$("#recommendedButton3").click(function() {
			condition = "byLjjz";
			getFund();

		});
		$("#recommendedButton4").click(function() {
			condition = "byTrend";
			getFund();

		});

		$('#tt').tabs({
			border : false,
			onSelect : function(title) {
				if (title == "优选") {
					getFund();
				}
			}
		});

		$('#JJSelect').searchbox({
			searcher : function(value) {
				$("#JJGrid3").datagrid({
					url : "${projectPath}/create/managerMoney/fund/ajaxSelect",
					queryParams : {
						"condition" : value
					},
					fitColumns : true,
					singleSelect : true,
					pagination : true,
					toolbar : "#JJToolBar"
				});
			},
			prompt : '基金查询'
		});

		$("#JJInfoBtn3").linkbutton(
						{
							iconCls : "icon-help",

							onClick : function() {
								//要先选中一条记录才能够回显基金详情

								var selectedRow = $("#JJGrid3").datagrid(
										"getSelected");
								if (selectedRow == null) {
									$.messager.alert("生财有道", "请先选择一条记录！",
											"warning");
									return;
								}
								var jjSymbol = selectedRow.jjSymbol;
								var jjName = selectedRow.jjName;
								$.ajax({
											url:"${projectPath}/create/managerMoney/fund/getFundInfo/"+ jjSymbol,
											beforsend:loadingIndex = layer.msg('数据处理中', {icon: 16}),
											success:function(msg) {
												layer.close(loadingIndex);
												if(msg=="获取数据信息出现网络异常"){
													layer.msg("获取数据出现网络异常", {time:1000, icon:5,shift:6});
												}else{
													$("#JJInfoWindow").window({
														closed : false,
														title : '基金详情：',
														modal : true,
														maximizable : false
													});
													var jsonStr = JSON.parse(msg);
													var fundInfo = jsonStr.result;
													var category;
													var operationMode = '还没有数据';
													if (fundInfo.category = 2) {
														category = '混合型';
													} else if (fundInfo.category = 3) {
														category = '债卷型';
													} else if (fundInfo.category = 1) {
														category = '股票型';
													} else {
														category = '未加载到数据';
													}
													$("#symbol").text(fundInfo.symbol);
													$("#jjName").text(jjName);
													$("#category").text(category);
													$("#operationMode").text(operationMode);
													$("#jjName").text(jjName);
													$("#managementCompany").text(fundInfo.managementCompany);
													$("#manager").text(fundInfo.manager);
													$("#investField").text(fundInfo.investField);
													$("#investTarget").text(fundInfo.investTarget);
													$("#feature").text(fundInfo.feature);
													$("#distribution").text(fundInfo.distribution);
													$("#custodian").text(fundInfo.custodian);
												}
											}, 
											
											dateType:"text",
											type:"post",
											error:function(){
												alert("请求数据失败");
											}
										});
							}

						});

		$("#JJRefreshBtn3").linkbutton({

			iconCls : "icon-reload",

			onClick : function() {
				$("#JJGrid3").datagrid("reload");
			}

		});
		$("#JJFormWindow").window({
			title : '申购基金',
			closed : true
		});
		$("#JJInfoWindow").window({
			title : '基金详情',
			closed : true
		});

		

		
	});
</script>
<style type="text/css">
h5 {
	color: blue;
}

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
}

.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
}
/*  #auto_div */
/*         { */
/*             display: none; */
/*             width: 300px; */
/*             border: 1px #74c0f9 solid; */
/*             background: #FFF; */
/*             position: absolute; */
/*             top: 24px; */
/*             left: 0; */
/*             color: #323232; */
/*         } */
#auto_div {
	display: block;
	color: #7b490b;
	background-color: #fcf9f2;
	width: 300px;
	height: 260px;
	line-height: 26px;
	padding-left: 5px;
	border: 1px solid #8d8f8e;
	position: absolute;
	top: 30px;
	left: 140px;
	background: #fff;
	z-index: 10000;
	overflow-y: auto;
}
</style>

</head>

<body>

	<div class="container">
		<%@include file="/public_page/page_head.jsp"%>
		<nav class="navbar navbar-default" role="navigation">
		<div class="container">
			<!-- Example row of columns -->
			<div class="row">
				<div class="col-md-3">
					<h3>我的基金</h3>
				</div>
				<div class="col-md-3">
					<h4>持仓成本（元）</h4>
					<h3 id="holdWarehouse">${holdWarehouse}</h3>
				</div>
				<div class="col-md-3">
					<h4>浮动收益（元）</h4>
					<h3 id="earning">${earning}</h3>
				</div>
				<div class="col-md-3">
					<h4></h4>
					<button id="BuyFundButton" class="btn btn-primary" type="submit">申购基金</button>
				</div>
			</div>
		</div>
		<br />

		<div id="tt" style="width: 100%; height: 900px" tabWidth=150
			tabHeight=40>
			<div title="持仓" style="padding: 10px">
				<div class="container">
					<div class="row clearfix">
						<blockquote
							style="border-left: 5px solid #f60; color: #f50; padding: 0 0 0 20px;">
							<b> 持有基金详情 </b>
						</blockquote>
						<div class="col-md-12 column">
							<div class="col-sm-11 col-md-11 column">
								<div id="main1" style="width: 800px; height: 400px;"></div>
								<div></div>
								<div class="table-responsive">
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div title="基金库" style="padding: 10px">
				<div id="JJToolBar3">
					<a id="JJBuyBtn3">购买基金</a> <a id="JJInfoBtn3">基金详情</a> <a
						id="JJRefreshBtn3">页面刷新</a> <input id="JJSelect"></input>
				</div>
				<table id="JJGrid3" style="width: 100%">
					<thead>
						<tr>
							<th data-options="field:'jjSymbol',width:100">代码</th>
							<th data-options="field:'jjName',width:100">名称</th>
							<th data-options="field:'jjDwzj',width:100">最新净值</th>
							<th data-options="field:'jjTrend',width:100">基金走势</th>
							<th data-options="field:'jjCompany',width:100">基金管理公司</th>
							<th data-options="field:'jjClrq',width:100">基金上市时间</th>
						</tr>
					</thead>
				</table>

				<div id="JJFormWindow" style="width: 800px">
					<div class="panel panel-default"
						style="border-style: dashed; background-color: #eceeef">
						<div class="panel-body">
							<div class="col-md-12 column">
								<form class="form-horizontal" id="buyJJForm"
									action="${projectPath }/create/managerMoney/fund/subscribe">
								
									
									<div class="form-group">
										<label class="col-sm-2 control-label">基金代码</label>
										<div class="col-sm-10">
											<input id="fundSymbol" name="fundSymbol" type="text"
												class="form-control" style="width: 200px;"
												placeholder="华夏混合（00001）">
										</div>
										<div id="auto_div"></div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">购买时间</label>
										<div class="col-sm-10">
											<!-- 											<input id="buyDate" name="buyDate" type="text" class="form-control" style="width: 200px;" -->
											<!-- 												placeholder="2017_7_17"> -->
											<input id="buyDate" name="buyDate" type="text" id="d241"
												placeholder="选择时间"
												onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
												class="form-control" style="width: 200px; height: 30px;" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">当日净值</label>
										<div class="col-sm-10">
											<input id="fundDwzj" name="fundDwzj" type="text"
												class="form-control" style="width: 200px;"
												placeholder="填写净值信息">
										</div>
										<label id="fundDwzjmsg" style="color: red"></label>
									</div>
									<input id="sbfundId" name="sbfundId" type="hidden"
												class="form-control" style="width: 200px;"
												value="0"
												placeholder="sufundId"/>
									<div class="form-group">
										<label class="col-sm-2 control-label">费率%</label>
										<div class="col-sm-10">
											<input id="fundRate" name="fundRate" type="text"
												class="form-control" style="width: 200px;"
												placeholder="填写申购时的费率">
												<label id="fundRatemsg" style="color: red"></label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">申购金额</label>
										<div class="col-sm-10">
											<input id="buyCost" name="buyCost" type="text"
												class="form-control" style="width: 200px;"
												placeholder="填写申购金额">
												<label id="buyCostmsg" style="color: red"></label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">购买份额</label>
										<div class="col-sm-10">
											<input id="holdShare" name="holdShare" class="form-control"
												type="text" style="width: 200px;" placeholder="填写购买份额"></input>
												<label id="holdShare"  style="color: red"></label>
										</div>
									</div>
									
										<div class="form-group">
												<label class="col-sm-2 control-label">金融账户</label>
											<div class="btn-group col-sm-10">
											  <button type="button" id="bankAccountSpan" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											   		 选择金融账户 <span class="caret"></span>
											  </button>
											  <ul class="dropdown-menu">
											  
											  <c:forEach items="${bunkaccounts }" var="bankaccount"> 
											  		<li class="bankAccount"  id=${bankaccount.childaccId}><a href="JavaScript:void(0)">${bankaccount.childaccName}</a></li>
											  </c:forEach>
											    <li role="separator" class="divider"></li>
											    <li><a href="${projectPath }/create/managerMoney/account/toUI">去添加新账户</a></li>
											  </ul>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">投资账户</label>
										<div class="btn-group col-sm-10">
										  <button type="button" id="fundAccountSpan" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										   		 选择投资账户 <span class="caret"></span>
										  </button>
										  <ul class="dropdown-menu">
										 
										    	<c:forEach items="${fundaccounts }" var="fundaccount"> 
											  		<li class="fundAccount" id=${fundaccount.childaccId}><a href="JavaScript:void(0)">${fundaccount.childaccName}</a></li>
											  </c:forEach>
										    <li role="separator" class="divider"></li>
										    <li><a href="${projectPath }/create/managerMoney/account/toUI">去添加新账户</a></li>
										  </ul>
										</div>
									</div>
						
													
									
									
									<div class="form-group">
										<label class="col-sm-2 control-label">备注信息</label>
										<div class="col-sm-10">
											<input id="buyFundInfo" name="buyFundInfo" class="form-control" type="text"
												style="width: 400px;" placeholder="填写备注信息"></input>
										</div>
									</div>
									
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"></label>
										<div class="col-sm-10">
											<button id="fundsubmit" type="button" class="btn btn-primary">提交</button>
										</div>
									</div>
									
								</form>
							</div>
						</div>
					</div>
				</div>



				<div id="JJInfoWindow" style="width: 800px; height: 500px">
					<ol type="none">

						<li><h5>基金代码</h5></li>
						<li><div id="symbol">&nbsp;</div></li>
						<li><h5>基金名称</h5></li>
						<li><div id="jjName">&nbsp;</div></li>
						<li><h5>基金管理人</h5></li>
						<li><div id="managementCompany">&nbsp;</div></li>
						<li><h5>基金类型</h5></li>
						<li><div id="category"></div>&nbsp;</li>
						<li><h5>运作方式</h5></li>
						<li><div id="operationMode"></div>&nbsp;</li>
						<li><h5>基金托管人</h5></li>
						<li><div id="custodian">&nbsp;</div></li>
						<li><h5>基金经理</h5></li>
						<li><div id="manager">&nbsp;</div></li>
						<li><h5>投资范围</h5></li>
						<li><div id="investField">&nbsp;</div></li>
						<li><h5>风险收益特征</h5></li>
						<li><div id="feature">&nbsp;</div></li>
						<li><h5>投资目标</h5></li>
						<li><div id="investTarget">&nbsp;</div></li>
						<li><h5>收益分配原则</h5></li>
						<li><div id="distribution">&nbsp;</div></li>
					</ol>
				</div>
			</div>

			<div title="优选" style="padding: 10px">

				<div class="container">
					<div class="row clearfix">
						<blockquote
							style="border-left: 5px solid #f60; color: #f50; padding: 0 0 0 20px;">
							<b> 优选基金推荐 </b>
						</blockquote>
						<button id="recommendedButton1" class="btn btn-default"
							type="submit">基金规模排行推荐</button>
						<button id="recommendedButton2" class="btn btn-default"
							type="submit">最新净值排行推荐</button>
						<button id="recommendedButton3" class="btn btn-default"
							type="submit">累积净值排行推荐</button>
						<button id="recommendedButton4" class="btn btn-default"
							type="submit">增长趋势排行推荐</button>
						<br /> <br /> <br />
						<c:forEach begin="0" end="2" step="1" varStatus="status">
							<div>
								<div class="col-sm-4 col-md-4 column">
									<div class="caption">

										<h3 id="prime1_${status.index}">华夏成长混合(000001)"</h3>
										<p id="prime2_${status.index}">基金类型：混合型</p>
										<p id="prime3_${status.index}">净值增长：+1.12%</p>
										<p id="prime4_${status.index}">累积净值：5.13</p>
										<p id="prime5_${status.index}">基金规模：21(亿元)</p>
									</div>
								</div>
								<div class="col-sm-5 col-md-5 column">
									<div id="main_${status.index}"
										style="width: 420px; height: 200px;"></div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				
			</div>
		</div>
		</nav>
	</div>
</body>
<script type="text/javascript">



var getEarning = function(result) {
	var myChart = echarts.init(document.getElementById('main1'));
	// 指定图表的配置项和数据
	option = {
		title : {
			text : '基金总体收益变化'
		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ '基金收益', '基金购买' ]
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
			data : result.times
		},
		yAxis : {
			type : 'value',
			axisLabel : {
				formatter : '{value} '
			}
		},
		series : [ {
			name : '基金收益',
			type : 'line',
			data : result.earnings,
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
			name : '基金购买',
			type : 'line',
			data : result.buyCosts,
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
		} ]

	};
	myChart.setOption(option);
};

var getFundEarning=function(){
$.ajax({
		url:"${projectPath}/create/managerMoney/fund/getFundEarning",
		beforeSend : function() {
			loadingIndex = layer.msg('数据更新中', {icon: 16});
		},
		success:function(result) {
			
			getEarning(result);
			layer.close(loadingIndex);
			$("#holdWarehouse").text(result.holdWarehouse.toFixed(2));
			$("#earning").text(result.earning.toFixed(2));
		}
	});
};
		
getFundEarning();		
function getSubscriptionFundForForm(pageno) {
	$.ajax({
				url : "${projectPath}/create/managerMoney/fund/getSubscriptionFundForForm/"+pageno,
				success : function(result) {
					var pageInfo=result.pageInfo;
					
					var context="";
					var pageContent = "";
					if(pageInfo.total==0){
						$(".table-responsive").html('<h3 align="center">亲，当前没有任何已申购的基金信息哦！</h3>');
					}else{
						$(".table-responsive").html(
							'<table class="table  table-bordered">                      '
							+'	<thead>                                                 '
							+'		<tr>                                                '
							+'			<th width="30">#</th>                           '
							+'			<th>基金名称</th>                               '
							+'			<th>购入成本（元）</th>                         '
							+'			<th>持有份额</th>                               '
							+'			<th>持仓成本（元）</th>                         '
							+'			<th>浮动收益（元）</th>                         '
							+'			<th>购入时间</th>                               '
							+'			<th width="100">操作</th>                       '
							+'		</tr>                                               '
							+'	</thead>                                                '
							+'	<tbody id="SubscriptionFunds">                          '
							+'		                                                    '
							+'	</tbody>                                                '
							+'	<tfoot>                                                 '
							+'		 <tr >                                              '
							+'			<td colspan="8" align="center">                 '
							+'				<ul class="pagination" id="pagination"></ul>'
							+'			</td>                                           '
							+'			</tr>                                           '
							+'	</tfoot>                                                '
							+'</table>	                                                '
				);
					$.each(pageInfo.list,function(i,SubscriptionFunds){
						context+='                                                       ';
						context+='<tr>                                                   ';
						context+='<td>'+(i+1)+'</td>                                           ';
						
						context+='<td>'+SubscriptionFunds.fundSymbol+'</td>              ';
						context+='<td>'+SubscriptionFunds.buyCost+'</td>              ';
						context+='<td>'+SubscriptionFunds.holdShare.toFixed(2)+'</td>              ';
						context+='<td>'+(SubscriptionFunds.fundDwzj*SubscriptionFunds.holdShare).toFixed(2)+'</td>              ';
						context+='<td>'+(SubscriptionFunds.fundDwzj*SubscriptionFunds.holdShare-SubscriptionFunds.buyCost).toFixed(2)+'</td>              ';
						context+='<td>'+SubscriptionFunds.buyDate+'</td>              ';
						context+='<td>                                                   ';
						
						context+='	<button type="button" class="btn btn-success btn-xs" onclick="updateSubscriptionFund('+SubscriptionFunds.sbfundId+','+pageno+')">';
						context+='		<i class="glyphicon glyphicon-pencil"  ></i>       ';
						context+='	</button>                                            ';
						context+='	<button type="button" class="btn btn-success btn-xs" onclick="deleteSubscriptionFund('+SubscriptionFunds.sbfundId+','+pageno+')" >';
						context+='		<i class="glyphicon glyphicon-remove"  ></i>   ';
						context+='	</button>                                            ';
						context+='</td>                                                  ';
						context+='</tr>                                                  ';
						});
					
					
                    
					pageContent+='<li><a  onclick="getSubscriptionFundForForm(1)">首页</a></li>';
					if(pageInfo.hasPreviousPage){
						pageContent+='	<li><a  onclick="getSubscriptionFundForForm('+pageInfo.prePage+')">上一页</a></li>       ';
					}
				
// 					$.each(pageInfo.navigatepageNums,function(i,navigatepageNum){ 
// 						pageContent+='	<li                                                                                   ';
// 						pageContent+='		<c:if test="'+(navigatepageNum == pageInfo.pageNum)+'"> class="active" </c:if>>              ';
// 						pageContent+='		<a  onclick="getSubscriptionFundForForm('+navigatepageNum+')">'+navigatepageNum+'<span class="sr-only">(current)</span></a>      ';
// 						pageContent+='	</li>                                                                                 ';
// 					});
					$.each(pageInfo.navigatepageNums,function(i,navigatepageNum){
						if(navigatepageNum==pageInfo.pageNum){
							pageContent+='<li class="active"><a href="javascript:void(0);" onclick="getSubscriptionFundForForm('+navigatepageNum+')">'+navigatepageNum+'<span class="sr-only">(current)</span></a></li>';
						}else{
							pageContent+='<li><a href="javascript:void(0);" onclick="getSubscriptionFundForForm('+navigatepageNum+')">'+navigatepageNum+'</a></li>';
						}
					});
					if(pageInfo.hasNextPage){
						pageContent+='	<li><a  onclick="getSubscriptionFundForForm('+pageInfo.nextPage+')">下一页</a></li>      ';
					}
					pageContent+='<li><a  onclick="getSubscriptionFundForForm('+pageInfo.total+')">末页</a></li>          ';
					pageContent+='<li>                                                                                    ';
					pageContent+='	<input type="text" id="jumperBlock"                                                   ';
					pageContent+='	class="form-control"  onchange="jumperBlock()"                                                       ';
					pageContent+='	style="width: 120px; display: inline; margin-left: 10px;" placeholder="输入页面跳转"/>';
					pageContent+='</li>                                                                                   ';
					}
					
    				$("#pagination").html(pageContent);
					$("#SubscriptionFunds").html(context);
					
					
				},
				type : "post",
				dataType : "json"
			});
};

getSubscriptionFundForForm(1);
tppagenumber=0;
function jumperBlock(tppagenumber){
	//1.获取当前文本框中的数据
	if(tppagenumber!=0){
		getSubscriptionFundForForm(tppagenumber);
		tppagenumber=0;
	}
	var pageNum=$("#jumperBlock").val();
	//$(this).val()对
	//$(this).value错误jQuery对象.DOM属性
	//this.val()错误DOM对象.jQuery方法
	
	//2.去除前后空格
	pageNum = $.trim(pageNum);
	
	//3.检查pageNum是否为有效的数字
	//NaN：not a number
	//window.isNaN(pageNum);
	//空字符串也需要进行验证，因为它会被当做0处理
	if(pageNum == "" || isNaN(pageNum)) {
		
		//将文本框恢复为最初状态
		this.value = "";//this.defaultValue
		
		//如果数据不合法，则将程序停止执行
		return ;
	}
	getSubscriptionFundForForm(pageNum);
};


function deleteSubscriptionFund(sbfundid,pageno){   
	$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
	    if (r){    
	    	$.post(
	    			"${projectPath}/create/managerMoney/subscriptionfund/delete/"+sbfundid,
	    			function(msg){
	    				if(msg=='success'){
	    					alert("删除成功");
	    					getSubscriptionFundForForm(pageno);
	    					//jumperBlock(pageno);
	    					getFundEarning();
	    					
	    				}else{
	    					alert("删除失败");
	    				}
	    			},
	    			"text"
	    	);    
	    }    
	}); 

};

//表单的js代码
var test_list;


function formwindow(msg) {
	$("#auto_div").hide();
	$.post(
			"${projectPath}/create/managerMoney/fund/getAllFundForBuy",
			function(result) {
				test_list = result.value;
			}
		);
	//显示包含表单的window控件
	$("#JJFormWindow").window({
		closed : false,
		title : msg,
		modal : true,
		maximizable : false
	});
	
	$("#JJForm").form({

	});
};
function clear(){
	$("#buyCost").val("");
	$("#fundRate").val("");
	$("#fundDwzj").val("");
	$("#fundSymbol").val("");
	$("#buyFundInfo").val("");
	$("#buyDate").val("");
	$("#holdShare").val("");
	$("#fundAccountSpan").text("选择基金账户");
	$("#bankAccountSpan").text("选择金融账户");
	$("#sbfundId").val(0);
}

function updateSubscriptionFund(fundId,pageno){
	tppagenumber=pageno;
	formwindow("修改申购基金的信息");
	//获取基金信息，回显
	$.post(
		"${projectPath}/create/managerMoney/subscriptionfund/getsubscriptionfund/"+fundId,
		function(msg){
			if(msg.error=="error"){
				alert("数据信息获取失败");
			}else{
				$("#buyCost").val(msg.subscriptionFunds.buyCost);
				$("#fundRate").val(msg.subscriptionFunds.fundRate);
				$("#fundDwzj").val(msg.subscriptionFunds.fundDwzj);
				$("#fundSymbol").val(msg.subscriptionFunds.fundSymbol);
				$("#buyFundInfo").val(msg.subscriptionFunds.buyFundInfo);
				$("#buyDate").val(msg.subscriptionFunds.buyDate);
				$("#holdShare").val(msg.subscriptionFunds.holdShare);
				$("#bankAccount").val(msg.subscriptionFunds.bankAccount);
				$("#fundAccount").val(msg.subscriptionFunds.fundAccount);
				$("#sbfundId").val(msg.subscriptionFunds.sbfundId);
			}
			
		}
	);
};

$("#BuyFundButton").click(function() {
	clear();
	$("#JJBuyBtn3").click();
});
$("#JJBuyBtn3").linkbutton(
				{
					iconCls : "icon-add",

					onClick : function(){
						formwindow("填写申购基金详情");
					}
					
				});

var old_value = "";
var highlightindex = -1; //高亮

//自动完成
function AutoComplete(auto, search, mylist) {

	if ($("#" + search).val() != old_value || old_value == "") {
		var autoNode = $("#" + auto); //缓存对象（弹出框）
		var carlist = new Array();
		var n = 0;
		old_value = $("#" + search).val();

		for (i in mylist) {
			if (mylist[i].indexOf(old_value) >= 0) {
				carlist[n++] = mylist[i];
			}
		}
		if (carlist.length == 0) {
			autoNode.hide();
			return;
		}
		autoNode.empty(); //清空上次的记录
		for (i in carlist) {
			var wordNode = carlist[i]; //弹出框里的每一条内容

			var newDivNode = $("<div>").attr("id", i); //设置每个节点的id值
			newDivNode
					.attr("style",
							"font:14px/25px arial;height:25px;padding:0 8px;cursor: pointer;");

			newDivNode.html(wordNode).appendTo(autoNode); //追加到弹出框

			//鼠标移入高亮，移开不高亮
			newDivNode.mouseover(function() {
				if (highlightindex != -1) { //原来高亮的节点要取消高亮（是-1就不需要了）
					autoNode.children("div").eq(highlightindex).css(
							"background-color", "white");
				}
				//记录新的高亮节点索引
				highlightindex = $(this).attr("id");
				$(this).css("background-color", "#ebebeb");
			});
			newDivNode.mouseout(function() {
				$(this).css("background-color", "white");
			});

			//鼠标点击文字上屏
			newDivNode.click(function() {
				//取出高亮节点的文本内容
				var comText = autoNode.hide().children("div").eq(
						highlightindex).text();
				highlightindex = -1;
				//文本框中的内容变成高亮节点的内容
				$("#" + search).val(comText);
			});
			if (carlist.length > 0) { //如果返回值有内容就显示出来
				autoNode.show();
			} else { //服务器端无内容返回 那么隐藏弹出框
				autoNode.hide();
				//弹出框隐藏的同时，高亮节点索引值也变成-1
				highlightindex = -1;
			}
		}
	}

	//点击页面隐藏自动补全提示框
	document.onclick = function(e) {
		var e = e ? e : window.event;
		var tar = e.srcElement || e.target;
		if (tar.id != search) {
			if ($("#" + auto).is(":visible")) {
				$("#" + auto).css("display", "none")
			}
		}
	};

}

$(function() {
	old_value = $("#fundSymbol").val();

	$("#fundSymbol").focus(function() {
		if ($("#fundSymbol").val() == "") {

			AutoComplete("auto_div", "fundSymbol", test_list);
		}
	});

	$("#fundSymbol").keyup(function() {
		AutoComplete("auto_div", "fundSymbol", test_list);
	});

	$("#fundDwzj").focus(
			function() {
				var fundSymbol = $("#fundSymbol").val();
				var buyDate = $("#buyDate").val();
				$.post(
						"${projectPath}/create/managerMoney/fund/getJjjz/"
								+ fundSymbol + "/" + buyDate, function(
								result) {
							$("#fundDwzj").val(result.jjjz.toFixed(4));
						});
			});

	var changeHoldShare = function() {
		var buyCost = $("#buyCost").val();
		var fundRate = $("#fundRate").val();
		var fundDwzj = $("#fundDwzj").val();
		var holdShare = buyCost * (1 - fundRate / 100) / fundDwzj;
		if (!isNaN(holdShare)) {
			$("#holdShare").val(holdShare.toFixed(2));
		} else {
			$("#holdShare").val(0);
		}
	};

	$("#fundRate").change(function() {
		changeHoldShare();
	});
	$("#buyCost").change(function() {
		changeHoldShare();
	});
	$("#fundDwzj").change(function() {
		changeHoldShare();
	});
	var bankAccountId;
	$(".bankAccount").click(function(){
		$("#bankAccountSpan").text($(this).text());
		bankAccountId=$(this).attr("id");
	});
	var fundAccountId;
	$(".fundAccount").click(function(){
		$("#fundAccountSpan").text($(this).text());
		fundAccountId=$(this).attr("id");
	});
	//利用ajax提交表单，清空数据
	$("#fundsubmit").click(function(){
		layer.confirm("确认提交数据, 是否继续？",  {icon: 3, title:'提示'},
				function(cindex) {			
					$.ajax({
								url : "${projectPath }/create/managerMoney/fund/subscribe",
								beforeSend : function() {
			            			loadingIndex = layer.msg('数据处理中', {icon: 16});
			            		},
								success : function(result) {
									if (result.value == "success") {
										layer.close(loadingIndex);
										clear();
										$.post(
											"${projectPath}/create/managerMoney/fund/getFundEarning",
											function(result) {
													getEarning(result);
													//改变页面数据
													if(tppagenumber==0){
														tppagenumber=1;
													}
													jumperBlock(tppagenumber);
													getFundEarning();
											});
										//隐藏窗口，清理数据
										$("#JJFormWindow").window('close');
										layer.msg("数据处理成功", {time:1000, icon:6},function(){
										
										});
									} else {
										layer.msg("数据处理失败，请检查数据格式后请重新提交", {time:1000, icon:5, shift:6});
									}
								},
								type : "post",
								datatype : "text",
								data : {
									buyCost : $("#buyCost").val(),
									fundRate : $("#fundRate").val(),
									fundDwzj : $("#fundDwzj").val(),
									fundSymbol : $("#fundSymbol").val(),
									buyFundInfo : $("#buyFundInfo").val(),
									buyDate : $("#buyDate").val(),
									holdShare : $("#holdShare").val(),
									sbfundId:$("#sbfundId").val(),
											
									bankAccount :bankAccountId,
									fundAccount : fundAccountId
								}
							});
					layer.close(cindex);
				},
				function(cindex){
					layer.close(cindex);
				})
	});
});
</script>
</html>