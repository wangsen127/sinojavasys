<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>清软国际每日学习调查</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<jsp:include page="base.jsp"></jsp:include>
	<link id="ctl00_linkDefault" type="text/css" rel="stylesheet" href="images/NewDefault.css">
	<link href="images/q.css" rel="stylesheet" type="text/css">
	<link href="images/newsolid_38.css" rel="stylesheet" type="text/css">
	<script src="jquery-easyui-1.3.6/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="images/jqnew2.js"></script>
	<script type="text/javascript">
		$(function(){
			var date = new Date();
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			if(m < 10){
				m = "0" + m;
			}
			var d = date.getDate();
			if(d < 10){
				d = "0" + d;
			}			
			var str = y + "年" + m + "月" + d + "日";
			$("#time").html("调查时间：" + str);
			
			
		});
		
	</script>
  </head>
  
  <body style="">
  	<form id="inq_form" action="inq/saveInq.do" method="post">
  	<input type="hidden" id="sid" name="sid">
	<div id="divNotRun" style="height:100px; text-align:center; display:none;"></div>
	<div id="jqContent" class="" style="text-align: left; ">
		<div id="headerCss" style="overflow-x: hidden; overflow-y: hidden; ">
			<div id="ctl00_header"></div>
		</div>
		<div id="mainCss">
			<div id="mainInner">
				<div id="box">
					<script type="text/javascript" src="images/zhezhao.js"></script>
					<div class="survey" style="margin:0px auto;">
						<div id="ctl00_ContentPlaceHolder1_JQ1_divHead" class="surveyhead" style="border: 0px;">
							<h1 id="ctl00_ContentPlaceHolder1_JQ1_h1Name" style="position:relative;">
								<span id="ctl00_ContentPlaceHolder1_JQ1_lblQuestionnaireName">
									谢&nbsp;&nbsp;&nbsp;&nbsp;谢&nbsp;&nbsp;&nbsp;&nbsp;你&nbsp;&nbsp;&nbsp;&nbsp;的
									&nbsp;&nbsp;&nbsp;&nbsp;参&nbsp;&nbsp;&nbsp;&nbsp;与！
								</span>
							</h1>

						</div>
					</div>
					<div style="margin:30px auto 0; padding-top:30px; overflow: hidden; width:100%;">
						<div style="border-top: 1px solid #bbbbbb; font-size: 0; height: 1px; line-height: 1px; width: 98%; margin: 0 auto;">
						</div>
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td height="10px"></td>
								</tr>
								<tr>
									<td align="center" valign="middle">
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr id="ctl00_trCopy">
													<td align="center" style="font-size: 12px; font-family: Tahoma, 宋体; color: #666666;">
													</td>
												</tr>
												<tr id="ctl00_trPoweredBy">
													<td style="color: #666666; font-family: Tahoma, 宋体;"
														align="center">
														<div style="height: 10px;"></div>
														<div id="divBannerLogo">
															<span id="ctl00_lblPowerby">
																<a href="http://www.sinojava.com/" target="_blank" class="link-666" title="sinojava">
																	Powered By <span style="color:#30A6E2;">sinojava</span>
																</a>
															</span>
														</div>
													</td>
												</tr>
												<tr>
													<td></td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
		<div id="footercss">
			<div id="footerLeft"></div>
			<div id="footerCenter"></div>
			<div id="footerRight"></div>
		</div>
		<div style="clear: both; height: 10px;"></div>
		<div style="height: 20px;">&nbsp;</div>
	</div>
	</form>
</body>
</html>
