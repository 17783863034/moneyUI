<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">生财有道【开发】</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
					<li><a href="${projectPath}/create/managerMoney/checkAccount/tocheckAccountPage/checkTime/1/1">记账</a></li>
					<li><a href="${projectPath}/create/managerMoney/account/toUI">账户</a></li>
					<li><a href="${projectPath }/create/managerMoney/fund/addAllFund">基金</a></li>
					<li><a href="${projectPath}/create/managerMoney/chart/toChartUI">报表</a></li>
					<li><a href="${projectPath}/create/managerMoney/community/toCommunityPage/1">社区</a></li>
					<li><a href="${projectPath}/create/set/toPayFirst">设置</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="${projectPath }/create/managerMoney/user/toindexUI">首页</a></li>
				<li><a href="#">欢迎您：${sessionScope.user.userName }</a></li>
				<li><a href="${projectPath }/create/managerMoney/user/logout">退出登录</a></li>

			</ul>
		</div>
	</div>
</nav>