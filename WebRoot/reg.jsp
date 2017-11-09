<%@page pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>注册</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="jquery-easyui-1.3.6/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="images/login.js"></script>
	<link href="css/login2.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<h1>
		注&nbsp;&nbsp;&nbsp;&nbsp;册<sup>帐号</sup>
	</h1>

	<div class="login" style="margin-top:50px;">
		<!--注册-->
		<div class="qlogin" id="qlogin">
			<div class="web_login">
				<form name="form2" id="regUser" accept-charset="utf-8"
					action="user/registerStudent.do" method="post">
					<div id="userCue" class="cue">请注意格式</div>
					<ul class="reg_form" id="reg-ul">
						<li><label for="user" class="input-tips2">用户名：</label>
							<div class="inputOuter2">
								<input type="text" id="usercode" name="usercode" maxlength="16" class="inputstyle2" />
							</div>
						</li>
						<li><label for="user" class="input-tips2">真实姓名：</label>
							<div class="inputOuter2">
								<input type="text" id="username" name="username" maxlength="16"
									class="inputstyle2" />
							</div>
						</li>

						<li><label for="passwd" class="input-tips2">密码：</label>
							<div class="inputOuter2">
								<input type="password" id="password" name="password" maxlength="16"
									class="inputstyle2" />
							</div>
						</li>
						<li><label for="passwd2" class="input-tips2">确认密码：</label>
							<div class="inputOuter2">
								<input type="password" id="password2" maxlength="16"
									class="inputstyle2" />
							</div>
						</li>
						<li><label for="user" class="input-tips2">所在地区：</label>
							<div class="inputOuter2">
								<select id="aid" name="aid" class="inputstyle2"></select>
							</div>
						</li>
						<li><label for="user" class="input-tips2">所在班级：</label>
							<div class="inputOuter2">
								<select id="cid" name="cid" class="inputstyle2"></select>
							</div>
						</li>
						<li><label for="user" class="input-tips2">邮箱：</label>
							<div class="inputOuter2">
								<input type="text" id="email" name="email" maxlength="20"
									class="inputstyle3" />
							</div>
						</li>
						<li><label for="user" class="input-tips2">性别：</label>
							<div class="inputOuter2">
								<select id="sex" name="sex" class="inputstyle2"><option
										value="1">男性</option>
									<option value="0">女性</option>
								</select>
							</div>
						</li>
						<li><label for="user" class="input-tips2">手机号：</label>
							<div class="inputOuter2">
								<input type="text" id="cellphone" name="cellphone"
									maxlength="12" class="inputstyle3" />
							</div>
						</li>

						<li>
							<div class="inputArea">
								<input type="button" id="reg"
									style="margin-top:10px;margin-left:85px;width:150px;"
									class="button_blue" value="注 册" />
							</div>
						</li>
					</ul>
				</form>
			</div>
		</div>
		<!--注册end-->
	</div>
</body>
</html>