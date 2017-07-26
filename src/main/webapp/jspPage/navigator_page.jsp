<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<script type="text/javascript">
	$(function(){
		
		$("#jumperBlock").change(function(){
			
			//1.获取当前文本框中的数据
			var pageNum = this.value;//对
			//$(this).val()对
			//$(this).value错误jQuery对象.DOM属性
			//this.val()错误DOM对象.jQuery方法
			
			//2.去除前后空格
			pageNum = $.trim(pageNum);
			
			//3.检查pageNum是否为有效的数字
			//NaN：not a number
			//window.isNaN(pageNum);
			//空字符串也需要进行验证，因为它会被当做0处理
			if(pageNum == "" || isNaN(pageNum)) {
				
				//将文本框恢复为最初状态
				this.value = "";//this.defaultValue
				
				//如果数据不合法，则将程序停止执行
				return ;
			}
			
			//4.跳转页面
			//某些较低版本的IE，script标签内的JavaScript代码不参照base标签
			var url = "${pageContext.request.contextPath}/${pageScope.targetUrl}/"+pageNum;
			window.location.href = url;
		});
		
	});
</script>
							<ul class="pagination">
								<c:if test="${requestScope.page.hasPreviousPage }">
									<li><a href="${pageScope.targetUrl}/1" target="_self">首页</a></li>
									<li><a href="${pageScope.targetUrl}/${requestScope.page.prePage }" target="_self">上一页</a></li>
								</c:if>
								<c:forEach items="${requestScope.page.navigatepageNums }" var="navigatepageNum">
									<li <c:if test="${navigatepageNum == pageNum }">class="active"</c:if>>
										<a href="${pageScope.targetUrl}/${navigatepageNum }" target="_self">${navigatepageNum }</a>
									</li>
								</c:forEach>
								<c:if test="${requestScope.page.hasNextPage }">
									<li><a href="${pageScope.targetUrl}/${requestScope.page.nextPage }" target="_self">下一页</a></li>
									<li><a href="${pageScope.targetUrl}/${requestScope.page.pages }" target="_self">末页</a></li>
								</c:if>
								
							</ul>