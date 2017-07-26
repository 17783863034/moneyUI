<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>生财有道-请稍等</title>
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
</head>
<body>
	
<div class="container">
  <%@ include file="/public_page/page_head.jsp" %>
            <div class="jumbotron text-center" >
				<h2>业务繁忙，请稍等片刻再操作！</h2>
			</div>
 </div>

</body>
</html>