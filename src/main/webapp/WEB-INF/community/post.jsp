<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="from"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>发表帖子 - 遛遛遛理财社区</title>

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


<meta name="keywords" content="" />
<meta name="description" content="随手记理财社区" />
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://bbsimg.feidee.com/static/css/reset.css?OYW">
<link rel="stylesheet"
	href="https://bbsimg.feidee.com/static/css/common.css?OYW">
<link rel="stylesheet"
	href="https://bbsimg.feidee.com/static/css/modules.css?OYW">
<link rel="stylesheet"
	href="https://bbsimg.feidee.com/static/css/utils.css?OYW">
<!-- <script -->
<!-- 	src="https://bbsimg.feidee.com/static/js/jquery-1.9.1.min.js?OYW"></script> -->
<!-- <script src="https://bbsimg.feidee.com/static/js/new_common.js?OYW"></script> -->

<link rel="stylesheet" type="text/css"
	href="data/cache/style_3_forum_post.css?OYW" />
<style rel="stylesheet">
/*
    Editor CSS file for Discuz! X
    (C) Comsenz Inc.
    http://www.comsenz.com
    */
.edt {
	border: 1px solid;
	border-color: #999 #CCC #CCC #999;
}

.edt .bar {
	padding: 4px;
	height: 44px;
	border-bottom: 1px solid #DDD;
	background: COMMONBG;
}

.edt .cst {
	background: COMMONBG;
	border-bottom: 1px solid #DDD;
}

.edt .cst.nbb {
	border-bottom: none !important;
}

.edt .bbar {
	height: 20px;
	border-top: 1px solid #DDD;
	text-align: right;
	background: COMMONBG;
}

.edt .bbar img {
	vertical-align: bottom;
	*margin-right: -4px;
	cursor: row-resize;
}

.edt .bbar em {
	width: 200px;
	height: 20px;
	overflow: hidden;
	white-space: nowrap;
	float: left;
	text-align: left;
}

.edt .bbar, .edt .bbar a {
	color: #999;
}

.edt .btn {
	float: left;
	border-right: 1px solid #FEFEFE;
}

.edt .b1r, .edt .b2r {
	position: relative;
	float: left;
	padding: 0 3px;
	height: 44px;
	border-right: 1px solid #DDD;
	border-left: 1px solid #FEFEFE;
}

.edt .b2r p, .edt .b2r br {
	clear: both;
}

.edt .bar a {
	float: left;
	border: 1px solid COMMONBG;
	background: transparent
		url(https://bbsimg.feidee.com/static/image/editor/editor.gif)
		no-repeat 0 0;
	overflow: hidden;
}

.edt .b1r a {
	padding-top: 27px;
	width: 35px;
	height: 15px;
	text-align: center;
	font-size: 11px;
	font-family: Arial, PMingLiU, sans-serif;
	-webkit-text-size-adjust: none;
}

.edt .b2r a {
	width: 20px;
	height: 20px;
	text-indent: -9999px;
}

.edt .b2r a.dp {
	margin-right: 1px;
	padding-left: 2px;
	width: 78px;
	height: 20px;
	text-indent: 0;
	border-color: INPUTBORDERDARKCOLOR INPUTBORDER INPUTBORDER
		INPUTBORDERDARKCOLOR;
	background: #FFF
		url(https://bbsimg.feidee.com/static/image/common/newarow.gif)
		no-repeat 100% 0;
}

.edt .b2r a:hover.dp {
	border-color: #09C;
	background-position: 100% -23px;
}

.edt .nbl {
	border-left: none;
	padding-left: 0;
}

.edt .nbr {
	border-right: none;
	padding-right: 0;
}

.edt .bar a:hover, .edt .bar a.hover {
	border-color: #09C;
	background-color: WRAPBG;
	text-decoration: none;
}

.edt .bar a.tblbtn_disabled:hover, .edt .bar a.hd_dsb:hover {
	border-color: COMMONBG !important;
	background-color: transparent !important;
	cursor: default;
}

.edt .area {
	padding: 4px;
	background: WRAPBG;
	zoom: 1;
}

.edt .pt {
	padding: 0 !important;
	width: 100%;
	height: 400px;
	border: none;
	background: WRAPBG none;
	font-size: MSGFONTSIZE;
}

.ie8 .edt .pt {
	width: 800px;
	max-width: 100%;
	min-width: 100%;
}

.edt .pt:focus {
	outline: none;
	-moz-box-shadow: none;
}

.edt a.cst {
	background-image: none;
	text-align: center;
	text-indent: 0;
}

.edt a.cst img {
	vertical-align: middle;
}

.simpleedt .bar, .simpleedt .b1r, .simpleedt .b2r {
	height: 22px;
}

.bar_swch {
	display: block;
	clear: both;
}

#e_bold {
	background-position: 0 0;
}

#e_fontsize {
	width: 45px;
}

