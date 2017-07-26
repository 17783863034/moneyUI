<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript" src="${projectPath }/bootstrap/jquery-1.10.1.js"></script>
<script type="text/javascript" src="${projectPath }/js/bootstrap.js"></script>
<script type="text/javascript" src="${projectPath }/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet" href="${projectPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${projectPath}/css/bootstrap-theme.css">
<link type="text/css" rel="stylesheet" href="${projectPath}/css/my.css">

<script type="text/javascript">
	$(function() {
		var store = 1;
		var submitid = 1;
		var accAccountId = 1;
		//支出种类部分
		$(".chickTwoType").click(function() {
			var showType = this.innerHTML;
			$(".typeShow").html(showType);
			submitid = $(this).attr("id");
		});
		//支出账户部分
		$(".clickAccount").click(function() {
			var showType = this.innerHTML;
			accAccountId = $(this).attr("id");
			$(".accountShow").html(showType);
		});
		
		//收入种类部分
		$(".chickTwoType1").click(function() {
			var showType = this.innerHTML;
			$(".IncometypeShow").html(showType);
			
			submitid = $(this).attr("id");
		});
		//收入账户部分
		$(".InconeclickAccount").click(function() {
			
			IncomeAccountId = $(this).attr("id");
			var showType = this.innerHTML;
			$(".IncomeAccountShow").html(showType);
			submitid = $(this).attr("id");
		});
		
		//点击选择账户
		$(".chooseAccount").click(function() {
			var account = this.innerHTML;
			var showType = $(".choosetypeShow").html();
			var start_time =  $(".startTime").val();
			var last_time =  $(".lastTime").val();
			if(start_time > last_time){
				alert("后面的时间要大于前面的时间");
				return;
			}
			if (start_time == null || start_time == undefined || start_time == '') { 
				start_time = "start_time";
				last_time = "last_time";
			} 
			if (last_time == null || last_time == undefined || last_time == '') { 
				start_time = "start_time";
				last_time = "last_time";
			} 

			var url = "${projectPath}/create/managerMoney/checkAccount/selectCheckLog/${sessionScope.user.userId}/"+showType 
			+ "/" + account + "/" + start_time + "/" + last_time;
			window.location.href = url;
		});
		//点击选择时间
		$(".timeSubmit").click(function() {
			var showType = $(".choosetypeShow").html();
			var account = $(".chooseaccountShow").html();
			var start_time =  $(".startTime").val();
			var last_time =  $(".lastTime").val();
			if(start_time > last_time){
				alert("后面的时间要大于前面的时间");
				return;
			}
			if (start_time == null || start_time == undefined || start_time == '') { 
				start_time = "start_time";
			} 
			if (last_time == null || last_time == undefined || last_time == '') { 
				last_time = "last_time";
			} 
			
			var url = "${projectPath}/create/managerMoney/checkAccount/selectCheckLog/${sessionScope.user.userId}/"+showType 
			+ "/" + account + "/" + start_time + "/" + last_time;
			window.location.href = url;
		});
		//点击选择分类
		$(".choosetypeClass").click(function() {
			var showType = this.innerHTML;
			$(".choosetypeShow").html(showType);
			var account = $(".chooseaccountShow").html();
			var start_time =  $(".startTime").val();
			var last_time =  $(".lastTime").val();
			if(start_time > last_time){
				alert("后面的时间要大于前面的时间");
				return;
			}
			if (start_time == null || start_time == undefined || start_time == '') { 
				start_time = "start_time";
			} 
			if (last_time == null || last_time == undefined || last_time == '') { 
				last_time = "last_time";
			} 

			var url = "${projectPath}/create/managerMoney/checkAccount/selectCheckLog/${sessionScope.user.userId}/"+showType 
			+ "/" + account + "/" + start_time + "/" + last_time;
			alert(url);
			window.location.href = url;

		});

		$(".modelchickTwoType").click(function() {
			var showType = this.innerHTML;
			var first_type_id = this.getAttribute("id");
			$(".modeltypeShow").html(showType);
			store = first_type_id;

		});
		$(".modelchickTwoType1").click(function() {
			var showType = this.innerHTML;
			var first_type_id = this.getAttribute("id");
			$(".modeltypeShow1").html(showType);
			store = first_type_id;

		});
		//全部btn
		$(".allSelect").click(function(){
			$.ajax({
				type : "POST",
				url : "${projectPath}/create/managerMoney/checkAccount/allSelect",
				data : {
					userId : "${sessionScope.user.userId}"
				},
				dataType : "json",
				success : function(msg) {
					var url = "${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkTime/1/1";
					window.location.href = url;
				},
				error : function() {
					alert("查询错误！");
				}
			});
		});
		//搜索关键字button
		$(".sunmitClass").click(function(){
			var findMsg = $(".conditionclass").val();
			var url = "${projectPath}/create/managerMoney/checkAccount/selectByKey/${sessionScope.user.userId}/"+findMsg;
			window.location.href = url;
		});
		
		
		//提交支出一级分类
		$(".pay_firstType_button").click(function() {
			var pay_firstType_input_value = $(".pay_firstType_input").val();
			$.ajax({
				type : "POST",
				url : "${projectPath}/create/managerMoney/checkAccount/addPayFirstType",
				data : {
					payFirstName : pay_firstType_input_value,
					userId : "${sessionScope.user.userId}"
				},
				dataType : "json",
				success : function(msg) {
					alert(msg.result);
					$("#myModal").modal('hide');
					var url = "${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkTime/1/1";
					window.location.href = url;
				},
				error : function() {
					alert("添加错误！");
				}
			});

		});
		//提交支出二级分类
		$(".pay_secondType_button").click(function() {
			var name = $(".pay_secondType_input").val();
			$.ajax({
				type : "POST",
				url : "${projectPath}/create/managerMoney/checkAccount/addPaySecondType",
				data : {
 					payFirstId : store,
					paySecondName : name
				},
				dataType : "json",
				success : function(msg) {
					alert(msg.result);
					$("#myModal").modal('hide');
					var url = "${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkTime/1/1";
					window.location.href = url;
				},
				error : function() {
					alert("添加错误！");
				}
			});
		});
		//提交收入一级分类
		$(".income_firstType_button").click(function() {
			var income_firstType_input_value = $(".income_firstType_input").val();
			$.ajax({
				type : "POST",
				url : "${projectPath}/create/managerMoney/checkAccount/addIncomeFirstType",
				data : {
					incomeFirstName : income_firstType_input_value,
					userId : "${sessionScope.user.userId}"
				},
				dataType : "json",
				success : function(msg) {
					alert(msg.result);
					$("#myModal1").modal('hide');
					var url = "${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkTime/1/1";
					window.location.href = url;
				},
				error : function() {
					alert("添加错误！");
				}
			});

			});
		//提交支出二级分类
		$(".income_secondType_button").click(function() {

			var name = $(".income_secondType_input").val();
			$.ajax({
				type : "POST",
				url : "${projectPath}/create/managerMoney/checkAccount/addIncomeSecondType",
				data : {
					incomeFirstId : store,
					incomeSecondName : name
				},
				dataType : "json",
				success : function(msg) {
					alert(msg.result);
					$("#myModal1").modal('hide');
					var url = "${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkTime/1/1";
					window.location.href = url;
				},
				error : function() {
					alert("添加错误！");
				}
			});

		});
		//提交支出全部消息
		$(".savealldata").click(function(){
			
			var checkInOrNot=false;
			var typeValue = $(".typeShow").html();
			var accountValue = $(".accountShow").html();
			var account_typeValue = submitid;
			var amountValue = $(".submitMoney").val();
			var timeValue = $(".submitTime").val();
			var messageValue = $(".submitMessage").val();
			var userIdValue = "${sessionScope.user.userId}";
			$.ajax({
                type:"POST",        
                url:"${projectPath}/create/managerMoney/checkAccount/savePayResult",
                data:{
                	accountType:account_typeValue,
                	type:typeValue,
                	account:accountValue,
                	amount:amountValue,
                	time:timeValue,
                	message:messageValue,
                	userid:userIdValue,
                	checkInOrNot:checkInOrNot,
                	totalOutput:"${requestScope.ioDetail.totalOutput}",
        		 	totalInput:"${requestScope.ioDetail.totalInput}",
        			lastMoney:"${requestScope.ioDetail.lastMoney}",
        			childaccId:accAccountId
                },
                dataType:"json",
                success:function(msg){
                     alert(msg.result);
                     var url = "${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkTime/1/1";
                     window.location.href = url;
                },
                error:function(){
                     alert("添加错误！");
                }
           });
		});
		//提交收入全部消息
		$(".savealldata1").click(function(){
			var checkType = $(".chickTwoType1").html();
			var checkInOrNot=true;
			var typeValue = $(".IncometypeShow").html();
			var accountValue = $(".IncomeAccountShow").html();
			var account_typeValue = submitid;
			var amountValue = $(".submitMoney1").val();
			var timeValue = $(".submitTime1").val();
			var messageValue = $(".submitMessage1").val();
			var userIdValue = "${sessionScope.user.userId}";
			$.ajax({
                type:"POST",        
                url:"${projectPath}/create/managerMoney/checkAccount/savePayResult",
                data:{
                	accountType:account_typeValue,
                	type:typeValue,
                	account:accountValue,
                	amount:amountValue,
                	time:timeValue,
                	message:messageValue,
                	userid:userIdValue,
                	checkInOrNot:checkInOrNot,
                	totalOutput:"${requestScope.ioDetail.totalOutput}",
        		 	totalInput:"${requestScope.ioDetail.totalInput}",
        			lastMoney:"${requestScope.ioDetail.lastMoney}",
        			childaccId:IncomeAccountId
                },
                dataType:"json",
                success:function(msg){
                     var url = "${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkTime/1/1";
                     window.location.href = url;
                },
                error:function(){
                     alert("添加错误！");
                }
           });

		});
		//转账部分	
		var transferOut = 1;
		var transferIn = 1;
		var exchangeShowType1="余额宝";
		var exchangeShowType2="余额宝";
		$(".exchange_clickAccount1").click(function(){
			exchangeShowType1 = this.innerHTML;
			transferOut = $(this).attr("id");
			$(".exchange_accountShow1").html(exchangeShowType1);

		});
		$(".exchange_clickAccount2").click(function() {
			exchangeShowType2 = this.innerHTML;
			$(".exchange_accountShow2").html(exchangeShowType2);
			transferIn = $(this).attr("id");
		});
		$(".exchange_savealldata").click(function(){
			var amountValue = $(".exchange_amount").val();
			var timeValue = $(".exchange_time").val();
			var messageValue = $(".exchange_msg").val();
			var userIdValue = "${sessionScope.user.userId}";
			if (exchangeShowType1 == exchangeShowType2) {
				alert("相同账户不能转账！");
				
			}else{

				$.ajax({
	                type:"POST",        
	                url:"${projectPath}/create/managerMoney/checkAccount/saveTransferResult",
	                data:{
	                	
	                	type:exchangeShowType1,
	                	account:exchangeShowType2,
	                	amount:amountValue,
	                	time:timeValue,
	                	message:messageValue,
	                	userid:userIdValue,
	                	accountOut:transferOut,
	                	accountIn:transferIn
	                },
	                dataType:"json",
	                success:function(msg){
	                     var url = "${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkTime/1/1";
	                     window.location.href = url;
	                },
	                error:function(){
	                     alert("添加错误！");
	                }
	           });
			}

		});
		//按照不同属性排序
// 		$("#ordera01").click(function(){
// 			var classValue = $("#orderli01").attr("class");
// 			if(classValue=="dropup"){
// 				$("#orderli01").attr("class","dropdown");
// 				var url = "${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkType/1/1?classs=dropdown";
// 				window.location.href = url;
// 			}
// 			if(classValue=="dropdown"){
// 				$("#orderli01").attr("class","dropup");
// 				var url = "${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkType/0/1?classs=dropup";
// 				window.location.href = url;
// 			}
// 		})
	});
