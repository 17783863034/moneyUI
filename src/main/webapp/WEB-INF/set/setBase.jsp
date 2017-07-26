<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>生财有道-报表</title>
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
	<table class="table table-bordered table-hover text-center">
		<tr>
			<td>一级分类</td>
			<td>支出统计</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${requestScope.pagePayFirst.list}" var="resultType">
			<tr>
				<td>${resultType.type}</td>
				<td>${resultType.sumAmount}</td>
				<td><a href="#" id="a01" class="easyui-linkbutton" onclick="$('#w').window('open')">修改</a>&nbsp;&nbsp;&nbsp;<a href="#" id="a02" class="easyui-linkbutton" onclick="alert5()">删除</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="3">
				<c:set var="pageUrl" value="${projectPath }/create/managerMoney/toPayFirstPage" scope="page" ></c:set>
				<%@include file="/WEB-INF/set/payFirst_page.jsp" %>
			</td>
		</tr>
	</table>
</body>
</html>