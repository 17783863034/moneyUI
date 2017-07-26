<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<div class="container">
	<%@ include file="/WEB-INF/manager_log/navigator_manager.jsp" %>
		
		<div class="jumbotron text-center">
			<h4>[日志数据]</h4>
			
			<table class="table table-bordered table-hover text-center">
				
				<c:if test="${empty requestScope.page.list }">
					
					<tr>
						<td>暂时没有日志数据</td>
					</tr>
					
				</c:if>
				<c:if test="${!empty requestScope.page.list }">
				
					<tr>
						<td>ID</td>
						<td>详情</td>
					</tr>
					
					<c:forEach items="${requestScope.page.list }" var="log">
						
						<tr>
							<td>${log.logId }</td>
							<td>
								操作人：${log.logOperator }<br/>
								操作时间：${log.logOperateTime }<br/>
								操作方法：${log.methodName }<br/>
								方法所在类型：${log.methodType }<br/>
								输入数据：${log.inputData }<br/>
								输出数据：${log.outputData }<br/>
								异常类型：${log.exceptionType }<br/>
								异常消息：${log.exceptionMessage }<br/>
							</td>
						</tr>
						
					</c:forEach>
					
					<tr>
						<td colspan="2">
							<c:set var="pageUrl" value="manager/log/getLogPage" scope="page"></c:set>
							<%@include file="/WEB-INF/manager_log/navigator_page.jsp" %>
						</td>
					</tr>
				
				</c:if>
				
			</table>
			
		</div>
	</div>

</body>
</html>