</script>
</head>
<body>
	<div class="container">
		<br /> <br /> <br />
		<%@ include file="/public_page/page_head.jsp"%>

		<div class="bs-example bs-example-tabs"
			data-example-id="togglable-tabs">
			<ul id="myTabs" class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#pay"
					id="pay-tab" role="tab" data-toggle="tab" aria-controls="pay"
					aria-expanded="true">支出</a></li>
				<li role="presentation"><a href="#income" role="tab"
					id="income-tab" data-toggle="tab" aria-controls="income">收入</a></li>
				<li role="presentation"><a href="#transfer" role="tab"
					id="transfer-tab" data-toggle="tab" aria-controls="transfer">转账</a></li>

			</ul>
			
			<div id="myTabContent" class="tab-content">
				<div role="tabpanel" class="tab-pane fade in active" id="pay"
					aria-labelledBy="pay-tab">
					<div class="bs-example bs-example-images"
						data-example-id="image-shapes">
						<img src="${projectPath }/src/2.jpg" class="img-circle imgClass"
							alt="">
						<div class="dropdown TYPEclass">
							分类 &nbsp&nbsp<a id="dLabel" role="button" style="width: 100px;"
								data-toggle="dropdown" class="btn btn-default" data-target="#"
								href="javascript:;"> <span class="typeShow">房租</span> <span
								class="caret"></span>
							</a>
							<ul class="dropdown-menu multi-level" role="menu"
								aria-labelledby="dropdownMenu">
								<c:forEach items="${allPayFirstType }" var="payFirsyType">
									<li class="dropdown-submenu"><a tabindex="-1"
										disabled=true href="JavaScript:void(0)">${payFirsyType.payFirstName }</a>
										<ul class="dropdown-menu">
											<c:forEach items="${allPaySecondType }" var="paySecondType">  
  												<c:if test="${payFirsyType.payFirstId == paySecondType.payFirstId }"> 
  													<li><a id="${payFirsyType.payFirstId}" class="chickTwoType" tabindex="-1" href="javascript:;">${paySecondType.paySecondName }</a></li>  
  												</c:if> 
											</c:forEach> 
											<li><a tabindex="-1" data-toggle="modal"
												data-target="#myModalTwo">新建二级分类</a></li>
										</ul></li>
								</c:forEach>

								<li class="dropdown-submenu"><a tabindex="-1"
									data-toggle="modal" data-target="#myModal">新建一级分类</a></li>
							</ul>
						</div>



						<div class="dropdown Accountclass">
							账户 &nbsp&nbsp<a id="dLabel" role="button" style="width: 100px;"
								data-toggle="dropdown" class="btn btn-default" data-target="#"
								href="javascript:;"> <span class="accountShow">现金</span> <span
								class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu">
								<c:forEach items="${allChildAcc }" var="allChildAcc"> 
									<li class="dropdown-submenu">
									<a class="clickAccount" id="${allChildAcc.childaccId }" href="JavaScript:void(0)">${allChildAcc.childaccName }</a></li>
								</c:forEach>
							</ul>
						</div>

						<div class="Moneyclass">
							金额&nbsp&nbsp<input class="submitMoney" type="text"
								style="width: 150px; height: 34px;" />
						</div>
						<div class="Timeclass">
							时间&nbsp&nbsp<input class="submitTime" type="text" id="d241"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								class="Wdate" style="width: 150px; height: 30px;" />
						</div>
						<div class="Messageclass">
							备注&nbsp&nbsp<input type="text" class="submitMessage"
								style="width: 500px; height: 34px;" />
						</div>
						<div class="buttonclass">
							<button style="width: 160px; height: 34px;"
								class="btn btn-primary savealldata">保存</button>
						</div>



					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="income"
					aria-labelledBy="income-tab">
					<div class="bs-example bs-example-images"
						data-example-id="image-shapes">
						<!-- 收入部分 -->
						<img src="${projectPath }/src/2.jpg" class="img-circle imgClass"
							alt="">
						<div class="dropdown TYPEclass">
							分类 &nbsp&nbsp
							<a id="dLabel" role="button" style="width: 100px;"
								data-toggle="dropdown" class="btn btn-default" data-target="#" href="javascript:;"> 
								<span class="IncometypeShow">搬砖</span> <spanclass="caret"></span>
							</a>
							<ul class="dropdown-menu multi-level" role="menu"
								aria-labelledby="dropdownMenu">
								<c:forEach items="${allIncomeFirstType }"
									var="allIncomeFirstType">
									<li class="dropdown-submenu"><a tabindex="-1"
										disabled=true href="JavaScript:void(0)">${allIncomeFirstType.incomeFirstName }</a>
										<ul class="dropdown-menu">
											<c:forEach items="${allIncomeSecondType }"
												var="allIncomeSecondType">
												<c:if
													test="${allIncomeFirstType.incomeFirstId == allIncomeSecondType.incomeFirstId }">
													<li><a id="${allIncomeFirstType.incomeFirstId}"
														class="chickTwoType1" tabindex="-1" href="javascript:;">${allIncomeSecondType.incomeSecondName }</a></li>
												</c:if>
											</c:forEach>
											<li><a tabindex="-1" data-toggle="modal"
												data-target="#myModalTwo1">新建二级分类</a></li>
										</ul></li>
								</c:forEach>

								<li class="dropdown-submenu"><a tabindex="-1"
									data-toggle="modal" data-target="#myModal1">新建一级分类</a></li>
							</ul>
						</div>

						<div class="dropdown Accountclass">
							账户 &nbsp&nbsp<a id="dLabel" role="button" style="width: 100px;"
								data-toggle="dropdown" class="btn btn-default" data-target="#"
								href="javascript:;"> <span class="IncomeAccountShow">现金</span> <span
								class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu">
								<c:forEach items="${allChildAcc }" var="allChildAcc">
									<li class="dropdown-submenu">
									<a class="InconeclickAccount" id="${allChildAcc.childaccId }" href="JavaScript:void(0)">${allChildAcc.childaccName }</a></li>
								</c:forEach>
							</ul>
						</div>

						<div class="Moneyclass">
							金额&nbsp&nbsp<input class="submitMoney1" type="text"
								style="width: 150px; height: 34px;" />
						</div>
						<div class="Timeclass">
							时间&nbsp&nbsp<input type="text" id="d241"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								class="submitTime1 Wdate" style="width: 150px; height: 30px;" />
						</div>
						<div class="Messageclass">
							备注&nbsp&nbsp<input class="submitMessage1" type="text"
								style="width: 500px; height: 34px;" />
						</div>
						<div class="buttonclass">
							<button style="width: 160px; height: 34px;"
								class="btn btn-primary savealldata1">保存</button>
						</div>



					</div>
				</div>
				
				<!-- 转账部分 -->
				
				<div role="tabpanel" class="tab-pane fade" id="transfer"
					aria-labelledBy="transfer-tab">
					<div class="bs-example bs-example-images"
						data-example-id="image-shapes">

						<img src="${projectPath }/src/2.jpg" class="img-circle imgClass"
							alt="">
						<div class="dropdown TYPEclass">
							转出 &nbsp&nbsp<a id="dLabel" role="button" style="width: 100px;"
								data-toggle="dropdown" class="btn btn-default" data-target="#"
								href="javascript:;"> <span class="exchange_accountShow1">余额宝</span>
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu">
								<c:forEach items="${allChildAcc }" var="allChildAcc">
									<li class="dropdown-submenu">
									<a class="exchange_clickAccount1" id="${allChildAcc.childaccId }" href="JavaScript:void(0)">${allChildAcc.childaccName }</a>
									</li>
								</c:forEach>
							</ul>
						</div>

						<div class="dropdown Accountclass">
							转入 &nbsp&nbsp<a id="dLabel" role="button" style="width: 100px;"
								data-toggle="dropdown" class="btn btn-default" data-target="#"
								href="javascript:;"> <span class="exchange_accountShow2">余额宝</span>
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu">
								<c:forEach items="${allChildAcc }" var="allChildAcc">
									<li class="dropdown-submenu">
									<a class="exchange_clickAccount2" id="${allChildAcc.childaccId }" href="JavaScript:void(0)">${allChildAcc.childaccName }</a>
									</li>
								</c:forEach>
							</ul>
						</div>

						<div class="Moneyclass">
							金额&nbsp&nbsp<input class="exchange_amount" type="text"
								style="width: 150px; height: 34px;" />
						</div>
						<div class="Timeclass">
							时间&nbsp&nbsp<input class="exchange_time" type="text" id="d241"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								class="Wdate" style="width: 150px; height: 30px;" />
						</div>
						<div class="Messageclass">
							备注&nbsp&nbsp
							<input type="text" class="exchange_msg"
								style="width: 500px; height: 34px;" />
						</div>
						<div class="buttonclass">
							<button style="width: 160px; height: 34px;"
								class="btn btn-primary exchange_savealldata">保存</button>
						</div>


					</div>
				</div>
			</div>
		</div>
		<div class="accountListClass">
			<span>账目清单2017.7.01 - 2017.7.31</span>
		</div>
		<div class="moneyCalcular">
			<span>总支出：-${ioDetail.totalOutput } 总收入：+${ioDetail.totalInput } 结余：${ioDetail.lastMoney }（单位：元）</span>
		</div>
		<div class="allListclass">
			<button class="btn btn-default allSelect" style="width: 200px;">全部</button>
		</div>
		<div class="dropdown chooseType">
			<a id="dLabel" role="button" style="width: 200px;"
				data-toggle="dropdown" class="btn btn-default" data-target="#"
				href="javascript:;"> <span class="choosetypeShow">选择分类</span> <span
				class="caret"></span>
			</a>
			<ul class="dropdown-menu multi-level" role="menu"
				aria-labelledby="dropdownMenu">
				<c:forEach items="${allPayFirstType }" var="payFirsyType">
					<li class="dropdown-submenu"><a tabindex="-1" disabled=true
						href="JavaScript:void(0)">${payFirsyType.payFirstName }</a>
						<ul class="dropdown-menu">
							<c:forEach items="${allPaySecondType }" var="paySecondType">
								<c:if
 									test="${payFirsyType.payFirstId == paySecondType.payFirstId }"> 
 									<li>
	 									<a id="${payFirsyType.payFirstId}" class="choosetypeClass" tabindex="-1" href="javascript:;">
	 										${paySecondType.paySecondName }
	 									</a>
 									</li> 
 								</c:if> 
 							</c:forEach> 
						</ul></li>
				</c:forEach>
				<c:forEach items="${allIncomeFirstType }" var="allIncomeFirstType">
					<li class="dropdown-submenu"><a tabindex="-1" disabled=true href="JavaScript:void(0)">${allIncomeFirstType.incomeFirstName }</a>
						<ul class="dropdown-menu">
							<c:forEach items="${allIncomeSecondType }"
								var="allIncomeSecondType">
								<c:if test="${allIncomeFirstType.incomeFirstId == allIncomeSecondType.incomeFirstId }">
									<li>
										<a id="${allIncomeFirstType.incomeFirstId}" class="choosetypeClass" tabindex="-1" href="javascript:;">${allIncomeSecondType.incomeSecondName }</a>
									</li>
								</c:if>
							</c:forEach>
							<li><a tabindex="-1" data-toggle="modal"
								data-target="#myModalTwo1">新建二级分类</a></li>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="dropdown allAccount">
			<a id="dLabel" role="button" style="width: 200px;"
				data-toggle="dropdown" class="btn btn-default" data-target="#"
				href="javascript:;"> <span class="chooseaccountShow">选择账户</span> <span
				class="caret"></span>
			</a>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
				<c:forEach items="${allChildAcc }" var="allChildAcc">
					<li class="dropdown-submenu">
						<a class="chooseAccount"
							href="JavaScript:void(0)">${allChildAcc.childaccName }
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="dropdown allTime">
			<a id="dLabel" role="button" data-toggle="dropdown"
				style="width: 200px;" class="btn btn-default" data-target="#"
				href="javascript:;"> 选择时间<span class="caret"></span>
			</a>
			<ul class="dropdown-menu multi-level" role="menu"
				aria-labelledby="dropdownMenu">
				<li class="dropdown-submenu">从&nbsp
				<input type="text" id="d241"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
					class="Wdate startTime" style="width: 150px; height: 30px;" />
					<br />
				<br /> 
				到&nbsp
				<input type="text" id="d241"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
					class="Wdate lastTime" style="width: 150px; height: 30px;" /> 
					<br />
					<button class="btn btn-default timeSubmit">确定</button>
				</li>
			</ul>
		</div>

		<input type="text" class="conditionclass" id="exampleInputAmount"
			placeholder="搜备注关键字">

		<button type="submit" class="btn btn-primary sunmitClass">搜索</button>


		<div class="bs-example menuClass">
			<ul class="nav nav-pills" role="tablist">
				<li role="presentation" class="active"><a href="#"
					style="width: 100px;">2017年</a></li>
				<li role="presentation"><a id="drop4" href="${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkTime/1/1"
					style="width: 100px;" role="button"> 时间 </a></li>
				<li role="presentation" class="dropdown"><a id="drop4" href="${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkType/0/1"
					class="dropdown-toggle" style="width: 100px;"
					  aria-haspopup="true"
					aria-expanded="false"> 分类<span class="caret"></span>
				</a></li>
				<li role="presentation" class="dropup"><a id="drop4" href="${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkType/1/1"
					class="dropdown-toggle" style="width: 100px;"
					role="button" aria-haspopup="true"
					aria-expanded="false"> 分类<span class="caret"></span>
				</a></li>
				
				<li role="presentation"><a id="drop4" href="#"
					style="width: 100px;" role="button"> 收支</a></li>
				<li role="presentation" class="dropdown"><a id="drop4" href="${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkMoney/0/1"
					class="dropdown-toggle" style="width: 100px;"
					  aria-haspopup="true"
					aria-expanded="false"> 金额<span class="caret"></span>
				</a></li>
				<li role="presentation" class="dropup"><a id="drop4" href="${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkMoney/1/1"
					class="dropdown-toggle" style="width: 100px;"
					role="button" aria-haspopup="true"
					aria-expanded="false"> 金额<span class="caret"></span>
				</a></li>
				<li role="presentation" class="dropdown"><a id="drop4" href="${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkAccount/0/1"
					class="dropdown-toggle" style="width: 100px;"
					role="button" aria-haspopup="true"
					aria-expanded="false"> 账户<span class="caret"></span>
				</a></li>
				<li role="presentation" class="dropup"><a id="drop4" href="${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkAccount/1/1"
					class="dropdown-toggle" style="width: 80px;"
					role="button" aria-haspopup="true" aria-expanded="false"> 账户<span
						class="caret"></span>
				</a></li>
				<li role="presentation"><a id="drop4" href="#"
					style="width: 140px;" role="button"> 商家/对方账户 </a></li>
				<li role="presentation"><a id="drop4" href="#"
					style="width: 100px;" role="button"> 备注 </a></li>

			</ul>
			<!-- /pills -->
		</div>
		<div class="logClass">
		  	<table class="table table-condensed table-hover " >
		  		<c:if test="${empty requestScope.page.list}">
		  			<tr>
		  				<td>暂时没有账单数据！</td>
		  			</tr>
		  		</c:if>
		  		
		  		<c:if test="${!empty requestScope.page.list}">
		  			<c:forEach items="${requestScope.page.list}" var="check">
				  		<tr class="warning" >
				  			<td style="width: 104px;"><fmt:formatDate value="${check.checkTime}" pattern="yyyy-MM-dd"/></td>
				  			<td style="width: 45px;"></td>
				  			<td style="width: 104px;">${check.checkType}</td>
				  			<td style="width: 60px;"></td>
							<c:choose>
								<c:when test="${check.checkInOrNot}">
									<td style="width: 104px;">收</td>
								</c:when>
								<c:when test="${check.checkType eq '转账'}">
									<td style="width: 104px;"></td>
								</c:when>
								<c:when test="${!check.checkInOrNot}">
									<td style="width: 104px;">支</td>
								</c:when>
							</c:choose>
							<td style="width: 40px;"></td>
				  			<td style="width: 104px;">${check.checkMoney}</td>
				  			<td style="width: 104px;"></td>
				  			<td style="width: 104px;">${check.checkAccount}</td>
				  			<td style="width: 60px;"></td>
				  			<td style="width: 104px;">${check.checkAdverseAccount}</td>
				  			<td style="width: 104px;">${check.checkRemark}</td>
				  		</tr>
					</c:forEach>
						<tr>
							<td colspan="9" align="center">
								<c:set var="pageUrl" value="${projectPath }/create/managerMoney/checkAccount/tocheckAccountPage/${requestScope.type}/${requestScope.typeFlag}" scope="page"></c:set>
								<%@include file="/WEB-INF/manager_log/navigator_page.jsp" %>
							</td>
						</tr>
				</c:if>
					  	
		  	</table><br/><br/><br/><br/><br/><br/>
  		</div> 
	</div>
	<br />

	<!-- 支出模态框，用于添加一级分类 -->
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加支出分类</h4>
				</div>
				<div class="modal-body">
					<h4>
						分类名 <input type="text" class="pay_firstType_input" />
					</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary pay_firstType_button">保存更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- 支出模态框，用于添加二级分类 -->
	<div id="myModalTwo" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加支出分类</h4>
				</div>
				<div class="modal-body">

					<div class="dropdown model_location">
						分类 &nbsp&nbsp<a id="dLabel" role="button" style="width: 100px;"
							data-toggle="dropdown" class="btn btn-default" data-target="#"
							href="javascript:;"> <span class="modeltypeShow">日常购物</span>
							<span class="caret"></span>

						</a>
						<ul class="dropdown-menu multi-level" role="menu"
							aria-labelledby="dropdownMenu">
							<c:forEach items="${allPayFirstType }" var="payFirsyType">
								<li class="dropdown-submenu"><a tabindex="-1" id="${payFirsyType.payFirstId }" class="modelchickTwoType"
									href="JavaScript:void(0)">${payFirsyType.payFirstName }</a>
								</li>
							</c:forEach>
						</ul>
					</div>

					<h4 class="model_location_name">
						二级分类名<input class="pay_secondType_input" style="height: 30px;"
							type="text" />
					</h4>
				</div>
				<br /> <br />
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button"
						class="btn btn-primary pay_secondType_button ">保存更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- 收入模态框，用于添加一级分类 -->
	<div id="myModal1" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加收入分类</h4>
				</div>
				<div class="modal-body">
					<h4>
						分类名 <input type="text" class="income_firstType_input" />
					</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button"
						class="btn btn-primary income_firstType_button">保存更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- 收入模态框，用于添加二级分类 -->
	<div id="myModalTwo1" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加收入分类</h4>
				</div>
				<div class="modal-body">

					<div class="dropdown model_location">
						分类 &nbsp&nbsp<a id="dLabel" role="button" style="width: 100px;"
							data-toggle="dropdown" class="btn btn-default" data-target="#"
							href="javascript:;"> <span class="modeltypeShow1">捡破烂</span> <span
							class="caret"></span>

						</a>
						<ul class="dropdown-menu multi-level" role="menu"
							aria-labelledby="dropdownMenu">
							<c:forEach items="${allIncomeFirstType }"
								var="allIncomeFirstType">
								<li class="dropdown-submenu"><a tabindex="-1"
									id="${allIncomeFirstType.incomeFirstId }"
									class="modelchickTwoType1" href="JavaScript:void(0)">${allIncomeFirstType.incomeFirstName }</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<h4 class="model_location_name">
						二级分类名<input class="income_secondType_input" style="height: 30px;"
							type="text" />
					</h4>
				</div>
				<br /> <br />
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button"
						class="btn btn-primary income_secondType_button ">保存更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<span class="idValue"></span>
</body>
</html>