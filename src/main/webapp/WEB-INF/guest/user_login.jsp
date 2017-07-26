<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>生财有道</title>
<%@include file="/public_page/base_address.jsp"%>
<link type="text/css" rel="stylesheet" href="${projectPath}/css/login.css" >

<script type="text/javascript">
	$(function() {
		$("#log_btn").click(function() {
			// 验证用户名：必须由字母，数字下划线组成，并且长度为5到12位
			//1.先获取文本框里的内容
			var usernameTextValue = $("#userName").val();
			//2.创建一个正则表达式，用于验证用户名是否合法
			var patt = /^\w{5,12}$/;
			//test判断文本框里的内容是否合法
			if (!patt.test(usernameTextValue)) {
				//3.提示用户
				alert("用户名不合法！");
				return false;
			}

			// 验证密码：必须由字母，数字下划线组成，并且长度为5到12位
			//1.先获取文本框里的内容
			var passwordTextValue = $("#userpwd").val();
			//2.创建一个正则表达式，用于验证用户名是否合法
			var passwordPatt = /^\w{5,12}$/;
			//test判断文本框里的内容是否合法
			if (!passwordPatt.test(passwordTextValue)) {
				//3.提示用户
				alert("密码不合法！");
				return false;
			}

			return true;
		});
	});
</script>

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<div>
					<span class="navbar-brand" href="index.html" style="font-size: 32px;">生财有道-任性的理财平台，就酱</span>
				</div>
			</div>
		</div>
	</nav>

	<div class="container">
		<form class="form-signin" action="${projectPath}/create/managerMoney/user/login" method="post"  role="form">
			<h2 class="form-signin-heading">
				<i class="glyphicon glyphicon-log-in"></i> 用户登录
			</h2>
			
			<div class="form-group has-success has-feedback">
				<input type="text" class="form-control" name="userName" id="inputSuccess4"
					placeholder="请输入登录账号" autofocus><font color="red">${LogErrormsg }</font> <span
					class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<input type="password" class="form-control"  id="inputSuccess4" name="userPwd"
					placeholder="请输入登录密码" style="margin-top: 10px;"> <span
					class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="checkbox">
				<label ><a href="${projectPath}/create/managerMoney/user/tochangePassword">忘记密码 </a></label>
				<label style="float: right">
					<a href="${projectPath}/create/managerMoney/user/toRegistUI">我要注册</a>
				</label>
			</div>
			<a class="btn btn-lg btn-success btn-block submitButton" onclick="dologin()">
				登录</a>
		</form>
	</div>
	<script>
		function dologin() {
		$("form").submit();
		}
	</script>
</body>
</html>