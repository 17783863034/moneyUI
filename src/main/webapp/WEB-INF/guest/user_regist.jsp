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

<script type="text/javascript">
$(function(){
	   		$("#checkCodeId").click(function(){
	   			this.src = "${projectPath}/kaptcha.jpg?time" + new Date().getTime();
	   		});
});

$(function(){
	$("#submit").click(function(){
		// 验证用户名：必须由字母，数字下划线组成，并且长度为5到12位
		//1.先获取文本框里的内容
		var usernameTextValue = $("#userName").val();
		//2.创建一个正则表达式，用于验证用户名是否合法
		var patt = /^\w{5,12}$/;
		//test判断文本框里的内容是否合法
		if (!patt.test(usernameTextValue)) {
			//3.提示用户
			alert("用户名必须为5到12位！");
			return false;
		}
		
		// 验证密码：必须由字母，数字下划线组成，并且长度为5到12位
		//1.先获取文本框里的内容
		var passwordTextValue = $("#userPassword").val();
		//2.创建一个正则表达式，用于验证用户名是否合法
		var passwordPatt = /^\w{5,12}$/;
		//test判断文本框里的内容是否合法
		if (!passwordPatt.test(passwordTextValue)) {
			//3.提示用户
			alert("密码必须为5到12位！");
			return false;
		}
		
		// 验证确认密码：和密码相同
		//1.获取确认密码的内容 
		var repwdTextValue = $("#pwdConfirm").val();
		//2.跟密码比较
		if (repwdTextValue != passwordTextValue) {
			//3.提示用户
			alert("两次密码不一致！");
			return false;
		}
		
		//验证手机号码
		var varifyPhoneNumber = $("#phoneNumber").val();
		
		var phonePatt = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		if(!phonePatt.test(varifyPhoneNumber)){
			alert("手机号码格式有误");
			return false;
		}
		// 邮箱验证：xxxxx@xxx.com
		//1.先获取邮箱内容 。
		var emailTextValue = $("#userEmail").val();
		//2.创建正是表达式对象
		var emailPatt = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		//3.验证并提示用户
		if (!emailPatt.test(emailTextValue)) {
			alert("邮箱格式不合法！");
			return false;
		}
		
		// 验证码：现在只需要验证用户已输入。因为还没讲到服务器。验证码生成。
		// 1.获取验证码
		var codeTextValue = $("#checkCodeIdInput").val();
		//2.判断非空
		
	//alert("去空格之前：[" + codeTextValue + "]");
		codeTextValue = $.trim(codeTextValue);
//			alert("去空格之后：[" + codeTextValue + "]");
		if (codeTextValue == "") {
			alert("验证码不能为空！");
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
          <div><a class="navbar-brand" href="index.html" style="font-size:32px;">生财有道-任性的理财平台，就酱</a></div>
        </div>
      </div>
    </nav>

    <div class="container">

      <form class="form-signin" action="${projectPath }/create/managerMoney/user/regist" role="form" method="post">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 用户注册</h2>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="userName" name="userName" placeholder="请输入登录账号" autofocus>
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" id="userPassword" name="userPwd" placeholder="请输入登录密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" id="pwdConfirm" placeholder="再次输入密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="phoneNumber" name="phonenumber" placeholder="请输入手机号" style="margin-top:10px;">
			<span class="glyphicon glyphicon glyphicon-phone form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="userEmail" name="email" placeholder="请输入邮箱地址" style="margin-top:10px;">
			<span class="glyphicon glyphicon glyphicon-envelope form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="text" id="checkCodeIdInput" placeholder="请输入验证码" name="code" style="margin-top:10px;width: 150px;height: 40px;">
			<img id ="checkCodeId" alt="kaptcha.jpg" src="${projectPath}/kaptcha.jpg" style="height: 40px;width: 140px;"><br/>
			<span class="glyphicon glyphicon  form-control-feedback"></span>
		  </div>

        <div class="checkbox">
          <label>
            忘记密码
          </label>
          <label style="float:right">
            <a href="login.html">我有账号</a>
          </label>
        </div>
        <input class="btn btn-lg btn-success btn-block" id="submit" type="submit" value="注册"> 
      </form>
    </div>

</body>
</html>