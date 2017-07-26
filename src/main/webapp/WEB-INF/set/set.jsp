<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>生财有道-设置</title>
	<link rel="stylesheet" type="text/css" href="${projectPath }/bootstrap/bootstrap.css">
	<link href="${projectPath }/bootstrap/bootstrap-responsive.css" rel="stylesheet">
	<script type="text/javascript" src="${projectPath }/bootstrap/jquery-1.10.1.js"></script>
	<script type="text/javascript" src="${projectPath }/bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="${projectPath }/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${projectPath }/js/echarts.js"></script>
	<link rel="stylesheet" type="text/css" href="${projectPath }/jQuery/themes/default/easyui.css" />
	<!-- 引入图标样式 -->
	<link rel="stylesheet" type="text/css" href="${projectPath }/jQuery/themes/icon.css" />
	<!-- 引入JQuery主文件 -->
	<script type="text/javascript" src="${projectPath }/jQuery/jquery.min.js"></script>
	<!-- 引入EasyUI主文件 -->
	<script type="text/javascript" src="${projectPath }/jQuery/jquery.easyui.min.js"></script>
	<!-- 引入本地化文件 -->
	<script type="text/javascript" src="${projectPath }/jQuery/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
		$(function(){
			$(":submit:eq(0)").click(function(){
				var value = $(":text:eq(0)").val();
				value = $.trim(value);
				if(value==""){
					alert("类名不可为空");
					return false;
				}
			});
			$(":submit:eq(1)").click(function(){
				var value = $(":text:eq(1)").val();
				value = $.trim(value);
				if(value==""){
					alert("类名不可为空");
					return false;
				}
			});
			$(":submit:eq(2)").click(function(){
				var value = $(":text:eq(2)").val();
				value = $.trim(value);
				if(value==""){
					alert("类名不可为空");
					return false;
				}
			});
			$(":submit:eq(3)").click(function(){
				var value = $(":text:eq(3)").val();
				value = $.trim(value);
				if(value==""){
					alert("类名不可为空");
					return false;
				}
			});
			$(":submit:eq(4)").click(function(){
				return false;
			})
		})
	
	</script>
</head>
<body>
	<div class="container">
		<%@include file="/public_page/page_head.jsp"%>
		<div class="jumbotron" style="background: #FFFFE0;">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span3" style="background: #FFEC8B;">
						<ul id="myTab" class="nav nav-list">
							<li class="active"><a href="#home" data-toggle="tab">
									分类管理 </a></li>
							<li><a href="#ios" data-toggle="tab">请求帮助</a></li>
								
						</ul>
					</div>
					<div id="myTabContent" class="span9 tab-content">
						<div id="home" class="tab-pane fade in active">
							<div id="tt" class="easyui-tabs" style="width:700px;height:750px">
								<div title="一级支出分类" style="padding:10px" data-options="href:'',loadingMessage:'正在拼命的为您加载！'">
									<table class="table table-bordered table-hover text-center">
										<tr>
											<td>一级支出分类</td>
											<td>支出统计</td>
											<td>操作</td>
										</tr>
										<c:forEach items="${requestScope.payFirstList}" var="resultType">
											<tr class="tr01">
												<td>${resultType.type}</td>
												<td>${resultType.sumAmount}</td>
