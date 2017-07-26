<%@page import="java.util.Map"%>
<%@page import="com.create.managerMoney.bean.Fatheracc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>账户-随手记</title>
<%@include file="/WEB-INF/manager_log/base.jsp"%>


<script src="jQuery/jquery.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap/bootstrap.css">
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}
.kebianji{

}
.messageGroup{

display:-moz-inline-box;
 display:inline-block; 
 
padding-bottom: 10px;
padding-top: 10px;
padding-left: 15px;
padding-right: 15px;

}
.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
<script type="text/javascript">
	function checkIsNum(nubmer) {
		var re = /^\d+(\.\d+)?$/; 
		if (!re.test(nubmer)) {
			return false;
		}else{
			return true;
		}
	}
	function getJsonLength(jsonData) {
		var length = 0;
		for ( var ever in jsonData) {
			length++;
		}
		return length;
	}	
	var kebianji_focusout=function(){
		$(this).bind("mouseover", xuanzhong);
		$(this).bind("mouseout", meixuanzhong);
		console.log("失去焦点");
	}
	var kebianji_focusin=function(){
		$(this).unbind("mouseover", xuanzhong);
		$(this).unbind("mouseout", meixuanzhong);
		$(this).css({ "color": "#222222"});
		$(this).css({ "border-bottom": "0px dashed #D99A56"});
		$(this).next().css({ "visibility":"hidden"});
		console.log("获得焦点");
		
	}
	var xuanzhong=function(){
		$(this).css({ "color": "#D99A56"});
		$(this).css({ "border-bottom": "1px dashed #D99A56"});
		$(this).next().css({ "visibility":"visible"});
	}
	var meixuanzhong=function(){
		$(this).css({ "color": "#222222"});
		$(this).css({ "border-bottom": "0px dashed #D99A56"});
		$(this).next().css({ "visibility":"hidden"});
	}

	
	function bangdingChildaccChange(childacc_money_type){
		
		
		$(".kebianji_Old_childacc_name").bind({
			"focusout": function(){
				
				var thiz=this;
				var $this=$(this);
				
				var childaccId=$this.parents("div:eq(0)").attr("childaccId");
				var childaccName=$(this).html();
				var pre_childacc_name=thiz.getAttribute("pre_childacc_name");
				if(childaccName==""){
					$(this).html(pre_childacc_name);
					return false;
				}
					console.log(childaccName);
					console.log(pre_childacc_name);
				if(childaccName==pre_childacc_name||pre_childacc_name==null){
					 $this.css({'border':'','border-color':''});
					console.log(".....");
					return false;
				}
				var url="${pageContext.request.contextPath}/create/managerMoney/account/ajax_checkChildaccNameRepeat";
			
				$.post(url, {'modal_body_name': childaccName},
						   function(data){
							     if(data.repeat=="true"&&childaccName!=pre_childacc_name){
							    	 $this.unbind("mouseover", xuanzhong);
									$this.unbind("mouseout", meixuanzhong);
							    	 $this.popover({  
										   container: 'body',
										  	html: true,   
							                content : "<span style='text-align:center;background:#FFFFFF; color:red; font-size:14px;'>"+"对不起,账户名称不能重复"+"</span>",   
							                animation: false,
							                placement : 'top',
							                trigger : 'manual'
							            }) ; 
							    	 $this.popover('show');
									 setTimeout(function () {$this.popover('destroy');}, 1500);
									 $this.css({'border':'solid 2px','border-color':'#A6C7FF'});
									 $this.unbind("focusout", kebianji_focusout);
									 $this.unbind("focusin", kebianji_focusin);
									 thiz.setAttribute("set_childacc_name","fail");
									 
							     }else{
							    	 
// 							    	 $this.bind("mouseover", xuanzhong);
// 										$this.bind("mouseout", meixuanzhong);
									 $this.css({'border':'','border-color':''});
							    	 var url = "${pageContext.request.contextPath}/create/managerMoney/account/ajax_childacc_name_change" ;
									var childaccId= $this.parents("div:eq(0)").attr("childaccId");
									$.post(url, {'childaccName':childaccName,'childaccId':childaccId},function(data) {
									}, "json");
									$this.css({'border':'0px','border-color':''});
									thiz.setAttribute("pre_childacc_name",childaccName);
									thiz.setAttribute("set_childacc_name","success");
							     }
						   },
			 	"json");
			
			},
			"focusin":function(){
				var childaccName=$(this).html();
				if(this.getAttribute("set_childacc_name")!="fail"){
					this.setAttribute("pre_childacc_name",childaccName);
				}
				
				console.log("~~~~~~~~"+childaccName);

			}

		});
		
		
		$(".kebianji_Old_bei_zhu").bind({
			"focusout": function(){
				$(this).css({ "width":'',"display":''});
				var beiZhu=$(this).html();
				var pre_beiZhu=this.getAttribute("pre_beiZhu");
				if(beiZhu==""){
					$(this).html(pre_beiZhu);
					return false;
				}
				
				if(beiZhu==pre_beiZhu||pre_beiZhu==null){
					return false;
				}
				var url = "${pageContext.request.contextPath}/create/managerMoney/account/ajax_bei_zhu_change" ;
				var childaccId= $(this).parents("div:eq(0)").attr("childaccId");
				$.post(url, {'beiZhu':beiZhu,'childaccId':childaccId},function(data) {
				}, "json");
				this.setAttribute("pre_beiZhu",beiZhu);
				
			},
			"focusin":function(){
				var beiZhu=$(this).html();
				this.setAttribute("pre_beiZhu",beiZhu);
				$(this).css({ "width":"250px","display":"-moz-inline-box","display":"inline-block"});
			},
			"change":function(){
				var beiZhu=$(this).html();
				this.setAttribute("pre_beiZhu",beiZhu);
			}
		});

	
		
		$(".kebianji_Old_childacc_money_type").bind("change", function(){
			var url = "${pageContext.request.contextPath}/create/managerMoney/account/ajax_childacc_money_type_change" ;
			var childaccMoneyType=$(this).find("option:selected").html();
			var childaccId= $(this).parents("div:eq(0)").attr("childaccId");
			$.post(url, {'childaccMoneyType':childaccMoneyType,'childaccId':childaccId},function(data) {
			}, "json");

		});
		
		$(".kebianji_Old_childacc_balance").bind({
			"focusout":function(){
			var $this=$(this);
			var childaccBalance=$this.html();
			var fatheraccId=$("#fatheraccId").val();
			var pre_childacc_balance=this.getAttribute("pre_childacc_balance");
			
			if(childaccBalance==""){
				$this.html("0.00");
				childaccBalance=0.00;
			}
			if(!checkIsNum(childaccBalance)){
				$this.html(pre_childacc_balance);
				return false;
				
			}
			
			$this.html(parseFloat(childaccBalance).toFixed(2));
			if(childaccBalance==pre_childacc_balance||pre_childacc_balance==null){
				
				console.log(".....");
				return false;
			}
			var url = "${pageContext.request.contextPath}/create/managerMoney/account/ajax_childacc_balance_change" ;
			var childaccId= $this.parents("div:eq(0)").attr("childaccId");
			$.post(url, {'childaccBalance':childaccBalance,'childaccId':childaccId},function(data) {
				var div=$this.parents("div")[0];
				$(div).find("font[class='font1']").html(data.childaccInput.toFixed(2));
				$(div).find("font[class='font2']").html(data.childaccOutput.toFixed(2));
				
				$("#acc_balance").html(data.fatheraccBalance.toFixed(2));
				$("#acc_in").html(data.fatheraccInput.toFixed(2));
				$("#acc_out").html(data.fatheraccOutput.toFixed(2));
				$("a[ZHLBnum="+fatheraccId+"]").children("span:eq(0)").html(data.fatheraccBalance.toFixed(2));
				$("#jingzichan").html(data.userLastMoney.toFixed(2));
				$("#zongfuzhai").html(data.userTotalLiabilities.toFixed(2));
				$("#zongzichan").html(data.userTotalMoney.toFixed(2));
				
				
				
				
			}, "json");
			this.setAttribute("pre_childacc_balance",childaccBalance);
			},
			"focusin":function(){
				var childaccBalance=$(this).html();
				this.setAttribute("pre_childacc_balance",childaccBalance);
			}
		});
	
		$(".kebianji").bind({
			  
			  mouseover:xuanzhong,  
			  mouseout:meixuanzhong  
		});
		$(".kebianji").focusin(kebianji_focusin);
		$(".kebianji").focusout(kebianji_focusout);
		$(".bianjianniu").click(function(){
			var thiz=this;
			var yibianji=this.getAttribute("yibianji");
			console.log(yibianji+"!!!");
			if(yibianji=="false"||yibianji==null){
				console.log("没进入");
				var a=$(this).parents("div")[0];
				var b=$(a).find(".kebianji");
				$.each( b, function(i, n){
					//alert(n.getAttribute("set_childacc_name"));
					 if(n.getAttribute("set_childacc_name")!="fail"){
						$(n).unbind("mouseover", xuanzhong);
						$(n).unbind("mouseout", meixuanzhong);
						$(n).css({ "color": "#D99A56"});
						$(n).css({ "border-bottom": "1px dashed #D99A56"});
						$(n).next().css({ "visibility":"visible"});
						thiz.setAttribute("yibianji","true");
						 
					 }
				});
				
				
				
			
				
				
			}
			if(yibianji=="true"){
				console.log("进入");
				var a=$(this).parents("div")[0];
				var b=$(a).find(".kebianji");
				$.each( b, function(i, n){
					//alert(n.getAttribute("set_childacc_name"));
					 if(n.getAttribute("set_childacc_name")!="fail"){
						$(n).bind("mouseover", xuanzhong);
						$(n).bind("mouseout", meixuanzhong);
						$(n).css({ "color": "#222222"});
						$(n).css({ "border-bottom": "0px dashed #D99A56"});
						$(n).next().css({ "visibility":"hidden"});
						thiz.setAttribute("yibianji","false");
					 }
				});
				
			
			
			}
		});
		$(".shanchu").click(function(){
			$div=$(this).parents("div:eq(0)");
			var childaccId=$div.attr("childaccId");
			$("#form_2_chilaccId").val(childaccId);
			
		});
		
		
	}
	
