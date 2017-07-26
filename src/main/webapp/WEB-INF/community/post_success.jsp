<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>遛遛遛理财社区</title>
<script type="text/javascript" src="${projectPath}/jQuery/jquery.min.js"></script>
<script type="text/javascript"
	src="${projectPath }/bootstrap/jquery-1.10.1.js"></script>
<script type="text/javascript" src="${projectPath }/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${projectPath }/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="${projectPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet"
	href="${projectPath}/css/bootstrap-theme.css">
<link type="text/css" rel="stylesheet" href="${projectPath}/css/my.css">


<!-- <meta name="keywords" content="第一次总是那么。。。" /> -->
<meta name="description" content="" />
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://bbsimg.feidee.com/static/css/reset.css?OYW">
<link rel="stylesheet"
	href="https://bbsimg.feidee.com/static/css/common.css?OYW">
<link rel="stylesheet"
	href="https://bbsimg.feidee.com/static/css/modules.css?OYW">
<link rel="stylesheet"
	href="https://bbsimg.feidee.com/static/css/utils.css?OYW">
<!-- <script src="https://bbsimg.feidee.com/static/js/jquery-1.9.1.min.js?OYW"></script> -->
<!-- <script src="https://bbsimg.feidee.com/static/js/new_common.js?OYW"></script> -->

<link rel="stylesheet" type="text/css"
	href="data/cache/style_3_forum_viewthread.css?OYW" />
<link rel="stylesheet"
	href="https://bbsimg.feidee.com/static/css/detail.css?OYW">
<base target="_blank">

<!--[if IE 6]><script>document.execCommand("BackgroundImageCache", false, true)</script><![endif]-->
<script type="text/javascript">
	$(function() {
	
		$("#bt")
				.click(
						function() {
							var text = $("#fastpostmessage12").val();
							$
									.ajax({
										url : "${projectPath }/create/managerMoney/community/postReply/${requestScope.postId}",
										type : "post",
										data : {
											"replyContent" : text
										},
										dataType : "json",
										beforeSend : function() {
											return true;
										},
										success : function(msg) {

											var result = msg.result;
											if ($.trim(text) != null && $.trim(text) != "") {

												result == "success";

													alert("评论成功!");

											}else{
												result == "defeat";
												
												alert("您还没有评论!");
												return;
											}
										}
									});
						});
	});
</script>
<script type="text/javascript">
	$(function() {
		

		$("#recommend")
				.click(
						function() {
							var strCookie = document.cookie;
							var giveNice = $("#recommendv_add").text();
							$
									.ajax({
										url : "${projectPath }/create/managerMoney/community/giveNice/${requestScope.postId}",
										type : 'post',
										data : {
											"giveNice" : giveNice,
											"time" : new Date()
										},
										dataType : 'json',
										cache : false, //不缓存此页面   
										success : function(result) {

											$("#recommendv_add").html(result);

										}
									});
						});
	});
</script>
							<script>
											function check() {
												var regC = /[^ -~]+/g;
												var regE = /\D+/g;
												var str = t1.value;
												if (regC.test(str)) {
													t1.value = t1.value.substr(
															0, 200);
												}
												-->

												if (regE.test(str)) {
													t1.value = t1.value.substr(
															0, 400);
												}
											}
										</script>
<script type="text/javascript"> 
	var postminchars = parseInt('1');
	var postmaxchars = parseInt('10000000');
	var disablepostctrl = parseInt('0');
</script> 
<script type="text/javascript" charset="utf-8"
	src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
<script type="text/javascript" charset="utf-8"
	src="http://static.bshare.cn/b/bshareC0.js"></script>

</head>
<body>
	<div id="append_parent"></div>
	<div id="ajaxwaitid"></div>
	<div class="g-doc">
		<div class="g-header">
			<div class="l-main">
				<div class="container">
					<%@ include file="/public_page/page_head.jsp"%>

				</div>
				<div class="m-header">
			<%-- <a href="javascript:void(0);" class="logo"> <img src="${projectPath}/src/111111.png" alt="" width="126" 
 				height="36"></a>  --%>
					<span class="btn-wrap"> <a
						href="${projectPath }/create/managerMoney/community/toPostPage" class="btn btn-post"
						id="JbtnPost" rel="nofollow">发帖</a>
					</span>
					<%-- <div class="nav-main">
						<ul>
							<li><a href="${projectPath}/community/toCommunityPage/1"
								rel="nofollow">社区首页</a></li>
							<!-- <li ><a href="">精选专题</a></li> -->
						</ul>
					</div> --%>

				</div>
			</div>
		</div>

		<script>
			var fid = '205' >> 0, tid = '1157611' >> 0, init_page = '1' >> 0, authorid = 18138531;
		</script>
		<div class="g-main">
			<script type="text/javascript">
				zoomstatus = parseInt(1);
				var imagemaxwidth = '600';
				var aimgcount = new Array();
			</script>
			<script
				src="https://bbsimg.feidee.com/static/js/forum_moderate.js?OYW"></script>
			<script
				src="https://bbsimg.feidee.com/static/js/forum_viewthread.js?OYW"></script>

			<div class="l-main">
				<div class="col-ab" id="JdetailMain">
					<div class="detail-main-wrap">
						<div class="title-wrap">
							<tr>
								<td type="text" name="postContent" class="t_f">${requestScope.post.postTitle}</td>
							</tr>
						</div>
						<div class="info-wrap">
							<div class="fr">
								<span class="views">本文浏览量：${requestScope.post.lookNum}</span>
							</div>
						</div>
						<div class="content-wrap">
							<table cellspacing="0" cellpadding="0">
								<tr>
									<td type="text" name="postContent" class="t_f"><br />${requestScope.post.postContent}</td>
								</tr>
							</table>
						</div>
						<div id="post_rate_div_23265611"></div>
						<div class="fun-wrap">
							<div class="clearfix detail-fun">
								<div class="fr">
									<a href="javascript:void(0);" target="_self"
										class="btn btn-report " onclick="needLogin()"><i
										class="icon icon-report"></i>举报</a>
								</div>
							</div>
							<div class="clearfix fast-fun-wrap-inner" id="fast-fun-inner">
								<div class="fl ">
									<a class="btn btn-reply"
										onclick="needLogin(function(){},'http://bbs.feidee.com/sso.php?action=login&amp;forward=http%3A%2F%2Fbbs.feidee.com%2Fforum.php%3Fmod%3Dviewthread%26tid%3D1189107%26extra%3Dpage%253D1%26page%3D1')"
										class="btn btn-recommend " rel="nofollow"><i
										class="icon icon-reply"></i>评论<span class="num">${requestScope.allReply.size()}</span></a>
									<span class="line"></span> <a id="recommend"
										class="btn btn-recommend " 
										onclick="this.disabled = true;"
										rel="nofollow"><i class="icon icon-recommend"></i>点赞<span
										class="num" id="recommendv_add"><i>${requestScope.post.giveNice}</i></span></a>
									<span class="line"></span>
								</div> 
								
								<script type="text/javascript">
								    
								</script>
								<!--         <div class="fr share-wrap bdsharebuttonbox share-inner" data-tag="share_1"> -->
								<!--             <span class="share-tit">分享到</span> -->
								<!--             <a href="javascript:void(0)" class="bds_tsina icon icon-share-wb" data-cmd="tsina" title="分享到新浪微博" rel="nofollow"></a> -->
								<!--             <a href="javascript:void(0)" class="bds_qzone icon icon-share-qzone" data-cmd="qzone" title="分享到QQ空间" rel="nofollow"></a> -->
								<!--             <a href="javascript:void(0)" class="bds_weixin icon icon-share-wx" data-cmd="weixin" title="分享到微信" rel="nofollow"></a> -->
								<!--         </div> -->
								<div class="bshare-custom">
								<span class="share-tit">分享到:</span>
									<a title="分享到QQ空间" class="bshare-qzone"></a> <a title="分享到新浪微博"
										class="bshare-sinaminiblog"></a> <a title="分享到人人网"
										class="bshare-renren"></a> <a title="分享到腾讯微博"
										class="bshare-qqmb"></a> <a title="分享到网易微博"
										class="bshare-neteasemb"></a> <a title="更多平台"
										class="bshare-more bshare-more-icon more-style-addthis"></a>
									<!--              <span class="BSHARE_COUNT bshare-share-count">0</span> -->
								</div>
							</div>
							<div class="clearfix" id="JfastFunWrap">
								<div class="fast-fun-wrap-outer s-fix-outside">
									<div class="clearfix fast-fun-wrap-inner">
										<div class="fl">
											<a class="btn btn-reply"
												href="forum.php?mod=post&action=reply&fid=171&tid=1181603&reppost=23364118&extra=&page=">
												<i class="icon icon-reply-large"></i><span class="num">5</span>
											</a> <a id="recommend2" class="btn btn-recommend "
												onclick="needLogin(function(){},'http://bbs.feidee.com/sso.php?action=login&amp;forward=http%3A%2F%2Fbbs.feidee.com%2Fforum.php%3Fmod%3Dviewthread%26tid%3D1181603');return false;"
												onmouseover="this.title = $('recommendv_add').innerHTML + ' 人支持'">
												<i class="icon icon-recommend-large"></i><span
												id="recommendv_add2" class="num">2</span>
											</a> <a
												onclick="needLogin(function(){},'http://bbs.feidee.com/sso.php?action=login&amp;forward=http%3A%2F%2Fbbs.feidee.com%2Fforum.php%3Fmod%3Dviewthread%26tid%3D1181603')"
												id="k_favorite2" class="btn btn-favorite "> <i
												class="icon icon-favorite-large"></i><span
												id="favoritenumber2" class="num">0</span>
											</a>
										</div>
										<div class="fr share-wrap bdsharebuttonbox" data-tag="share_2">
											<span class="share-tit">分享到</span> <a
												href="javascript:void(0)"
												class="bds_tsina icon icon-share-wb" data-cmd="tsina"
												title="分享到新浪微博"></a> <a href="javascript:void(0)"
												class="bds_qzone icon icon-share-qzone" data-cmd="qzone"
												title="分享到QQ空间"></a> <a href="javascript:void(0)"
												class="bds_weixin icon icon-share-wx" data-cmd="weixin"
												title="分享到微信"></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="m-box-reply">
						<div class="m-hd">
							<div class="mark control" id="Jtab01-controler">
								<!-- 								<span>全部评论</span> -->
							</div>




							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary btn-lg"
								data-toggle="modal" data-target="#myModal">
								全部评论
								<!-- 															<a id="allReplyList"   -->
								<%-- 																href="${projectPath}/community/postReplyList/${requestScope.postId}/${requestScope.pageNum}"   --%>
								<!-- 																target="_self">全部评论</a>   -->

							</button>


							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">自古评论出人才</h4>
										</div>

										<div class="modal-body" id="txtMessage">
											<c:if test="${empty requestScope.allReply }">
												<td>暂无评论</td>
											</c:if>
											<c:if test="${!empty requestScope.allReply }">

												<%-- 											<c:if test="${empty sessionScope.userId }"> --%>
												<!-- 											            <div class="area"> -->
												<!--                                                               <div class="pt hm  no-uid "> -->
												<!--                                                                   您需要登录后才可以回帖 <a href="#" class="xi2">登录</a> | <a href="#" class="xi2">注册</a> -->
												<!--                                                             </div> -->
												<!--                                                         </div> -->
												<%-- 											</c:if> --%>

												<c:forEach items="${requestScope.allReply }" var="reply" varStatus="status">
													<tr>
														
														<%-- 														<td id="replyUserId">${reply.replyUserId }</td> --%>
														</br> 评论：
														<td id="replyContent">${reply.replyContent }</td>
														</br>
														<div align="right">
														     <td>${status.count}楼</td>&nbsp&nbsp
															<td id="replyDate">${reply.replyDate }</td>
														</div>
														<hr />

													</tr>

												</c:forEach>
												<tr>
													<td colspan="5"><c:set
															value="${projectPath }/create/managerMoney/community/postReplyList/${requestScope.postId}/${requestScope.pageNum}"
															var="targetUrl" scope="page" /> <%@ include
															file="/jspPage/navigator_page.jsp"%></td>
												</tr>
											</c:if>
										</div>


										<div class="modal-footer">
											<center>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">关闭</button>
											</center>
											-
										</div>
									</div>
								</div>

								<!-- 							<div class="mark-sub"></div> -->
								<!-- 						</div> -->
								<!-- 						<div class="m-bd" id="Jtab01"> -->
								<!-- 							<div class="tab-cont" data-type="all" id="postlist"></div> -->
								<!-- 							<div class="tab-cont" data-type="author" style="display: none"></div> -->
								<!-- 						</div> -->
							</div>



							<!-- 									<a href="space-uid-18138531.html" class="avatar" rel="nofollow"> -->
							<!-- 										<img src="/uc_server/avatar.php?uid=18138531&amp;size=middle" -->
							<!-- 										width="80" height="80" alt="" rel="nofollow"> -->
							<!-- 									</a> -->
							 
							 
							 
							 
							 







							<div class="cl" style="position: relative; width: 667px;">
								<div class="hasfsl">
									<div class="tedt mtn">

										<div class="bar">
											<script type="text/javascript" src="static/js/seditor.js?OYW"></script>
											<div class="fpd">
												<a href="javascript:void(0);" target="_self" title="文字加粗"
													class="fbld"
													onclick="seditor_insertunit('fastpost', '[b]', '[/b]');doane(event);">B</a>
												<a href="javascript:void(0);" target="_self" title="设置文字颜色"
													class="fclr" id="fastpostforecolor"
													onclick="showColorBox(this.id, 2, 'fastpost');doane(event);">Color</a>
												<a id="fastpostimg" href="javascript:void(0);"
													target="_self" title="图片" class="fmg"
													onclick="seditor_menu('fastpost', 'img');doane(event);">Image</a>
												<a id="fastposturl" href="javascript:void(0);"
													target="_self" title="添加链接" class="flnk"
													onclick="seditor_menu('fastpost', 'url');doane(event);">Link</a>
												<a id="fastpostquote" href="javascript:void(0);"
													target="_self" title="添加引用文字" class="fqt"
													onclick="seditor_menu('fastpost', 'quote');doane(event);">Quote</a>
												<a id="fastpostcode" href="javascript:void(0);"
													target="_self" title="代码" class="fcd"
													onclick="seditor_menu('fastpost', 'code');doane(event);"{>Code</a>
												<a href="javascript:void(0);" target="_self" class="fsml"
													id="fastpostsml"
													onclick="showMenu({'ctrlid':this.id,'evt':'click','layer':2});return false;">Smilies</a>

												<script type="text/javascript" src="static/js/at.js?OYW"></script>
												<a id="fastpostat" href="javascript:void(0);" target="_self"
													title="@朋友" class="fat"
													onclick="seditor_menu('fastpost', 'at');doane(event);">@朋友</a>
												<span class="pipe z">|</span> <span
													id="spanButtonPlaceholder">上传</span>
											</div>
											
										</div>
								       
										 <div>
											<textarea rows="6" cols="80" name="replyContent"
												id="fastpostmessage12" value="a" maxlength="200">
												</textarea>
												
											<br /> <span>最多可以输入200个汉字 </span>
										</div> 
										
										
										<%--  <c:choose>
								          <c:when test="${ empty sessionScope.user }">
								              <div class="area">
                                                          <div class="pt hm  no-uid ">
                                                                                                                                                                                                            您需要登录后才可以回帖 <a href="${projectPath }/create/managerMoney/user/toLoginUI" class="xi2">登录</a> | <a href="${projectPath}/create/managerMoney/user/toRegistUI" class="xi2">注册</a>
                                                                                                                                                                                                                <!--{hook/global_login_text}-->
                                                            </div>
                                                            </div>
								          </c:when>
								          <c:otherwise>
								             <div>
											<textarea rows="6" cols="80" name="replContent"
												id="fastpostmessage12" value="a" maxlength="200">
												
												</textarea>
												
											<br /> <span>最多可以输入200个汉字 </span>
										</div>
								          </c:otherwise>
								        </c:choose> --%>
										
										
										
										
										
									</div>
								</div>
							</div>
                             
							<!-- <div class="mtm mbm pnpost cl"> -->
							<p class="ptm pnpost">
								<button type="button" class="pn pnc" name="topicsubmit" id="bt" onclick="replyPost()">
									发表评论
								</button>
								</p>
							<!-- </div> -->
							



						</div>
					</div>
				</div>
				<div class="col-c" id="JdetailSide">
					<div class="m-box box-autor">
						<div class="m-bd">
							<span href="/space-uid-18138531.html" class="info-author"
								rel="nofollow">
								<div class="avatar">
									<img src="${projectPath }/src/4.png"
										width="100" height="100" rel="nofollow" alt="">
								</div> <%-- 								<div class="username">${sessionScope.user.userName}</div> --%>
								<div class="username"><td>${user.userName }</td></div>
							</span>
							<ul class="list-matels">
							</ul>
						</div>
					</div>

					<div class="side-fixed-wrap" id="JsideFixedBox">
						<div class="m-box m-box-b">
							<div class="m-hd">
								<span class="mark">相关推荐</span>
							</div>
							<div class="m-bd">
								<ul class="list-txt" id="JdetailRecommend">
									<li><a href="#" target="_self" data-tid="1077450"><i
											class="before"></i>想摆脱月光女神成为理财女王？我送你几个秘方~</a></li>
									<li><a href="#" target="_self" data-tid="1039911"><i
											class="before"></i>【理财我在行】从新手上路到理财达人的蜕变</a></li>
									<li><a href="#" target="_self" data-tid="560638"><i
											class="before"></i>【我在郑州】记账三年，目前攒钱12万</a></li>
									<li><a href="#" target="_self" data-tid="481736"><i
											class="before"></i>随手记社区版块版主介绍 | 2015版</a></li>
									<li><a href="#" target="_self" data-tid="403590"><i
											class="before"></i>【新人报道】--------镜花水月</a></li>
								</ul>
							</div>
						</div>
						<div class="m-box m-box-b"></div>
						<div class="m-box m-box-b">
							<div class="m-hd">
								<span class="mark">下载客户端</span>
							</div>
							<div class="m-bd">
								<div class="downloads">
									<span class="qr-code"><img
										src="${projectPath }/src/3.png" alt="" width="108"
										height="108"></span>
									<div class="bfc">
										<span class="tit">遛遛遛客户端</span> <span class="sub-tit">直接扫描下载</span>
										<span href="#" target="_self" class="icon-ios" rel="nofollow">ios</span>
										<span href="#" target="_self" class="icon-android" rel="nofollow">android</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%-- <div class="g-footer">
			<div class="backtop" id="Jbacktop">
				<div class="backtop-text">返回顶部</div>
			</div>
			<div class="l-main">
				<div class="col-de">
					<div class="footer-links-wrap">
						<ul>
							<li class="title"><strong>产品下载</strong></li>
							<li><a href="#" target="_self" rel="nofollow">随手记</a></li>
							<li><a href="#" target="_self" rel="nofollow">随管家</a></li>
							<li><a href="#" target="_self" rel="nofollow">卡牛管家</a></li>
						</ul>
						<ul>
							<li class="title"><strong>了解我们</strong></li>
							<li><a href="#" target="_self" rel="nofollow">关于我们</a></li>
							<li><a href="#" target="_self" rel="nofollow">联系我们</a></li>
							<li><a href="#" target="_self" rel="nofollow">加入我们</a></li>
						</ul>
						<ul>
							<li class="title"><strong>关注我们</strong></li>
							<li><a href="#" target="_self" rel="nofollow">新浪微博</a></li>
							<li><a href="#" target="_self" rel="nofollow">腾讯微博</a></li>
							<li><a href="#" target="_self" rel="nofollow">官方博客</a></li>
						</ul>
						<ul>
							<li class="title"><strong>其他信息</strong></li>
							<li><a href="#" target="_self" rel="nofollow">理财频道</a></li>
							<li><a href="#" target="_self" rel="nofollow">服务条款</a></li>
							<li><a href="#" target="_self" rel="nofollow">友情链接</a></li>
						</ul>
					</div>
					<div class="ssj-links-info">
						<div class="relevant-links">
							<a href="javascript:void(0)" title="首页" rel="nofollow">首页</a>|<a
								href="javascript:void(0)" title="记账"
								rel="nofollow">记账</a>|<a href="javascript:void(0)"
								title="社区" rel="nofollow">社区</a>|<a href="javascript:void(0)"
								title="理财" rel="nofollow">理财</a>
						</div>
						<p>
							Copyright © 1993-2017 Feidee.All Rights Reserved. &nbsp;<a
								target="_blank" href="javascript:void(0)"
								rel="nofollow">粤ICP备6666666号 -8</a>
						</p>
						<p>深圳市尚硅谷遛遛遛科技有限公司 地址：深圳市宝安区南区科技南十二路 西部硅谷大厦三层左拐</p>
					</div>
				</div>
				<div class="col-f">
					<div class="ssj-service">
						<p>
							<span>客服热线：</span>(周一至周五 9:00--18:00)
						</p>
						<em class="tel">400-698-8018</em>
						<p>客服电话：0755-84355483&nbsp;&nbsp;0755-61808666</p>
						<p>QQ客服：<img border="true" oncontextmenu="return false;" src="${projectPath }/src/9.jpg" name="seal">
					</p>
						<p class="certification">安全认证</p>
						<div class="certificate-security">
							<div class="link-ssl">
								<a tabindex="-1"
									href="javascript:void(0)"
									target="_blank" rel="nofollow"> <img border="true"
									oncontextmenu="return false;"
									src="${projectPath }/src/5.png"
									name="seal">
								</a>
							</div>
							<div class="link-wj">
								<a tabindex="-1"
									href="javascript:void(0)"
									target="_blank" rel="nofollow"> <img border="true"
									oncontextmenu="return false;"
									src="${projectPath }/src/6.png"
									name="seal">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> --%>
	</div>

	<script src="http://bbsimg.feidee.com/static/js/popup.js?T1h"></script>
	<script src="http://bbsimg.feidee.com/static/js/header.js?T1h"></script>
	<script src="http://bbsimg.feidee.com/static/js/pc_datacollect.js?T1h"></script>
	<script
		src="http://bbsimg.feidee.com/static/js/pc_datacollect_action.js?T1h"></script>

	<script>
		var recordData = new Date();
		var j_uid = '0';
		var j_username = '';
		var j_credits = '0';
		var j_email = '';
		function recordLogin(uid) {
			localStorage.setItem('recordLogin_' + uid, recordData.getDate());
			var recordLoginInfo = new Image();
			recordLoginInfo.onload = function() {
				console.log('recordLoginInfo');
			};
			recordLoginInfo.src = document.location.protocol
					+ '//bbs.feidee.com/m/recordLoginInfo.php?type=insert&uid='
					+ j_uid + '&platform=pc&username=' + j_username
					+ '&credits=' + j_credits + '&email=' + j_email
					+ '&source=' + document.domain;
		}

		//
		window.subComment && window.subComment();
	</script>
	<script src="http://bbsimg.feidee.com/static/js/jquery.slide.js?T1h"></script>
	<script src="http://bbsimg.feidee.com/static/js/detail_perfect.js?T1h"></script>
	<script src="http://bbsimg.feidee.com/static/js/forum.js?T1h"></script>
	<script>
		Comment(jQuery('#Jtab01').find('.tab-cont').eq(0));
		Comment(jQuery('#Jtab01').find('.tab-cont').eq(1));
		var bdPic = "";
		window._bd_share_config = {
			"common" : {
				"bdSnsKey" : {
					"tsina" : "3426171471",
					"qzone" : "Pj9E3BaY5hQQQBPr"
				},
				"bdText" : "【2017年下半年规划】调整投资比例，股市涉水",
				"bdDesc" : "",
				"bdMini" : "1",
				"bdMiniList" : false,
				"bdPic" : bdPic,
				"bdStyle" : "2"
			},
			'share' : [ {
				"tag" : "share_1"
			}, {
				"tag" : "share_2"
			} ]
		};
		with (document)
			0[(getElementsByTagName('head')[0] || body)
					.appendChild(createElement('script')).src = '/static/api/js/share.js?v=89860593.js?cdnversion='
					+ ~(-new Date() / 36e5)];

		(function() {
			var bp = document.createElement('script');
			var curProtocol = window.location.protocol.split(':')[0];
			if (curProtocol === 'https') {
				bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
			} else {
				bp.src = 'http://push.zhanzhang.baidu.com/push.js';
			}
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(bp, s);
		})();
	</script>
	<script type="text/javascript">
		new lazyload();
	</script>
	<!--新增卡片业务-->
	<script src="http://bbsimg.feidee.com/static/js/finance_card.js?T1h"></script>
	<!-- ga上报代码调用 -->
	<script type="text/javascript">
		var fid = fid || 0;
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-251384-16' ]);
		_gaq.push([ '_trackPageview' ]);
		if (typeof (fid) == "number") {
			_gaq.push([ '_trackEvent', 'service' + fid, 'clicked', 'service' ]);
		};
		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
</body>
</html>