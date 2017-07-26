<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.jsp">理财管理系统[后台]</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
							<li><a>欢迎您：${sessionScope.user.userName }</a></li>
							<li><a href="create/managerMoney/user/logout">退出登录</a></li>
								<li><a href="manager/log/getLogPage/1">查看日志</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="create/manager/admin/toManager">后台首页</a></li>
					</ul>
				  </div>
			</div>
		</nav>