</script>
<script type="text/javascript">
	$(function() {
		$("#createaccSubmit").click(function(){
			var modal_body_name=$("#modal_body_name").val().trim();
			thiz=this;
			thiz.setAttribute("a1","true");
			thiz.setAttribute("a2","true");
			thiz.setAttribute("a3","true");
			if(modal_body_name==null||modal_body_name==""){
				
			   $("#modal_body_name").popover({  
				   container: 'body',
				  	html: true,   
	                content : "<span style='text-align:center;background:#FFFFFF; color:red; font-size:14px;'>"+"对不起,账户名称不能为空"+"</span>",   
	                animation: false,
	                placement : 'right',
	                trigger : 'manual'
	            }) ; 
				$("#modal_body_name").popover('show');
				 setTimeout(function () {$("#modal_body_name").popover('destroy');}, 1000);
				 thiz.setAttribute("a1","false");
				 return false;
			};
			
			var url="${pageContext.request.contextPath}/create/managerMoney/account/ajax_checkChildaccNameRepeat";
			
			$.post(url, {'modal_body_name': modal_body_name},
					   function(data){
						
					     if(data.repeat=="true"){
					    	 $("#modal_body_name").popover({  
								   container: 'body',
								  	html: true,   
					                content : "<span style='text-align:center;background:#FFFFFF; color:red; font-size:14px;'>"+"对不起,账户名称不能重复"+"</span>",   
					                animation: false,
					                placement : 'right',
					                trigger : 'manual'
					            }) ; 
							$("#modal_body_name").popover('show');
							 setTimeout(function () {$("#modal_body_name").popover('destroy');}, 1000);
							 thiz.setAttribute("a2","false");
							 
							
					     }
					     if( thiz.getAttribute("a1")=="true"&&thiz.getAttribute("a2")=="true"&&thiz.getAttribute("a3")=="true"){
							 $("#form_1").submit();
						 }
					     return false;
					   },
			 	"json");

			
			var form_childaccBalance=$("#form_childaccBalance").val().trim();
			if(form_childaccBalance==null||form_childaccBalance==""){
			   $("#form_childaccBalance").popover({  
				   container: 'body',
				  	html: true,   
	                content : '<span style="text-align:center;background:#FFFFFF; color:red; font-size:14px;">请填写金额</span>',   
	                animation: false,
	                placement : 'right',
	            }) ; 
				$("#form_childaccBalance").popover('show');
				 setTimeout(function () {$("#form_childaccBalance").popover('destroy');}, 1000);
				 thiz.setAttribute("a3","false");
				 return false;
			};
			var form_childaccBalance=$("#form_childaccBalance").val().trim();
			if(!checkIsNum(form_childaccBalance)){
			   $("#form_childaccBalance").popover({  
				   container: 'body',
				  	html: true,   
	                content : '<span style="text-align:center;background:#FFFFFF; color:red; font-size:14px;">金额填写有误</span>',   
	                animation: false,
	                placement : 'right',
	            }) ; 
				$("#form_childaccBalance").popover('show');
				 setTimeout(function () {$("#form_childaccBalance").popover('destroy');}, 1000);
				 thiz.setAttribute("a3","false");
				 return false;
			};
			
			
		});
		$(".messageGroup").click(function(){
			var a=this;
			var messageText=$(this).html();
			$("#modal_body_name").val(messageText);
			$("#modal_body_name")[0].focus();
			$("#modal_body_hidden_message").val(messageText);
			
			
			$.each( $(".messageGroup"), function(i, n){
				
				  if(n==a){
					  $(n).css({ "background": "#D09A56" });
				  }
				  if(n!=a){
					  $(n).css({ "background": "#FFFFFF" });
				  }
				});
			
		});
	
		$(".ZHLB").click(
				function() {
					var ZHLBnum=$(this).attr('ZHLBnum'); 
					var accName=$(this).children("span:eq(1)").text();
					$("#fatheraccId").val(ZHLBnum);
					
					$("#myModalLabel").html("添加"+accName);
					$("#modal_body_hidden_fatheraccId").val(ZHLBnum);
// 					var acc_balance="${requestScope.fatheraccMap['"+8+"'].fatheraccBalance}";
					var a = this;
					$(".ZHLB").each(function() {
						if (a == this) {
							$(this).css({
								background : "#FFF300"
							});
						}
						if (a != this) {
							$(this).css({
								background : "white"
							});
						}

					});
					var userId = ${sessionScope.userId};
					var fatheraccId = $(this).attr("id");

					fatheraccId = fatheraccId.substring(4);
					var url = "${pageContext.request.contextPath}/create/managerMoney/account/updateFatheracc/" + fatheraccId;
					$.post(url, function(data) {
						if(data.fatheraccName==null){
							$("#fatheraccName").html($(a).children("span").html());
						}else{
							$("#fatheraccName").html(data.fatheraccName);
						}
						
						
					
						
						if(data.fatheraccInput==null){
							$("#acc_in").html("0.00");
						}else{
							$("#acc_in").html(data.fatheraccInput.toFixed(2));
						}
						if(data.fatheraccOutput==null){
							$("#acc_out").html("0.00");
						}else{
							$("#acc_out").html(data.fatheraccOutput.toFixed(2));
						}
						if(data.fatheraccBalance==null){
							$("#acc_balance").html("0.00");
						}else{
							$("#acc_balance").html(data.fatheraccBalance.toFixed(2));
						}
					
					
					}, "json");
					

					var url = "${pageContext.request.contextPath}/create/managerMoney/account/ajaxAppendChild/"  + fatheraccId;
					$.post(url, function(data) {
						console.log(data);
						console.log(data[4]);
						//display:block; width: 1000px; 给span样式设置固定宽度
				
						var childaccNum = getJsonLength(data);
						$(".childaccDiv").remove();
						$.each(data, function(i, n) {
							if(n.beiZhu==null||n.beiZhu.trim()==""){n.beiZhu="编辑备注"}
							$("#childaccList").append(
											"<div id='$' childaccId="+n.childaccId +" class='childaccDiv' style=' height: 180px; background: #FFFFFF;  border-color:#FAFAFA;margin : 30px 60px 30px 30px;padding-left :15px;padding-top :10px'>"
											+ "<span id='childaccName' contenteditable='true' class='kebianji_Old_childacc_name kebianji' style='padding-bottom:2px;padding-top:2px;font-size: 30px; color: #222222; background: #FFFFFF'>"
											+ n.childaccName
											+ "</span>"
											+"&nbsp<img src='src/ckd1.png' style='visibility:hidden'>"
											+ "&nbsp&nbsp&nbsp"
											+ n.childaccMessage
											+ "&nbsp&nbsp&nbsp"
											+ "<select id='childaccMoneyType' childaccId="+n.childaccId +" contenteditable='true' style='color: #6C6C6C' class='kebianji_Old_childacc_money_type kebianji'>"
											+ "	<option value='人民币'>人民币</option>"
											+ "	<option value='美元'>美元</option>"
											+ "	<option value='欧元'>欧元</option>"
											+ "	<option value='英镑'>英镑</option>"
											+ "</select>"
											+"&nbsp<img src='src/ckd1.png' style='visibility:hidden'>"
											+ "<br/><br/>"
											+ "<span contenteditable='true' style='background: #FFFFFF; color: #6C6C6C; font-size:17px'  class='kebianji_Old_bei_zhu kebianji'>"+n.beiZhu+"</span>"
											+"&nbsp<img src='src/ckd1.png' style='visibility:hidden'>"
											+ "<span style='position: absolute; right: 100px; font-size: 10px; background: #FFFFFF; color: #111111' >"
											+ "CNY<span id='childaccBalance' style='font-size: 30px' contenteditable='true' class='kebianji_Old_childacc_balance kebianji'>"+n.childaccBalance.toFixed(2)+"</span>"
											+"&nbsp<img src='src/ckd1.png' style='visibility:hidden'>"
											+ "</span>"
											+ " <br/> <br/>"
											+ "<span style='position: absolute; right: 100px'>"
											+ "流入<font class='font1' size='3px' color='#F57B5C'>"
											+ n.childaccInput.toFixed(2)
											+ "</font>&nbsp&nbsp&nbsp流出<font class='font2' size='3px' color='#49CC5F'>"
											+ n.childaccOutput.toFixed(2)
											+ "</font>"
											+ "</span>"
											+ "<br />"
											+ "<a id='shanchu' class='shanchu'  data-toggle='modal' data-target='#caozuotishi_shanchu' style='font-size: 15px' 'href='JavaScript:void(0)'>删除</a>&nbsp&nbsp&nbsp" + "<a id='bianji' class='bianjianniu' style='font-size: 15px' 'href='JavaScript:void(0)'>编辑</a>" 
											+"</div>"
											);
								$("select[childaccId="+n.childaccId +"]").val(n.childaccMoneyType);
						});
						bangdingChildaccChange();

					}, "json");

				});
		$("#r-addbtn").click(function(){
			$("#messageGroup_1").click();
		});
		$("#ZHLB1").click();
		
		$("#quedingshanchu").click(function(){
				var childaccId=$("#form_2_chilaccId").val();
				$("div[childaccId="+childaccId+"]").remove();
				
				var fatheraccId=$("#fatheraccId").val();
				var url="${pageContext.request.contextPath}/create/managerMoney/account/ajax_childacc_delete" ;
				$.post(url, {'childaccId':childaccId},function(data) {
					$("#acc_balance").html(data.fatheraccBalance.toFixed(2));
					$("#acc_in").html(data.fatheraccInput.toFixed(2));
					$("#acc_out").html(data.fatheraccOutput.toFixed(2));
					$("a[ZHLBnum="+fatheraccId+"]").children("span:eq(0)").html(data.fatheraccBalance.toFixed(2));
					$("#jingzichan").html(data.userLastMoney.toFixed(2));
					$("#zongfuzhai").html(data.userTotalLiabilities.toFixed(2));
					$("#zongzichan").html(data.userTotalMoney.toFixed(2));
				}, "json");
				$('#caozuotishi_shanchu').modal('hide');
		});
	});
