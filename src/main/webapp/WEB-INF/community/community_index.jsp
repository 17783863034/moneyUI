<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- <%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>遛遛遛理财社区 - 总有那么一群人对待生活很认真！</title>
<script type="text/javascript" src="${projectPath }/bootstrap/jquery-1.10.1.js"></script>
<script type="text/javascript" src="${projectPath }/js/bootstrap.js"></script>  
<script type="text/javascript" src="${projectPath }/My97DatePicker/WdatePicker.js"></script>  
<link type="text/css" rel="stylesheet" href="${projectPath}/css/bootstrap.css" >
<link type="text/css" rel="stylesheet" href="${projectPath}/css/bootstrap-theme.css" >
<link type="text/css" rel="stylesheet" href="${projectPath}/css/my.css" >

<meta name="keywords"
	content="随手记,随手记论坛,随手记理财社区,随手记社区,随手记pc版,随手记电脑板,随手记Android版,随手记安卓版,随手记iPhone版,随手记iPad版,随手记win8版,记账就要随手记,卡牛,卡牛Android,卡牛iPhone,信用卡理财" />
<meta name="description"
	content="随手记理财社区,国内最专业的理财论坛！提供基金、银行、保险、股票、p2p等多种理财产品的理财技巧，您还可以与众多专业投资者探讨家庭理财、私人理财的方法.助您早日实现财富增值！" />
<meta charset="utf-8">
<link rel="stylesheet"
	href="http://bbsimg.feidee.com/static/css/reset.css?OYW">
<link rel="stylesheet"
	href="http://bbsimg.feidee.com/static/css/common.css?OYW">
<link rel="stylesheet"
	href="http://bbsimg.feidee.com/static/css/modules.css?OYW">
<link rel="stylesheet"
	href="http://bbsimg.feidee.com/static/css/utils.css?OYW">
<script>
	var G = {
 		uid : '0', 
 		username : '', 
		allowtonewpc : ''
	}; 
 	var STYLEID = '3', STATICURL = 'https://bbsimg.feidee.com/static/', IMGDIR = '//bbsimg.feidee.com/static/image/common/', VERHASH = 'OYW', charset = 'utf-8', discuz_uid = '0', cookiepre = 'QIlu_2132_', cookiedomain = '', cookiepath = '/', showusercard = '1', attackevasive = '0', disallowfloat = 'login|newthread|reply', creditnotice = ' 2|社区积分| ', defaultstyle = '', REPORTURL = 'aHR0cDovL2Jicy5mZWlkZWUuY29tL2ZvcnVtLnBocD9mZD15ZXM=', SITEURL = 'http://bbs.feidee.com/', JSPATH = 'static/js/'; 
 </script>
<!-- <script src="http://bbsimg.feidee.com/static/js/jquery-1.9.1.min.js?OYW"></script> -->
<!-- <script src="http://bbsimg.feidee.com/static/js/new_common.js?OYW"></script> -->

<link rel="stylesheet"
	href="http://bbsimg.feidee.com/static/css/home.css?OYW">

<base target="_blank">

<!--[if IE 6]><script>document.execCommand("BackgroundImageCache", false, true)</script><![endif]-->
</head>
<body>
    
	<div id="append_parent"></div>
		<div id="ajaxwaitid"></div>
    	<div class="g-doc">
            <div class="g-header">
			<div class="l-main">
