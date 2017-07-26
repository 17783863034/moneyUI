<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		$("button").click(function(){
			//模拟浏览器的后退、前进按钮
			window.history.back();//forward()
		});
	});
</script>
</head>

<body>


	<div class="container">
		
		<!-- 去掉导航栏部分，原因是guest和manager之间导航栏不同 -->
		
		<div class="jumbotron text-center">
			<h4>[错误消息]</h4>
			
			<div class="text-center">${requestScope.exception.message }</div>
			<br/><br/>
			<button class="btn btn-default">返回继续操作</button>
			
		</div>
	</div>

</body>
</html>