</script>

</head>
<body>
	<div class="container">
	<%@include file="/public_page/page_head.jsp"%>
		<div>
<!-- 			<h4>[欢迎光临账户系统]</h4> -->
<!-- <img src="src/ckd1.png" hidden="hidden" > -->
			<input id="fatheraccId"" type="hidden" name="fatheraccId" value="">
			<div class="row">

				<div class="col-md-2 col-sm-2  text-center" style="height: 100%; background: #EEEEEE">


					<div  class="summary-info" style="height: 100%; width: 100%; background: #EEEEEE">
						<ul class="l-data" style="height: 100%; width: 100%; background: #EEEEEE">
							<li class="clearfix">
								<span class="float-left">总资产</span>
								<span id="zongzichan" class="lt-money float-right" title='-21.00'>
								<c:if test="${requestScope.useracc.userTotalMoney==null}">0.00</c:if>
								<c:if test="${requestScope.useracc.userTotalMoney!=null}">${requestScope.useracc.userTotalMoney}</c:if>
								</span>
							</li>
							<li class="clearfix">
								<span class="float-left">总负债</span>
								<span id="zongfuzhai" class="lt-money float-right" title='0.00'>
								<c:if test="${requestScope.useracc.userTotalLiabilities==null}">0.00</c:if>
								<c:if test="${requestScope.useracc.userTotalLiabilities!=null}">${requestScope.useracc.userTotalLiabilities}</c:if>
								</span>
							</li>
							<li class="jingzichan-item clearfix">
								<span class="float-left">净资产</span>
								<span id="jingzichan" class="lt-money float-right" title='-21.00'>
								<c:if test="${requestScope.useracc.userLastMoney==null}">0.00</c:if>
								<c:if test="${requestScope.useracc.userLastMoney!=null}">${requestScope.useracc.userLastMoney}</c:if>
								</span>
							</li>
						</ul>
					</div>





					<%-- <%=((Map<Long,Fatheracc>)request.getAttribute("fatheraccMap")).get(1) %> --%>
					<div style="height: 100%; width: 100%; background: #FFFFFF">
						<div  class="well sidebar-nav" style="height: 100%; width: 100%; background: #EEEEEE">
							<ul class="nav nav-list" style="height: 100%; width: 100%; background: #EEEEEE">
								<li>
									<a id="ZHLB1" ZHLBnum="1" class="ZHLB" href="JavaScript:void(0)">
										<span>
										<c:if test="${requestScope.fatheraccMap['1'].fatheraccBalance==null}">0.00</c:if>
										<c:if test="${requestScope.fatheraccMap['1'].fatheraccBalance!=null}">${requestScope.fatheraccMap['1'].fatheraccBalance}</c:if>
										</span>
										<br/><span>现金账户</span>
									</a>
								</li>
								<li>
									<a id="ZHLB2" ZHLBnum="2"  class="ZHLB" href="JavaScript:void(0)">
										<span>
										<c:if test="${requestScope.fatheraccMap['2'].fatheraccBalance==null}">0.00</c:if>
										<c:if test="${requestScope.fatheraccMap['2'].fatheraccBalance!=null}">${requestScope.fatheraccMap['2'].fatheraccBalance}</c:if>
										</span>
										<br/><span>信用卡账户</span>
									</a>
								</li>
								<li>
									<a id="ZHLB3"  ZHLBnum="3" class="ZHLB" href="JavaScript:void(0)">
										<span>
										<c:if test="${requestScope.fatheraccMap['3'].fatheraccBalance==null}">0.00</c:if>
										<c:if test="${requestScope.fatheraccMap['3'].fatheraccBalance!=null}">${requestScope.fatheraccMap['3'].fatheraccBalance}</c:if>
										</span>
										<br /><span>金融账户</span>
									</a>
								</li>
								<li>
									<a id="ZHLB4" ZHLBnum="4"  class="ZHLB" href="JavaScript:void(0)">
										<span>
										<c:if test="${requestScope.fatheraccMap['4'].fatheraccBalance==null}">0.00</c:if>
										<c:if test="${requestScope.fatheraccMap['4'].fatheraccBalance!=null}">${requestScope.fatheraccMap['4'].fatheraccBalance}</c:if>
										</span>
										<br/><span>虚拟账户</span>
									</a>
								</li>
								<li>
									<a id="ZHLB5" ZHLBnum="5"  class="ZHLB" href="JavaScript:void(0)">
										<span>
										<c:if test="${requestScope.fatheraccMap['5'].fatheraccBalance==null}">0.00</c:if>
										<c:if test="${requestScope.fatheraccMap['5'].fatheraccBalance!=null}">${requestScope.fatheraccMap['5'].fatheraccBalance}</c:if>
										</span>
										<br/><span>负债账户</span>
									</a>
								</li>
								<li>
									<a id="ZHLB6"  ZHLBnum="6" class="ZHLB" href="JavaScript:void(0)">
										<span>
										<c:if test="${requestScope.fatheraccMap['6'].fatheraccBalance==null}">0.00</c:if>
										<c:if test="${requestScope.fatheraccMap['6'].fatheraccBalance!=null}">${requestScope.fatheraccMap['6'].fatheraccBalance}</c:if>
										</span>
										<br /><span>债权账户</span>
									</a>
								</li>
								<li>
									<a id="ZHLB7"  ZHLBnum="7" class="ZHLB" href="JavaScript:void(0)">
										<span>
										<c:if test="${requestScope.fatheraccMap['7'].fatheraccBalance==null}">0.00</c:if>
										<c:if test="${requestScope.fatheraccMap['7'].fatheraccBalance!=null}">${requestScope.fatheraccMap['7'].fatheraccBalance}</c:if>
										</span>
										<br /><span>投资账户</span>
									</a>
								</li>
								<li>
									<a id="ZHLB8"  ZHLBnum="8" class="ZHLB" href="JavaScript:void(0)">
										<span>
										<c:if test="${requestScope.fatheraccMap['8'].fatheraccBalance==null}">0.00</c:if>
										<c:if test="${requestScope.fatheraccMap['8'].fatheraccBalance!=null}">${requestScope.fatheraccMap['8'].fatheraccBalance}</c:if>
										</span>
										<br /><span>保险账户</span>
									</a>
								</li>
							</ul>
						</div>
					</div>

				</div>


				<div class="col-md-10 col-sm-10" style="background-color: #EEEEEE">
					<div class="row">
						<div class="col-md-12 col-sm-12" style="background-color: #EEEEEE">
							<div class="row">
								<font id="fatheraccName" style="left: 0px" size="5" face="微软雅黑">请选择账户</font> <br /> <br />
								<div class="col-md-2 col-sm-2 acc_rtop_item"">
									<p class="acc_rtop_name">余额</p>
									<p class="acc_rtop_num" id="acc_balance"></p>
								</div>
								<div class="col-md-2 col-sm-2 acc_rtop_item"">
									<p class="acc_rtop_name">流入</p>
									<p class="acc_rtop_num acc_rtop_red" id="acc_in" style="color: #F2635C"></p>
								</div >
								<div class="col-md-2 col-sm-2 acc_rtop_item"">
									<p class="acc_rtop_name">流出</p>
									<p class="acc_rtop_num acc_rtop_green" id="acc_out" style="color: #14BA89"></p>
								</div>
								<div class="col-md-1 col-sm-1 col-md-push-4">
									<a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="r-addbtn" href="javascript:;"> 添加账户</a>
								</div>


							</div>
						</div>
					</div>
					<div id="childaccList" class="row">
						<!--  追加子账户div-->

					</div>
				</div>

			</div>
		</div>

		<!-- 模态框（Modal）添加账户 -->
		<div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="height:500px; width:500px;">
				<div class="modal-content" >
					<div class="modal-header">
						<h4 style="left: 170px;position: relative;" class="modal-title" id="myModalLabel">添加账户</h4>
					</div>
					<div class="modal-body" >
						<form id="form_1" action="create/managerMoney/account/createChildacc" method="post" >
							<input id="modal_body_hidden_message" hidden="hidden" name="childaccMessage" value=""></input>
							<input id="modal_body_hidden_fatheraccId" hidden="hidden" name="fatheraccId" value=""></input>
						<span id="messageGroup_1" class="messageGroup" >基金</span><span class="messageGroup">股票</span><span class="messageGroup">外汇</span><span class="messageGroup">债券</span><span class="messageGroup">期货</span><span class="messageGroup">黄金</span><span class="messageGroup">现金口袋</span>
							<br/><br/>&emsp;&emsp;&emsp;&emsp;&emsp;
							名称<input id="modal_body_name"   size="30" name="childaccName" value="" ></input> 
	
							<br/><br/> &emsp;&emsp;&emsp;&emsp;&emsp;
							币种<select name="childaccMoneyType" style="width: 245px;height: 27px" >
									<option >美元</option>
									<option >人民币</option>
									<option >英镑</option>
									<option >欧元</option>
								</select>
							<br/><br/> &emsp;&emsp;&emsp;&emsp;&emsp;
							余额<input id="form_childaccBalance"  name="childaccBalance"  size="30" value=""></input> 
							<br/><br/> &emsp;&emsp;&emsp;&emsp;&emsp;
							备注<input name="beiZhu" size="30" value=""></input>
							
						
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<button type="button" id="createaccSubmit" class="btn btn-primary" style="background-color: #C58534">确定</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
<!-- 		<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#caozuotishi_shanchu">开始演示模态框</button> -->
		<!-- 模态框（Modal）操作提示 -->
		<div class="modal fade"  id="caozuotishi_shanchu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="height:500px; width:500px;">
				<div class="modal-content" >
					<div class="modal-header">
						<h4 style="left: 170px;position: relative;" class="modal-title" id="myModalLabel">操作提示</h4>
					</div>
					<div class="modal-body" >
						
							<input id="form_2_chilaccId" hidden="hidden" name="chilaccId" value=""></input>
							
								<span style="color:red; font-size:15px;position: relative; left: 140px;bottom:5px">您确定要删除该账户么?</span>
						
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" id="quedingshanchu" class="btn btn-primary" style="background-color: #C58534">确定删除</button>
							</div>
						
					</div>
				</div>
			</div>
		</div>
		
</body>

</html>

