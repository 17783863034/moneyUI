<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>理财改变人生</title>

<%@include file="/WEB-INF/manager_log/base.jsp" %>

<script type="text/javascript" src="bootstrap/jquery-1.10.1.js"></script>
<script type="text/javascript" src="bootstrap/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css"/>
</head>
<body>
	<div class="login-header" style="line-height:70px;margin-right:27px">
		<div id="header-container" class="clearfix">
			<div id="logo"><img src="https://www.feidee.com/sso/img/common/logo-s.png" width="116" height="36" alt="随手记logo"/></div>
		</div>
	</div>
	<div class="container">
	<%@ include file="/WEB-INF/manager_log/navigator_manager.jsp" %>
		
		<div class="jumbotron text-center">
			<h4>[管理员登录]</h4>
			<div class="container">
				<form action="manager/admin/login" method="post" class="form-horizontal">
					<c:if test="${requestScope.exception != null }">
						<div class="form-group">
							<%-- request.getAttribute("exception"); --%>
							<%-- exception.getMessage(); --%>
							${requestScope.exception.message }
						</div>
					</c:if>
					<div class="form-group">
						<label for="someNameInputId" class="col-lg-2 control-label">账号</label>
						<div class="col-lg-10">
							<input id="someNameInputId"
								   class="form-control"
								   type="text"
								   name="adminName"
								   placeholder="请输入用户名"/>
						</div>
					</div>
					<div class="form-group">
						<label for="someNameInputId" class="col-lg-2 control-label">密码</label>
						<div class="col-lg-10">
							<input id="someNameInputId"
								   class="form-control"
								   type="password"
								   name="adminPwd"
								   placeholder="请输入密码"/>
						</div>
					</div>
					<div style="text-align: center;">
						<button type="submit" class="btn btn-default" style="width: 30%">登录</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>