<!-- 	<div class="container"> -->
		<%@ include file="/public_page/page_head.jsp"%>

		<div class="m-header">
			<%-- <a href="javascript:void(0);" class="logo"> <img src="${projectPath}/src/111111.png" alt="" width="126" 
 				height="36"></a>  --%>
				 
				<span class="btn-wrap"> <a
				href="${projectPath }/create/managerMoney/community/toPostPage" class="btn btn-post"
				 rel="nofollow">发帖</a>

			</span>
			<%-- <div class="nav-main">
				<ul>
					<li class="s-cur"><a href="${projectPath}/community/toCommunityPage/1" rel="nofollow">社区首页</a></li>

					<!-- <li ><a href="">精选专题</a></li> -->
				</ul>
			</div> --%>

		</div>

	

	<div class="g-main">
		<div class="b-main">
			<div class="col-mb">
				<div class="m-focus" id="JfocusPic">
					<div class="slide-wrap">
						<a href="javascript:void(0);" target="_self" class="btn btn-prev"></a>
						<a href="javascript:void(0);" target="_self" class="btn btn-next"></a>
						<ul class="pics">
							<li class="pic"><a
								href="javascript:void(0)"> <img
									src="http://bbsimg.feidee.com/data/attachment/forum/course/image/149795071679182.jpg"
									width="586" height="340" alt="">
							</a></li>
							<li class="pic"><a
								href="javascript:void(0)"> <img
									src="http://bbsimg.feidee.com/data/attachment/forum/course/image/149795074625605.png"
									width="586" height="340" alt="">
							</a></li>
							<li class="pic"><a
								href="javascript:void(0)"> <img
									src="http://bbsimg.feidee.com/data/attachment/forum/course/image/147444397995137.jpg"
									width="586" height="340" alt="">
							</a></li>
						</ul>
						<div class="focus-ctrl" id="JfocusCtrl">
							<div id="f-ctrl-box"></div>
						</div>
					</div>
				</div>
				<div class="m-oh">
					<ul class="list-recommond-topic" id="JindexRecommondTopicList">
						<li class="item-first"><a href="javascript:void(0)"
							title="讨论：手机在我们生活中究竟有多重要？" data-tid="1137287"><i
								class="icon-top"></i>讨论：手机在我们生活中究竟有多重要？</a></li>
						<li><a href="#"  target="_self" title="重男轻女，那些不能言说的痛！"
							data-tid="1124723"><i class="before"></i>重男轻女，那些不能言说的痛！</a></li>
						<li><a href="#" target="_self" title="零基础小白如何跨出理财第一步"
							data-tid="1141686"><i class="before"></i>零基础小白如何跨出理财第一步</a></li>
						<li class="item-first"><a href="javascript:void(0)"
							title="攒钱，需要对自己狠吗？" data-tid="1126916"><i class="icon-good"></i>攒钱，需要对自己狠吗？</a></li>
						<li><a href="#" target="_self"
							title="平民暴富路：从屌丝走向土豪，你只差一个风口" data-tid="1125413"><i
								class="before"></i>平民暴富路：从屌丝走向土豪，你只差一个风口</a></li>
						<li><a href="#" target="_self"
							title="做好这3件事情，选出靠谱的主动型基金" data-tid="1114692"><i
								class="before"></i>做好这3件事情，选出靠谱的主动型基金</a></li>
					</ul>
				</div>
				<div class="m-recommend m-box m-box-b">
					<div class="m-hd">
						<span class="mark">精品栏目</span>
					</div>
					<div class="m-bd">
						<ul class="list-forum-b" id="JindexListForumB">
							<li><a href="javascript:void(0)" target="_self" data-tid="1156851">
									<span class="area-pic"><img
										src="http://bbsimg.feidee.com/data/attachment/forum/course/image/147634950761217.png"
										alt="" width="80" height="60"></span> <span class="area-txt">
										<span class="title">#每日话题#</span> <span class="des"
										title="上市公司停复牌一览">上市公司停复牌一览</span>
								</span>
							</a></li>
							<li><a href="javascript:void(0)" target="_self" data-tid="720520">
									<span class="area-pic"><img
										src="http://bbsimg.feidee.com/data/attachment/forum/course/image/148157099219966.png"
										alt="" width="80" height="60"></span> <span class="area-txt">
										<span class="title">#理财问答#</span> <span class="des"
										title="是买房好呢？还是投资理财？">是买房好呢？还是投资理财？</span>
								</span>
							</a></li>
							<li><a href="javascript:void(0)" target="_self" data-tid="1093300">
									<span class="area-pic"><img
										src="http://bbsimg.feidee.com/data/attachment/forum/course/image/147634951819972.png"
										alt="" width="80" height="60"></span> <span class="area-txt">
										<span class="title">#理财课堂#</span> <span class="des"
										title="【视频&middot;两分钟充电站No.14】买这个保险，生老病死都有钱拿">【视频&middot;两分钟充电站No.14】买这个保险，生老病死都有钱拿</span>
								</span>
							</a></li>
							<li class="last"><a href="javascript:void(0)" target="_self"
								data-tid="1148700"> <span class="area-pic"><img
										src="http://bbsimg.feidee.com/data/attachment/forum/course/image/147807528636714.jpg"
										alt="" width="80" height="60"></span> <span class="area-txt">
										<span class="title">#稳盈之家#</span> <span class="des"
										title="随の故事|揭秘 随手记的&ldquo;后台&rdquo;竟是他们!">随の故事|揭秘
											随手记的&ldquo;后台&rdquo;竟是他们!</span>
								</span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
                    
		<div class="l-main">
			<div class="col-ab">
				<div class="m-box">
					<div class="m-hd">
						<span class="mark">热门推荐</span>
					</div>
					<div class="m-bd">
						<c:if test="${!empty requestScope.page.list }">
							<!-- 遍历post -->
							<c:forEach items="${requestScope.page.list }" var="post">
								<!-- 									begin="0" end="4" step="1"> -->
								<tr>
									<!-- 										<td>1</td></br> -->
									</br>
									 用户:<td>${post.userId }</td>发表了  
									<a href="${projectPath }/create/managerMoney	/community/postShow/${ post.postId}">标题
										：
										<td>${post.postTitle}</td>
								 
									</br>
										<td>${post.postContent}</td>
									</br>
									  </a>
									<td></td>
									<td>
									<div align="right">
								    <td>${post.dataTime}</td>
									</div>
								    
									</td>
									<hr />
									
									<%-- 										<td><fmt:formatDate value="${post.dataTime}"  <span style="color:#ff0000;">pattern="yyyy-MM-dd HH:mm:ss"</span> /></td></br> --%>
									<!-- 										<div class="btn-more-recommond-wrap"> -->
									<!-- 											<a href="javascript:void(0)" target="_self" -->
									<!-- 												class="btn btn-more-recommond" id="JmoreRecommond">查看更多推荐<i -->
									<!-- 												class="fd-iconfont arrow-down">&#xe613;</i></a> -->
									<!-- 										</div> -->
								</tr>

							</c:forEach>
							<tr>
								<td colspan="7"><c:set
										value="${projectPath }/create/managerMoney/community/toCommunityPage"
										var="targetUrl" scope="page" /> <%@ include
										file="/jspPage/navigator_page.jsp"%></td>
							</tr>

						</c:if>
					</div>
				</div>
			</div>
			<div class="col-c">
				<div class="m-tab">
					<ul class="control" id="Jtab01-controler">
						<li class="current">日排行榜</li>

					</ul>
					<div id="Jtab01" class="tab">
						<div class="tab-cont" style="display: block">
							<ul class="list-rank" id="JrankDay">
								<li class="rank1  no-pic "><a
									href="javascript:void(0)" target="_self"
									title="新人必看：玩转随手记理财社区&mdash;&mdash;看更多，赚更多" data-tid="472516">
										<span class="stit"><i class="num">1</i>新人必看：玩转随手记理财社区&mdash;&mdash;看更多，赚更多</span>
								</a></li>
								<li class="rank2 "><a href="javascript:void(0)" target="_self"
									title="月入3K的职场新人，如何靠理财逆袭" data-tid="1146619"> <span
										class="stit"><i class="num">2</i>月入3K的职场新人，如何靠理财逆袭</span>
								</a></li>
								<li class="rank3 "><a href="javascript:void(0)" target="_self"
									title="现金运动红包已送达，速戳" data-tid="1100534"> <span class="stit"><i
											class="num">3</i>现金运动红包已送达，速戳</span>
								</a></li>
								<li class="rank4 "><a href="javascript:void(0)" target="_self"
									title="【讨论帖】结婚后，你能接受夫妻AA制么？" data-tid="1145252"> <span
										class="stit"><i class="num">4</i>【讨论帖】结婚后，你能接受夫妻AA制么？</span>
								</a></li>
								<li class="rank5 "><a href="javascript:void(0)" target="_self"
									title="王者荣耀遭各方怒怼，力挺贾跃亭的刘强东这回为何噤声了？" data-tid="1151420"> <span
										class="stit"><i class="num">5</i>王者荣耀遭各方怒怼</span>
								</a></li>
								<li class="rank6 "><a href="javascript:void(0)" target="_self"
									title="【点击我回复签到】0709日签到送积分" data-tid="1152936"> <span
										class="stit"><i class="num">6</i>【点击我回复签到】0709日签到送积分</span>
								</a></li>
								<li class="rank7 "><a href="javascript:void(0)" target="_self"
									title="学会这五种方法，即使首付不够也能买房！" data-tid="1151422"> <span
										class="stit"><i class="num">7</i>学会这五种方法，即使首付不够也能买房！</span>
								</a></li>
								<li class="rank8 "><a href="javascript:void(0)" target="_self"
									title="手把手教你零基础个人记账" data-tid="810151"> <span class="stit"><i
											class="num">8</i>手把手教你零基础个人记账</span>
								</a></li>
								<li class="rank9 "><a href="javascript:void(0)" target="_self"
									title="刚刚,我参加随粉晒照代盐赛，能赢1088京东购物卡" data-tid="1148588"> <span
										class="stit"><i class="num">9</i>刚刚,我参加随粉晒照代盐赛，能赢1088京东购物卡</span>
								</a></li>
								<li class="rank10 "><a href="javascript:void(0)" target="_self"
									title="随の故事|揭秘 随手记的&ldquo;后台&rdquo;竟是他们!" data-tid="1148700">
										<span class="stit"><i class="num">10</i>随の故事|揭秘
											随手记的&ldquo;后台&rdquo;竟是他们!</span>
								</a></li>
							</ul>
						</div>

					</div>
				</div>
				<div class="m-box m-box-c" id="JhotReply"></div>
				<div class="m-box m-box-c">
					<div class="m-hd">
						<span class="mark">关注走一波</span>
					</div>
					<div class="m-bd">
						<div class="downloads">
							<span class="qr-code"><img
								src="${projectPath }/src/3.png" alt="" width="108"
								height="108"></span>
							<div class="bfc">
								<span class="tit">666客户端</span> <span class="sub-tit">直接扫描下载</span>
								<span href="#" target="_self" rel="nofollow" class="icon-ios">ios</span> <span href="#" target="_self"
									rel="nofollow" class="icon-android">android</span>
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
						<li><a href="#" target="_self"rel="nofollow">理财频道</a></li>
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
							target="_blank" href="javascript:void(0)" rel="nofollow">粤ICP备6666666号 -8
							</a>
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
<!-- 	</div> -->
	</div>
	</div>
	</div>
	

	<script src="http://bbsimg.feidee.com/static/js/popup.js?OYW"></script>
	<script src="http://bbsimg.feidee.com/static/js/header.js?OYW"></script>
	<script src="http://bbsimg.feidee.com/static/js/pc_datacollect.js?OYW"></script>
	<script
		src="http://bbsimg.feidee.com/static/js/pc_datacollect_action.js?OYW"></script>

	<script src="http://bbsimg.feidee.com/static/js/jquery.slide.js?OYW"></script>
	<script src="http://bbsimg.feidee.com/static/js/jquery.marquee.js?OYW"></script>
	<!-- <script src="http://bbsimg.feidee.com/static/js/dialog2.js?OYW"></script> -->
	<script src="http://bbsimg.feidee.com/static/js/home_prefect.js?OYW"></script>
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