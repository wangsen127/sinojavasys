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
	<script src="jquery-easyui-1.3.6/core.js" type="text/javascript"></script>
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
			
			$("li").bind("click",function(){
			    $(this).siblings().children("a").removeClass("jqChecked");
				$(this).children("a").addClass("jqChecked");
				$(this).children("input").attr("checked", "checked");
			});
			if(loginStu_sid != ""){
				$("#loginDiv").attr("style","display: none;");
			}
			$("#sid").val(loginStu_sid);
			
			$("#submit_button").click(function(){
				if(loginStu_sid == ""){
					alert("请先登录！");
					return;
				}
				var issolve = $("input:radio[name='issolve']:checked").val();
				var master = $("input:radio[name='master']:checked").val();
				var easy = $("input:radio[name='easy']:checked").val();
				if(issolve == undefined || master == undefined || easy == undefined){
					alert("请完成调查表后在提交！");
					return;
				}
				$("#inq_form").submit();
			});
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
			<div id="loginDiv" style="float:right;">
				<a href="login.html">
					<font style="font-size: 20px;font-family: '楷体'">点击登录</font>
				</a>
			</div>
		</div>
		<div id="mainCss">
			<div id="mainInner">
				<div id="box">
					<script type="text/javascript" src="images/zhezhao.js"></script>
					<div class="survey" style="margin:0px auto;">
						<div id="ctl00_ContentPlaceHolder1_JQ1_divHead" class="surveyhead" style="border: 0px;">
							<h1 id="ctl00_ContentPlaceHolder1_JQ1_h1Name" style="position:relative;">
								<span id="ctl00_ContentPlaceHolder1_JQ1_lblQuestionnaireName">每&nbsp;日&nbsp;学&nbsp;习&nbsp;调&nbsp;查&nbsp;表</span>
							</h1>

							<div id="ctl00_ContentPlaceHolder1_JQ1_divDec" class="surveydescription">
								<span id="ctl00_ContentPlaceHolder1_JQ1_lblQuestionnaireDescription" style="vertical-align: middle;">
										<span style="line-height:1.5;">请你用几分钟时间对今天所学的课程进行一个自我检查，你的建议或意见会帮助我们的改进，以便给你提供更优质的课程。
											&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>
									<p>
										<span style="line-height:1.5;">填写人：${loginStu.stuname}</span>
									</p>
									<p>
										<span id="time" style="line-height:1.5;">调查时间</span>
									</p>
								</span>
							</div>
							<div style="clear: both;"></div>
						</div>

						<div id="ctl00_ContentPlaceHolder1_JQ1_question" class="surveycontent">
							<div id="ctl00_ContentPlaceHolder1_JQ1_surveyContent">
								<fieldset class="fieldset" id="fieldset1">
									<div class="div_question" id="div1">
										<div class="div_title_question_all">
											<div class="div_topic_question">1.</div>
											<div id="divTitle1" class="div_title_question">
												上次你提出的问题是否得到相应解决？<span class="req">&nbsp;*</span>
											</div>
											<div style="clear:both;"></div>
										</div>
										<div class="div_table_radio_question" id="divquestion1">
											<div class="div_table_clear_top"></div>
											<ul class="ulradiocheck">
												<li style="width: 99%;">
													<a href="javascript:" class="jqRadio" rel="q1_1"></a>
													<input style="display:none;" type="radio" name="issolve" id="q1_1" value="1">
													<label for="q1_1">已解决</label>
												</li>
												<li style="width: 99%;">
													<a href="javascript:" class="jqRadio" rel="q1_2"></a>
													<input style="display:none;" type="radio" name="issolve" id="q1_2" value="0">
													<label for="q1_2">未解决</label>
												</li>
												<div style="clear:both;"></div>
											</ul>
											<div style="clear:both;"></div>
											<div class="div_table_clear_bottom"></div>
										</div>
										<div class="errorMessage"></div>
									</div>
									<div class="div_question" id="div2">
										<div class="div_title_question_all">
											<div class="div_topic_question">2.</div>
											<div id="divTitle2" class="div_title_question">
												今天学习的课程是否掌握？<span class="req">&nbsp;*</span>
											</div>
											<div style="clear:both;"></div>
										</div>
										<div class="div_table_radio_question" id="divquestion2">
											<div class="div_table_clear_top"></div>
											<ul class="ulradiocheck">
												<li style="width:99%;">
													<a href="javascript:" class="jqRadio" rel="q2_1"></a>
													<input style="display:none;" type="radio" name="master" id="q2_1" value="1">
													<label for="q2_1">完全掌握</label>
												</li>
												<li style="width:99%;">
													<a href="javascript:" class="jqRadio" rel="q2_2"></a>
													<input style="display:none;" type="radio" name="master" id="q2_2" value="2">
													<label for="q2_2">掌握</label>
												</li>
												<li style="width:99%;">
													<a href="javascript:" class="jqRadio" rel="q2_3"></a>
													<input style="display:none;" type="radio" name=master id="q2_3" value="3">
													<label for="q2_3">部分掌握</label>
												</li>
												<li style="width:99%;">
													<a href="javascript:" class="jqRadio" rel="q2_4"></a>
													<input style="display:none;" type="radio" name="master" id="q2_4" value="4">
													<label for="q2_4">未掌握</label>
												</li>
												<div style="clear:both;"></div>
											</ul>
											<div style="clear:both;"></div>
											<div class="div_table_clear_bottom"></div>
										</div>
										<div class="errorMessage"></div>
									</div>
									<div class="div_question" id="div3">
										<div class="div_title_question_all">
											<div class="div_topic_question">3.</div>
											<div id="divTitle3" class="div_title_question">
												 今天学习的课程对你来说难易程度为？<span class="req">&nbsp;*</span>
											</div>
											<div style="clear:both;"></div>
										</div>
										<div class="div_table_radio_question" id="divquestion3">
											<div class="div_table_clear_top"></div>
											<ul class="ulradiocheck">
												<li style="width:99%;">
													<a href="javascript:" class="jqRadio" rel="q3_1"></a>
													<input style="display:none;" type="radio" name="easy" id="q3_1" value="1">
													<label for="q3_1">容易</label>
												</li>
												<li style="width:99%;">
													<a href="javascript:" class="jqRadio" rel="q3_2"></a>
													<input style="display:none;" type="radio" name="easy" id="q3_2" value="2">
													<label for="q3_2">一般</label>
												</li>
												<li style="width:99%;">
													<a href="javascript:" class="jqRadio" rel="q3_3"></a>
													<input style="display:none;" type="radio" name="easy" id="q3_3" value="3">
													<label for="q3_3">困难</label>
												</li>
												<li style="width:99%;">
													<a href="javascript:" class="jqRadio" rel="q3_4"></a>
													<input style="display:none;" type="radio" name="easy" id="q3_4" value="4">
													<label for="q3_4">非常困难</label>
												</li>
												<div style="clear:both;"></div>
											</ul>
											<div style="clear:both;"></div>
											<div class="div_table_clear_bottom"></div>
										</div>
										<div class="errorMessage"></div>
									</div>
									<div class="div_question" id="div9">
										<div class="div_title_question_all">
											<div class="div_topic_question">4.</div>
											<div id="divTitle9" class="div_title_question"> 今天学习的内容未掌握部分内容是？如果已经掌握，可不填</div>
											<div style="clear:both;"></div>
										</div>
										<div class="div_table_radio_question" id="divquestion9">
											<div class="div_table_clear_top"></div>
											<textarea title="" style="overflow: auto;width:62%;height:66px;" class="inputtext" id="q9" name="other"></textarea>
											<div class="div_table_clear_bottom"></div>
										</div>
										<div class="errorMessage"></div>
									</div>
									<div id="divCut1" topic="c1">
										<div class="div_title_cut_question">感谢您对清软国际学院的支持，我们将继续持续关注你的学习，祝您生活愉快！</div>
									</div>
								</fieldset>
							</div>
							<div style="padding-top: 6px;clear:both; padding-bottom:10px;text-align: center;" id="submit_div">
								<table id="submit_table" style="margin: 20px auto;">
									<tbody>
										<tr>
											<td><input type="button" class="submitbutton" value="提交" id="submit_button" style="padding:0 24px;height:32px;">
											</td>
											<td align="right" valign="bottom"></td>
										</tr>
									</tbody>
								</table>
								<div style="clear:both;"></div>
							</div>
						</div>

						<div style="clear: both;"></div>

						<div id="divDescPop" style="display:none;">
							<div style="padding:10px; height:470px; overflow:auto;"
								id="divDescPopData"></div>
						</div>
						<div id="rbbox" style="display:none; height:70px;"></div>

						<div style="clear: both;"></div>
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