#e_italic {
	background-position: -20px 0;
}

#e_underline {
	background-position: -40px 0;
}

#e_forecolor {
	background-position: -60px 0;
}

#e_backcolor {
	background-position: -80px 0;
}

#e_url {
	background-position: -40px -20px;
}

#e_unlink {
	background-position: -60px -20px;
}

#e_justifyleft {
	background-position: -80px -20px;
}

#e_justifycenter {
	background-position: -240px -40px;
}

#e_justifyright {
	background-position: -260px -40px;
}

#e_autotypeset {
	background-position: -220px -40px;
}

#e_floatleft {
	background-position: -100px -60px;
}

#e_floatright {
	background-position: -120px -60px;
}

#e_insertorderedlist {
	background-position: -100px -20px;
}

#e_insertunorderedlist {
	background-position: 0 -60px;
}

#e_inserthorizontalrule {
	background-position: -20px -60px;
}

#e_tbl {
	background-position: -160px -20px;
}

.tblbtn_disabled {
	background-position: -180px -20px !important;
}

#e_tool {
	background-position: 0 -40px;
}

#e_undo {
	background-position: -20px -40px;
}

#e_redo {
	background-position: -40px -40px;
}

#e_removeformat {
	background-position: -60px -40px;
}

#e_tpr {
	background-position: -80px -40px;
}

#e_chck {
	background-position: -100px -40px;
}

#e_hide {
	background-position: -120px -40px;
}

.hd_dsb {
	background-position: -200px -40px !important;
}

#e_free {
	background-position: -140px -40px;
}

#e_svd {
	background-position: -160px -40px;
}

#e_rst {
	background-position: -180px -40px;
}

#e_sml {
	background-position: -3px -80px;
}

.b2r #e_sml {
	background-position: -20px -20px;
}

#e_image {
	background-position: -43px -80px;
}

.b2r #e_image {
	background-position: 0 -20px;
}

#e_attach {
	background-position: -83px -80px;
}

.b2r #e_attach {
	background-position: -200px -20px;
}

#e_code {
	background-position: -123px -80px;
}

.b2r #e_code {
	background-position: -120px -20px;
}

#e_quote {
	background-position: -163px -80px;
}

.b2r #e_quote {
	background-position: -140px -20px;
}

#e_pasteword {
	background-position: -60px -60px;
}

#e_downremoteimg {
	background-position: -80px -60px;
}

#e_fls {
	background-position: -3px -120px;
}

.b2r #e_fls {
	background-position: -260px -20px;
}

#e_aud {
	background-position: -43px -120px;
}

.b2r #e_aud {
	background-position: -220px -20px;
}

#e_vid {
	background-position: -83px -120px;
}

.b2r #e_vid {
	background-position: -240px -20px;
}

#e_at {
	background-position: -126px -120px;
}

.b2r #e_at {
	background-position: -140px 0;
}

#e_imagen, #e_attachn {
	position: absolute;
	top: 3px;
	left: 63px;
	width: 14px;
	height: 15px;
	background:
		url(https://bbsimg.feidee.com/static/image/editor/editor.gif)
		no-repeat -244px -80px;
	text-indent: -9999px;
}

#e_attachn {
	left: 100px;
}

.b2r #e_imagen, .b2r #e_attachn {
	top: -4px;
	left: 35px;
}

.b2r #e_attachn {
	left: 57px;
}

#e_switcher input {
	margin-right: 4px;
	vertical-align: middle;
}

#e_simple, #e_fullswitcher {
	padding: 0 2px;
	text-align: right;
	border: 1px solid SPECIALBORDER;
	background: url(//bbsimg.feidee.com/static/image/common//card_btn.png)
		repeat-x 0 100%;
}

#e_fullswitcher {
	margin-right: 3px;
}
/* 缩小编辑器演出菜单中输入框的尺寸 */
.popupfix .px {
	margin-bottom: 4px;
}

#e_body {
	display: block !important;
}

#e_body_loading {
	display: none;
}

/*
        Name:			mod_editor_menu
        Level:			Function
        Explain:		编辑器弹层关闭按钮在 IE8 下有问题
        Last Modify:	Pony
    */
.ie8 .editortoolbar .flbc {
	position: relative;
}
</style>
<link rel="stylesheet" href="/static/css/post.css?OYW" />
<script src="https://bbsimg.feidee.com/static/js/smilies.js?OYW"></script>
<script src="https://bbsimg.feidee.com/static/js/forum.js?OYW"></script>

<!--[if IE 6]><script>document.execCommand("BackgroundImageCache", false, true)</script><![endif]-->
<script>
	function check() {
		var regC = /[^ -~]+/g;
		var regE = /\D+/g;
		var str = t1.value;

		if (regC.test(str)) {
			t1.value = t1.value.substr(0, 500);
		}

		if (regE.test(str)) {
			t1.value = t1.value.substr(0, 1000);
		}
	}
