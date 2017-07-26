<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>生财有道-设置修改</title>
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
	<script type="text/javascript">
		$(function(){
			$(":submit:eq(0)").click(function(){
				var value = $(":text:eq(0)").val();
				value = $.trim(value);
				if(value==""){
					alert("类名不可为空");
					return false;
				}
			});
		})
	</script>
</head>
<body>
	<div class="container">
	<%@include file="/public_page/page_head.jsp"%>
		<div class="jumbotron" style="background: #FFFFE0;">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span3" style="background: #FFEC8B;">
						<center>
							<table>
								<form action="${projectPath }/create/set/update${requestScope.name}" method="post">
									<input type="hidden" name="typeId" value="${requestScope.typeId}"/>
									<input type="hidden" name="oldType" value="${requestScope.type}"/>
									分类名：<input type="text" name=type value="${requestScope.type}"/><br/><br/>
									<input type="submit" value="修改"/>
								</form>
							</table>
						</center>
		</div></div></div></div>				
	</div>
</body>
</html>