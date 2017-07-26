<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(function() {
		$("#jumperBlock").change(function() {
			var pageNum = this.value;
			pageNum = $.trim(pageNum);
			if (pageNum == "" || isNaN(pageNum)) {
				this.value = "";
				return;
			}
			var url = "${pageContext.request.contextPath}/${pageScope.pageUrl}/"+ pageNum;
			window.location.href = url;
		})
	})
</script>
<ul class="pagination">
	<c:if test="${requestScope.page.hasPreviousPage}">
		<li><a href="${pageScope.pageUrl}/1">首页</a></li>
		<li><a
			href="${pageScope.pageUrl}/${requestScope.page.prePage}">上一页</a></li>
	</c:if>
	<c:forEach items="${requestScope.page.navigatepageNums}"
		var="navigatepageNum">
		<li
			<c:if test="${navigatepageNum==requestScope.page.pageNum}">class="active"</c:if>>
			<a href="${pageScope.pageUrl}/${navigatepageNum}">${navigatepageNum}</a>
		</li>
	</c:forEach>
	<c:if test="${requestScope.page.hasNextPage}">
		<li><a
			href="${pageScope.pageUrl}/${requestScope.page.nextPage}">下一页</a></li>
		<li><a
			href="${pageScope.pageUrl}/${requestScope.page.pages}">末页</a></li>
	</c:if>
	<li>
		<!-- 文本框跳转 --> 跳转:<input type="text" id="jumperBlock"
		class="form-control"
		style="width: 100px; display: inline; margin-left: 10px;" />
	</li>
</ul>