</script>


<script type="text/javascript">
	$(function() {
		$("#replyBTN").click(
				function() {
					var postTitle = $("#postTitle").val();
					var postContent = $("#postContent").val();
					if ($.trim(postTitle) != "" && $.trim(postTitle) != null
							&& $.trim(postContent) != ""
							&& $.trim(postContent) != null) {
						alert("发帖成功");
						return true;
					} else {
						alert("帖子内容或标题为空，发帖失败！");
						return false;
					}
				});
	});
</script>
</head>
<body>
	<!-- 		<div class="container"> -->

	<%@ include file="/public_page/page_head.jsp"%>


	<script src="https://bbsimg.feidee.com/static/js/forum_post.js?OYW"
		type="text/javascript"></script>

	<div class="g-main">
		<div class="l-main">
			<div class="m-box">
				<div class="editor-nav">
					<div class="n-tab">
						<span class="btn btn-primary btn-lg">发表帖子</span>
					</div>

					<!-- 						<div class="cur-line"></div> -->
				</div>


				<div class="editor-body">
					<form
						action="${projectPath }/create/managerMoney/community/savePost"
						method="post">


						<div class="pbt cl ">
							<div class="ctrl forum-id"></div>
							 <div class="z" id="e_title">
								<span><input type="text" class="px" name="postTitle"
									id="postTitle"
									onblur="if($('tags')){relatekw('-1','-1'  );doane();}"
									onkeyup="strLenCalc(this, 'checklen', 80);"
									placeholder="点此输入标题" /></span> <span id="subjectchk"><span
									id="checklen">80</span>/80</span>
							</div> 

							<!-- <div class="z" id="e_title">
								<span><input type="text" name="postTitle" id="postTitle"
									class="px" value=""
									onblur="if($('tags')){relatekw('-1','-1'  );doane();}"
									onkeyup="strLenCalc(this, 'checklen', 80);" tabindex="1"
									placeholder="点此输入标题" /></span> <span id="subjectchk"><span
									id="checklen">80</span>/80</span>
							</div> -->
						</div>


						<div class="edt " id="e_body" style="display: none">


							<div class="area">
								<textarea name="postContent" class="pt" id="postContent"
									rows="15" maxlength="500"></textarea>
								<span>最多可以输入500个汉字 </span>
							</div>

						</div>
						<div class="mtm mbm pnpost cl">
							<button class="pn pnc" id="replyBTN" onclick="post1()"
								name="topicsubmit">发表</button>
						</div>

					</form>




					<%-- <form action="${projectPath}/community/savePost" method="post">
						   <c:choose>
							<c:when test="${ empty sessionScope.user }">
							    <div class="area">
												<div class="pt hm  no-uid ">
													您需要登录后才可以发帖 <a href="${projectPath }/create/managerMoney/user/toLoginUI" class="xi2">登录</a> | <a href="${projectPath}/create/managerMoney/user/toRegistUI"
														class="xi2">注册</a>
												</div>
											</div>
							</c:when>
							<c:otherwise>
							<div class="pbt cl ">
								<div class="ctrl forum-id"></div>
								<div class="z">
									<span><input type="text" name="postTitle" id="someNameInputId"
										tabindex="1"
										 placeholder="点此输入标题" /></span> <span
										id="subjectchk"><span id="checklen">80</span>/80</span>
								</div>
							</div>
							<div class="edt " id="e_body" style="display: none">
								<script>
									function check() {
										var regC = /[^ -~]+/g;
										var regE = /\D+/g;
										var str = t1.value;

										if (regC.test(str)) {
											t1.value = t1.value.substr(0, 500);
										}

										if (regE.test(str)) {
											t1.value = t1.value.substr(0, 1000);
										}
									}
								</script>

								<div class="area">
									<textarea name="postContent" class="pt" id="postContent"
										rows="15" onkeyup="check();" maxlength="500" tabindex="2"></textarea><span>最多可以输入200个汉字 </span>
								</div>

							</div>
							<div class="mtm mbm pnpost cl">
								<a class="pn pnc"
									 name="topicsubmit" onclick="sendPost()">
									<span>发表帖子</span>
								</a>
							</div>
							</c:otherwise>
							</c:choose>
						</form> --%>

				</div>
				<iframe name="ajaxpostframe" id="ajaxpostframe"
					style="display: none;"></iframe>

				<div id="e_menus" class="editorrow"
					style="overflow: hidden; margin-top: -5px; height: 0; border: none; background: transparent;">
					<div id="e_editortoolbar" class="editortoolbar"></div>

					<script type="text/javascript">
						smilies_show('smiliesdiv', 12, editorid + '_');
					</script>
					<!--{block creditstring}-->
					<!--{/block}-->

					<script type="text/javascript" src="static/js/swfupload.js?OYW"></script>
					<script type="text/javascript"
						src="static/js/swfupload.queue.js?OYW"></script>
					<script type="text/javascript" src="static/js/handlers.js?OYW"></script>
					<script type="text/javascript" src="static/js/fileprogress.js?OYW"></script>

					<div class="p_pof" id="e_image_menu" style="display: none"
						unselectable="on">
						<table width="100%" cellpadding="0" cellspacing="0" class="fwin">

							<tr>
								<td class="t_l"></td>
								<td class="t_c"></td>
								<td class="t_r"></td>
							</tr>
							<tr>
								<td class="m_l">&nbsp;&nbsp;</td>
								<td class="m_c">
									<div class="mtm">



										<div unselectable="on" id="e_local" style="display: none;">
											<div class="p_opt">
												<table cellpadding="0" cellspacing="0" border="0"
													width="100%">
													<tbody id="imgattachbodyhidden" style="display: none">
														<tr>
															<td class="atnu"><span id="imglocalno[]"><img
																	src="https://bbsimg.feidee.com/static/image/filetype/common_new.gif" /></span>
															</td>
															<td class="atna"><span id="imgdeschidden[]"
																style="display: none"> <span id="imglocalfile[]"></span>
															</span><input type="hidden" name="imglocalid[]" /></td>
															<td class="attc"><span id="imgcpdel[]"></span></td>
														</tr>
													</tbody>
												</table>
												<div class="p_tbl">
													<div
														style="margin-left: 35px; margin-right: 35px; width: 760px; margin-top: 10px; height: auto; max-height: 300px;">
														<table cellpadding="0" cellspacing="0"
															summary="post_attachbody" border="0" width="100%">
															<tbody id="imgattachbody"></tbody>
														</table>
													</div>
												</div>


											</div>

										</div>


										<!--{hook/post_image_tab_extra}-->
									</div>
								</td>
								<td class="m_r"></td>
							</tr>
							<tr>
								<td class="b_l"></td>
								<td class="b_c"></td>
								<td class="b_r"></td>
							</tr>
						</table>
					</div>



					<iframe name="attachframe" id="attachframe" style="display: none;"
						onload="uploadNextAttach();"></iframe>


				</div>

			</div>
		</div>
	</div>





	<%-- 
	<div class="g-footer">
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
							target="_blank" href="javascript:void(0)" rel="nofollow">粤ICP备6666666号 -8</a>
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

	<script src="https://bbsimg.feidee.com/static/js/popup.js?OYW"></script>
	<script src="https://bbsimg.feidee.com/static/js/header.js?OYW"></script>
	<script src="https://bbsimg.feidee.com/static/js/pc_datacollect.js?OYW"></script>
	<script
		src="https://bbsimg.feidee.com/static/js/pc_datacollect_action.js?OYW"></script>

	<script type="text/javascript">
		var editorsubmit = $('postsubmit');
		var editorform = $('postform');
		//simulateSelect('typeid');
		function switchpost(href) {
			editchange = false;
			saveData(1);
			location.href = href + '&fid=205&cedit=yes' + '' + '' + '&extra=';
			doane();
		}

		addAttach();
		addAttach('img');

		var as = function() {
			var oSubjectbox = $('subjectbox'), oSubject = $('subject'), oTextarea = $('e_textarea'), sLen = 0;
			if (oSubjectbox) {
				if (oTextarea && oTextarea.style.display == '') {
					oTextarea.focus();
				}
			} else if (oSubject) {
				if (BROWSER.chrome) {
					sLen = oSubject.value.length;
					oSubject.setSelectionRange(sLen, sLen);
				}
				oSubject.focus();
			}
		};
		as();
		function switchImagebutton(btn) {
			switchButton(btn, 'image');
			$(editorid + '_image_menu').style.height = '';
			doane();
		}
		function switchAttachbutton(btn) {
			switchButton(btn, 'attach');
			doane();
		}
		if (wysiwyg) {
			newEditor(1, bbcode2html(textobj.value));
		} else {
			newEditor(0, textobj.value);
		}

		if (BROWSER.ie >= 5 || BROWSER.firefox >= '2') {
			_attachEvent(window, 'beforeunload', unloadAutoSave);
		}
		if (loadUserdata('forum_' + discuz_uid)) {
			$('rstnotice').style.display = '';
		}
	</script>
	<script type="text/javascript"
		src="https://bbsimg.feidee.com/static/js/at.js?OYW"></script>

	<script src="https://bbsimg.feidee.com/static/js/form.js?OYW"></script>
	<script src="https://bbsimg.feidee.com/static/js/post.js?OYW"></script>
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