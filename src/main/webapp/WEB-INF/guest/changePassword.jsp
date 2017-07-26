<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>生财有道</title>

<link rel="stylesheet" href="${projectPath}/bootstrap/bootstrap.css">
<link rel="stylesheet" href="${projectPath}/bootstrap/bootstrap-theme.css">
<link rel="stylesheet" href="${projectPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${projectPath}/css/login.css">
<script src="${projectPath}/js/jquery-2.1.1.min.js"></script>
<script src="${projectPath}/bootstrap/bootstrap.min.js"></script>

</head>
<body>
 <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div><a class="navbar-brand" href="index.html" style="font-size:32px;">生财有道-任性的理财平台，就酱</a></div>
        </div>
      </div>
    </nav>

    <div class="container">

      <form class="form-signin" action="${projectPath }/create/managerMoney/user/changePassword" role="form" method="post">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i>修改密码</h2>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名" autofocus>
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="userPassword" name="phoneNumber" placeholder="请输入注册时手机号码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" name="resetPassword" id="pwdConfirm" placeholder="请输入修改密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" id="phoneNumber"  placeholder="请再次输入密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
        <input class="btn btn-lg btn-success btn-block" id="submit" type="submit" value="注册"> 
      </form>
    </div>

</body>
</html>