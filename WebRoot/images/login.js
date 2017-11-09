$(function(){
	//css
	$('#switch_qlogin').click(function(){
		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({left:'0px',width:'70px'});
		$('#qlogin').css('display','none');
		$('#web_qr_login').css('display','block');
	});
	$('#switch_login').click(function(){
		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({left:'154px',width:'70px'});
		$('#qlogin').css('display','block');
		$('#web_qr_login').css('display','none');
	});
	if(getParam("a")=='0'){
		$('#switch_login').trigger('click');
	}
});

function logintab(){
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({left:'154px',width:'96px'});
	$('#qlogin').css('display','none');
	$('#web_qr_login').css('display','block');
	
}


//根据参数名获得该参数 pname等于想要的参数名 
function getParam(pname) { 
    var params = location.search.substr(1); // 获取参数 平且去掉？ 
    var ArrParam = params.split('&'); 
    if (ArrParam.length == 1) { 
        //只有一个参数的情况 
        return params.split('=')[1]; 
    } 
    else { 
         //多个参数参数的情况 
        for (var i = 0; i < ArrParam.length; i++) { 
            if (ArrParam[i].split('=')[0] == pname) { 
                return ArrParam[i].split('=')[1]; 
            } 
        } 
    } 
}  


var reMethod = "GET",
	pwdmin = 6;

$(document).ready(function() {
	$('#reg').click(function() {
		var usercode = $('#usercode').val();
		if (usercode == "") {
			$('#usercode').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
			return false;
		}
		if (usercode.length < 4 || usercode.length > 16) {
			$('#usercode').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名位4-16字符</b></font>");
			return false;
		}
		$.post("user/checkUser.do", {
			usercode : usercode
		}, function(data) {
			if(data == "true"){
				$('#usercode').css({
					border: "1px solid #D7D7D7",
					boxShadow: "none"
				});
				goon();
			}else{
				$('#usercode').focus().css({
					border: "1px solid red",
					boxShadow: "0 0 2px red"
				});
				$("#userCue").html("<font color='red'><b>×该用户名已被注册</b></font>");
				return false;
			}
		});
	});

});
function goon(){
	var username = $('#username').val();
	if (username == "") {
		$('#username').focus().css({
			border: "1px solid red",
			boxShadow: "0 0 2px red"
		});
		$('#userCue').html("<font color='red'><b>×真实姓名不能为空</b></font>");
		return;
	}
	
	var password = $('#password').val();
	if (password == "") {
		$('#password').focus().css({
			border: "1px solid red",
			boxShadow: "0 0 2px red"
		});
		$('#userCue').html("<font color='red'><b>×密码不能为空</b></font>");
		return;
	}
	if (password.length < pwdmin) {
		$('#password').focus();
		$('#userCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
		return;
	}
	var password2 = $('#password2').val();
	if (password2 == "") {
		$('#password2').focus().css({
			border: "1px solid red",
			boxShadow: "0 0 2px red"
		});
		$('#userCue').html("<font color='red'><b>×确认密码不能为空</b></font>");
		return;
	}
	if (password2 != password) {
		$('#passwd2').focus();
		$('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
		return;
	}

	var aid = $("#aid").text();
	if (aid == "") {
		$('#aid').focus().css({
			border: "1px solid red",
			boxShadow: "0 0 2px red"
		});
		$('#userCue').html("<font color='red'><b>×请选择所在地区</b></font>");
		return;
	}
	var cid = $("#cid").text();
	if (cid == "") {
		$('#cid').focus().css({
			border: "1px solid red",
			boxShadow: "0 0 2px red"
		});
		$('#userCue').html("<font color='red'><b>×请选择所在班级</b></font>");
		return;
	}
	
	var cellphone = $('#cellphone').val();
	if (cellphone == "") {
		$('#cellphone').focus().css({
			border: "1px solid red",
			boxShadow: "0 0 2px red"
		});
		$('#userCue').html("<font color='red'><b>×手机号不能为空</b></font>");
		return;
	}

	$('#regUser').submit();
	
}

//当页面加载时先请求地区的数据
$(document).ready(
	function() {
		$.post("user/listAreaAll.do", {}, function(data) {
			//将服务器传回的字符串转换为JSON对象数组
			var array = eval(data);
			//遍历JSON数组，将数据动态的加入下拉选中
			$.each(array, function(index, e) {
				$("#aid").append("<option value=" + e.aid + ">"+ e.aname);
			});
		});
		//需要在地区下拉选上绑定事件
		$("#aid").bind("change",function() {
			//当事件触发后，需要获取选中省份的id值
			var aid = $("#aid option:selected").val();
			$("#cid").empty();
			if (aid) {
				//再次进行AJAX请求，获取选中地区，相应的班级的数据
				$.post("stu/listStuclassByArea.do", {
					aid : aid
				}, function(data) {
					var array = eval(data);
					$.each(array, function(index, e) {
						$("#cid").append("<option value=" + e.cid + ">"+ e.cname);
					});
				});
			}
		});
});