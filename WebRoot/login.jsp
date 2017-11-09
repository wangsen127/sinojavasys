<%@page pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>登录</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="jquery-easyui-1.3.6/jquery.min.js" type="text/javascript"></script>
	<link href="css/login2.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<h1>
		登&nbsp;&nbsp;&nbsp;&nbsp;录<sup>帐号</sup>
	</h1>

	<div class="login" style="margin-top:50px;">

		<div class="web_qr_login" id="web_qr_login"
			style="display: block; height: 235px;">
			<!--登录-->
			<div class="web_login" id="web_login">
				<div class="login-box">
					<div class="login_form">
						<form action="user/login.do" name="loginform" accept-charset="utf-8"
							id="login_form" class="loginForm" method="post">
							<div class="uinArea" id="uinArea">
								<label class="input-tips" for="u">帐号：</label>
								<div class="inputOuter" id="uArea">
									<input type="text" id="u" name="usercode" class="inputstyle" />
								</div>
							</div>
							<div class="pwdArea" id="pwdArea">
								<label class="input-tips" for="p">密码：</label>
								<div class="inputOuter" id="pArea">
									<input type="password" id="p" name="password" class="inputstyle" />
								</div>
							</div>
							<div style="padding-left:50px;margin-top:20px;">
								<input type="submit" id="log" value="登 录" style="width:150px;"
									class="button_blue" />
							</div>
						</form>
					</div>

				</div>

			</div>
			<!--登录end-->
		</div>
	</div>
</body>
</html>