<%-- 												<td><a href="#" id="${resultType.typeId}" class="easyui-linkbutton" onclick="$('#w').window('open')">修改</a>&nbsp;&nbsp;&nbsp; --%>
<%-- 													<a href="#" id="${resultType.typeId}" class="easyui-linkbutton" onclick="alert5()">删除</a></td> --%>
												<td><a href="${projectPath }/create/set/toupdatePayFirst/${resultType.typeId}/${resultType.type}" id="${resultType.typeId}"  class="easyui-linkbutton" >修改</a>&nbsp;&nbsp;&nbsp;
													<a href="${projectPath }/create/set/deletePayFirst/${resultType.typeId}" id="${resultType.typeId}" class="easyui-linkbutton" >删除</a></td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="3">
												<form action="${projectPath }/create/set/savePayFirst" method="post">
													<b>添加操作</b><br/><br/>
													一级支出分类名:<input type="text" name="type"/><br/><br/>
													<input type="submit" value="添加"/>
												</form>
											</td>
										</tr>
									</table>
								</div>
								<div title="二级支出分类" style="padding:10px"  data-options="href:'',loadingMessage:'正在拼命的为您加载！'">
									<table class="table table-bordered table-hover text-center">
										<tr>
											<td>二级支出级分类</td>
											<td>支出统计</td>
											<td>操作</td>
										</tr>
										<c:forEach items="${requestScope.paySecondList}" var="resultType">
											<tr class="tr01">
												<td>${resultType.type}</td>
												<td>${resultType.sumAmount}</td>
												<td><a href="${projectPath }/create/set/toupdatePaysecond/${resultType.typeId}/${resultType.type}" id="${resultType.typeId}" class="easyui-linkbutton" >修改</a>&nbsp;&nbsp;&nbsp;
													<a href="${projectPath }/create/set/deletePaysecond/${resultType.typeId}" id="${resultType.typeId}" class="easyui-linkbutton" >删除</a></td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="3">
												<form action="${projectPath }/create/set/savePaySecond" method="post">
													<b>添加操作</b><br/><br/>
													一级支出分类：<select name="firstType">
															 <c:forEach items="${requestScope.payFirstList}" var="resultType">
															 	<option value="${resultType.typeId}">${resultType.type}</option>
															 </c:forEach>
														   </select><br/><br/>
													二级支出分类名:<input type="text" name="type"/><br/><br/>
													<input type="submit" value="添加"/>
												</form>
											</td>
										</tr>
									</table>
								</div>
								<div title="一级收入分类" style="padding:10px"  data-options="href:'',loadingMessage:'正在拼命的为您加载！'">
									<table class="table table-bordered table-hover text-center">
										<tr>
											<td>一级收入分类</td>
											<td>收入统计</td>
											<td>操作</td>
										</tr>
										<c:forEach items="${requestScope.incomeFirstList}" var="resultType">
											<tr class="tr01">
												<td>${resultType.type}</td>
												<td>${resultType.sumAmount}</td>
												<td><a href="${projectPath }/create/set/toupdateIncomeFirst/${resultType.typeId}/${resultType.type}" id="${resultType.typeId}"  class="easyui-linkbutton" >修改</a>&nbsp;&nbsp;&nbsp;
													<a href="${projectPath }/create/set/deleteIncomeFirst/${resultType.typeId}" id="${resultType.typeId}" class="easyui-linkbutton" >删除</a></td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="3">
												<form action="${projectPath }/create/set/saveIncomeFirst" method="post">
													<b>添加操作</b><br/><br/>
													一级收入分类名:<input type="text" name="type"/><br/><br/>
													<input type="submit" value="添加"/>
												</form>
											</td>
										</tr>
									</table>
								</div>
								<div title="二级收入分类" style="padding:10px"  data-options="href:'',loadingMessage:'正在拼命的为您加载！'">
									<table class="table table-bordered table-hover text-center">
										<tr>
											<td>二级收入分类</td>
											<td>收入统计</td>
											<td>操作</td>
										</tr>
										<c:forEach items="${requestScope.incomeSecondList}" var="resultType">
											<tr class="tr01">
												<td>${resultType.type}</td>
												<td>${resultType.sumAmount}</td>
												<td><a href="${projectPath }/create/set/toupdateIncomeSecond/${resultType.typeId}/${resultType.type}" id="${resultType.typeId}"  class="easyui-linkbutton" >修改</a>&nbsp;&nbsp;&nbsp;
													<a href="${projectPath }/create/set/deleteIncomeSecond/${resultType.typeId}" id="${resultType.typeId}" class="easyui-linkbutton" >删除</a></td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="3">
												<form action="${projectPath }/create/set/saveIncomeSecond" method="post">
													<b>添加操作</b><br/><br/>
													一级收入分类：<select name="firstType">
															 <c:forEach items="${requestScope.incomeFirstList}" var="resultType">
															 	<option value="${resultType.typeId}">${resultType.type}</option>
															 </c:forEach>
														   </select><br/><br/>
													二级收入分类名:<input type="text" name="type"/><br/><br/>
													<input type="submit" value="添加"/>
												</form>
											</td>
										</tr>
									</table>
								</div>
							</div>
<!-- 						第1个页面 -->
						</div>
						<!-- 第二个页面 -->
						<div class="tab-pane fade" id="ios">
	

<div class="clear"></div>
<div class="help">
   <div class="wrap">
      <div class="fl">
         <a href="#" class="ico1"><span class="big">帮助中心</span><p class="s14">帮助您更好的使用生财有道</p></a>
         <a href="#" class="ico1"><span class="big">产品论坛</span><p class="s14">生财有道用户的分享与互助</p></a>
      </div>
      <div class="search">
				<form method="post" action="#">
         <div class="sear_bar"><input type="text" class="text1 s14 f" name="word" value=""  placeholder="请输入搜索内容" /><input type="submit" value="搜 索" class="btn1 f s16" /></div><input type="hidden" name="__hash__" value="23b29a67e6cadba5c42343eed4b567c3" /></form>
         <!--<p class="hot_key">热门搜索：<a href="">明择信息</a><a href="">深圳建站</a><a href="">随手记</a></p>-->
      </div>
   </div>
</div>


<div class="answer">
   <div class="wrap">
      <div class="zhi_tit"><h2 class="fl">新手指南</h2></div>
      <div class="an_con">
         <div class="scrolldoorFrame"> 
            <div class="bor03 cont"> 
			<div id="c01" class="looe" >
								<div class="da">
			
                	<dl >
                          <dt class="s20">使用入门</dt>
                          <dd>
	                          	<a href="#">如何下载</a>&nbsp;&nbsp;<a href="#">注册登录</a>&nbsp;&nbsp;&nbsp;<a href="#">如何购买</a>&nbsp;&nbsp;<a href="#">新建账户</a>&nbsp;&nbsp;
	                          	<a href="#">账户管理</a>&nbsp;&nbsp;<a href="#">更多>></a></dd>
                       </dl>
					 <dl >
                          <dt class="s20">开始记账</dt>
                          <dd>
                          	     <a href="#">收支记账</a>&nbsp;&nbsp;<a href="#">记账模板</a>&nbsp;&nbsp;
                          	     <a href="#">流水管理</a>&nbsp;&nbsp;<a href="#">图表查看</a>	&nbsp;&nbsp;
                          	     <a href="#">更多>></a></dd>
                       </dl>
					 <dl style="margin-right:0; border:none;">
                          <dt class="s20">账本管理</dt>
                          <dd>
                          	      <a href="#">账本属性</a>&nbsp;&nbsp;<a href="#">账本管理</a>&nbsp;&nbsp;
                          	      <a href="#">账本共享</a>&nbsp;&nbsp;<a href="#">账单管理</a>&nbsp;&nbsp;
                          	      <a href="#">账单修改</a>&nbsp;&nbsp;<a href="#">更多>></a></dd>
                       </dl>
					 </div><div class="da"><dl >
                          <dt class="s20">基础设置</dt>
                          <dd>
                          	       <a href="#">分类管理</a>&nbsp;&nbsp;<a href="#">项目管理</a>&nbsp;&nbsp;
                          	       <a href="#">高级记账</a>&nbsp;&nbsp;<a href="#">更多>></a></dd>
                       </dl>
					 <dl >
                          <dt class="s20">日常使用</dt>
                          <dd>
                          	  <a href="#">理财市场</a>&nbsp;&nbsp;<a href="#">借贷中心</a>&nbsp;&nbsp;
                          	  <a href="#">报销中心</a>&nbsp;&nbsp;<a href="#">退款记账</a>&nbsp;&nbsp;
                          	  <a href="#">投资中心</a>&nbsp;&nbsp;<a href="#">更多>></a></dd>
                       </dl>
					 <dl style="margin-right:0; border:none;">
                          <dt class="s20">数据管理</dt>
                          <dd>
                          	   <a href="#">数据迁移</a>&nbsp;&nbsp;<a href="#">导入导出</a>&nbsp;&nbsp;
                          	   <a href="#">同步详解</a>&nbsp;&nbsp;<a href="#">数据备份</a>&nbsp;&nbsp;
                          	   <a href="#">刷机处理</a>&nbsp;&nbsp;<a href="#">更多>></a></dd>
                       </dl>
					 </div>       
				 <dl class="hot_wen">
                       <dt class="s18">热门问题</dt>
                       <dd>
					   <a href="#">批量导出与导入记账数据</a>&nbsp;&nbsp;<a href="#">如何进行流水相关管理</a>&nbsp;&nbsp;
					   <a href="#">记账数据同步功能详解</a>&nbsp;&nbsp;<a href="#">开始记录收入、支出、转账</a>&nbsp;&nbsp;
					   <a href="#">忘记密码怎么办</a>&nbsp;&nbsp;<a href="#">如何建立记账模板，轻松入账</a>&nbsp;&nbsp;
					   <a href="#">多人记账账本共享与分享</a>&nbsp;&nbsp;<a href="#">网购中出现退款如何记录</a>                         
                       </dd>
                    </dl>
            </div> 
        </div>
      </div>
   </div>
</div>

						</div>
					</div>
				</div>

			</div>
		</div>
		<footer>
		<p>生财有道项目组&copy; Company 2013</p>
		</footer>
	</div>
<!-- 	<div id="w" class="easyui-window" title="Modal Window" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:250px;height:150px;padding:10px;"> -->
<!-- 		<form action=""> -->
<!-- 			<center> -->
<!-- 				分类名称：<input type="text" value="aaa"/><br/> -->
<!-- 				<br/><br/> -->
<!-- 				<input type="submit" value="修改"/> -->
<!-- 			</center> -->
<!-- 		</form> -->
<!-- 	</div> -->
	<script>
// 	$(function(){
// 		$(":button").click(function(){
// 			alert(this.attr("id")); 
// 		function alert5(){
// 			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
// 			    if (r){  
// 			    	alert($(".tr01 td:last-child a:last-child").attr("id"))
// 			    }    
// 		})}
// 		})
// 		})
	</script>
</body>
</html>