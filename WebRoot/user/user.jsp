<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="jquery-easyui-1.3.6/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="jquery-easyui-1.3.6/themes/icon.css" rel="stylesheet" type="text/css"/>
    <script src="jquery-easyui-1.3.6/jquery.min.js" type="text/javascript"></script>
    <script src="jquery-easyui-1.3.6/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
  	<script type="text/javascript">
  		//var ids = [];
  		$(function(){
  			//表格
  			$("#data").datagrid({ 
  				title: "用户管理",
        		iconCls: "icon-save",
        		url: "user/listUser.do",
        		queryParams:{
        			//deptno : 1
        		},
        		//fitColumns:true, //自动展开/收缩列的大小
        		striped:true,//斑马线效果
        		method:"post",
        		idField:"userid", //指明哪一个字段是标识字段
                pagination: true,//显示分页 
		        rownumbers: true, //显示一个行号列
		        singleSelect: true,//只允许选择一行
		        pageSize:10,//分页大小  
		        pageList:[10,20,30,40,50],//每页的个数  
		        sortName:"usercode",//进行排序
		        sortOrder:"asc",//排序顺序
		        fit:true,
		        columns: [[
		        	//title标题文本
		        	//field字段名称
		        	//width宽度。如果没有定义，宽度将自动扩充以适应其内容
		        	//align对齐列数据。可以使用的值有：'left','right','center'。
		        	//halign对齐列标题
		        	//hidden隐藏列
		        	//sortable允许列使用排序
		        	//checkbox显示复选框
                    {checkbox:true},
                    {field: "userid", hidden:true},
                    {field: "usercode", title: "用户名"},
                    {field: "username", title: "真实姓名"},
                    {field: "role", title: "身份", formatter: function(value){
                    	if(value == 1) return "管理员";
                    	else if(value == 2) return "基地主任";
                    	else if(value == 3) return "讲师";
                    	else if(value == 4) return "助教";
                    	else return "学生";
                    }},
                    {field: "email", title: "邮箱"},
                    {field: "sex", title: "性别", formatter: function(value){
                    	if(value == 1) return "男";
                    	return "女";
                    }},
                    {field: "cellphone", title: "手机"},
                    {field: "officePhone", title: "工作电话"}
                ]],
                 toolbar: [{
		            text: "新增",
		            iconCls: "icon-add",
		            handler: save
		        }, '-', {
		            text: "修改",
		            iconCls: "icon-edit",
		            handler: edit
		        }, '-', {
		            text: "删除",
		            iconCls: "icon-remove",
		            handler: delData
		        }, '-', {
		            text: "重置密码",
		            iconCls: "icon-remove",
		            handler: resetPassword
		        }],
		        onSelect:function(rowIndex,rowData){
		        	$("#areaData").datagrid("clearSelections");
		        
		        	$.post("user/listAreaByUserid.do",{
						userid : rowData.userid
					},function(data){
						var ss = eval(data);
						if(ss.length != 0){
							$.each(ss, function(index, ele){
								$("#areaData").datagrid("selectRecord",ele.aid);
							});
						}
					});
		        },
		        onUnselect:function(rowIndex,rowData){
		        	
		        }
  			});
  			$("#areaData").datagrid({ 
        		url: "user/listAreaAll2.do",
        		striped:true,//斑马线效果
        		method:"post",
        		idField:"aid", //指明哪一个字段是标识字段
		        rownumbers: true, //显示一个行号列
		        singleSelect: false,//只允许选择一行
		        sortOrder:"asc",//排序顺序
		        fit:true,
		        columns: [[
                    {checkbox:true},
                    {field: "aid", hidden:true},
                    {field: "aname", title: "地区名称"}
                ]],
                 toolbar: [{
		            text: "添加地区",
		            iconCls: "icon-add",
		            handler: saveUserArea
		        }]
  			});
  			
  			//设置下拉选不可修改
			$(".easyui-combobox").combobox({    
				editable:false 
			});
            $(".check1").validatebox({    
			    required: true,    
			    validType:"remote['user/checkUser.do','usercode']",
				invalidMessage:"用户名已使用"  
			});
			$(".check2").validatebox({    
			    required: true
			});   
  			//保存窗口
  			$("#save-win").window({
  				title:"保存窗口",
  				width:350,    
			    height:320,
			    collapsible:false,
			    minimizable:false,
			    maximizable:false,
			    resizable:false,
			    modal:true,
			    closed:true
  			});
  			$("#save-btn").linkbutton({    
			    iconCls: "icon-save"
			});  
			$("#cancel-btn1").linkbutton({    
			    iconCls: "icon-cancel"
			}); 
			
			
			//修改窗口
			$("#edit-win").window({
  				title:"修改窗口",
  				width:350,    
			    height:300,
			    collapsible:false,
			    minimizable:false,
			    maximizable:false,
			    resizable:false,    
			    modal:true,
			    closed:true
  			});
			$("#edit-btn").linkbutton({    
			    iconCls: "icon-save" 
			});  
			$("#cancel-btn2").linkbutton({    
			    iconCls: "icon-cancel" 
			}); 
			
  			
  		});
  		function save(){
  			$("#save-win").window("open");
  			$("#save-form").form("reset");
  		}
  		function saveData(){
  			$("#save-form").form("submit",{
				url : "user/saveUser.do",
				onSubmit: function(){    
			    	return $(this).form("validate");        
			    },    
			    success:function(data){
			        if(data){
			        	$("#save-win").window("close");
			        	$("#data").datagrid("reload");
			        	$.messager.alert("提示","保存成功"); 
			        }else{
			        	$.messager.alert("提示","保存失败"); 
			        }
			    }
			});
  		}
  		function edit(){
  			var ss = $("#data").datagrid("getSelections");
  			if(ss.length == 0){
  				$.messager.alert("提示","请选择一条要修改的数据");
  			}else if(ss.length > 1){
  				$.messager.alert("提示","只能选择一条数据");
  			}else{
	  			$("#edit-win").window("open");
	  			$("#edit-form").form("reset");
	  			$("#edit-form").form("load","user/getUser.do?userid="+ss[0].userid);
  			}
  		}
  		function editData(){
  			$("#edit-form").form("submit",{
				url : "user/editUser.do",
				onSubmit: function(){    
			        return $(this).form("validate");   
			    },    
			    success:function(data){
			        if(data){
			        	$("#edit-win").window("close");
			        	$("#data").datagrid("reload");
			        	$("#data").datagrid("clearSelections");
			        	$.messager.alert("提示","修改成功"); 
			        }else{
			        	$.messager.alert("提示","修改失败"); 
			        }
			    }
			});
  		}
  		function delData(){
  			var ss = $("#data").datagrid("getSelections");
  			if(ss.length == 0){
  				$.messager.alert("提示","请选择一条要删除的数据");
  			}else{
  				$.messager.confirm("确认","您确认想要删除记录吗？",function(r){    
					if(r == false) return;
					var ids = [];
					for(var i=0;i<ss.length;i++){
						ids.push(ss[i].userid);
					}
					$.post("user/delBatchUser.do",{
						ids : ids.toString()
					},function(data){
						if(data){
		        			$("#data").datagrid("reload");
		        			$("#data").datagrid("clearSelections");
							$.messager.alert("提示","删除成功");
						}
					});
				});  
  			}
  		}
  		function resetPassword(){
  			var ss = $("#data").datagrid("getSelections");
  			if(ss.length == 0){
  				$.messager.alert("提示","请选择一条要重置密码的数据");
  			}else if(ss.length > 1){
  				$.messager.alert("提示","只能选择一条数据");
  			}else{
  				$.messager.confirm("确认","您确认想要重置密码吗？",function(r){    
					if(r == false) return;
					$.post("user/resetPassword.do",{
						userid : ss[0].userid,
						password : "123456" //默认密码
					},function(data){
						if(data){
		        			$("#data").datagrid("clearSelections");
							$.messager.alert("提示","重置密码成功");
						}
					});
				});  
  			}
  		}
  		function saveUserArea(){
  			var us = $("#data").datagrid("getSelected");
  			var as = $("#areaData").datagrid("getSelections");
  			
  			var aids = [];
			for(var i=0;i<as.length;i++){
				aids.push(as[i].aid);
			}
			$.post("user/saveUserArea.do",{
				userid : us.userid,
				aids : aids.toString()
			},function(data){
				if(data){
					$.messager.alert("提示","管理地区设置成功");
				}
			});
		}
  	</script>
  </head>
  
  <body class="easyui-layout">
	<!-- <div data-options="region:'west',split:true,iconCls:'icon-redo'" title="组织机构" style="width:180px;">
		<div id="tree"></div>
	</div> -->
	<div data-options="region:'center'">
		<div id="data"></div>
	</div>
	<div data-options="region:'east',split:true,iconCls:'icon-redo'" title="地区" style="width:220px;">
		<div id="areaData"></div>
	</div>
	
	<div id="save-win">
		<div style="padding: 20px 0px 0px 40px">
			<form id="save-form" method="post">
	            <table>
	                <tr>
	                    <td>用户名：</td>
	                    <td><input class="check1" name="usercode" style="width: 150px;"/></td>
	                </tr>
	                <tr>
	                    <td>真实姓名：</td>
	                    <td><input class="check2" name="username" style="width: 150px;"/></td>
	                </tr>
	                <tr>
	                    <td>密码：</td>
	                    <td><input class="check2" name="password" style="width: 150px;"/></td>
	                </tr>
	                <tr>
	                	<td>身份：</td>
	                	<td>
	                		<select class="easyui-combobox" name="role" style="width:150px;">   
							    <option value="1">管理员</option>   
							    <option value="2">基地主任</option>   
							    <option value="3">讲师</option>   
							    <option value="4">助教</option>   
							    <option value="5">学生</option>   
							</select> 
	                	</td>
	                </tr>
	                <tr>
	                    <td>邮箱：</td>
	                    <td><input name="email" style="width: 150px;" /></td>
	                </tr>
	                <tr>
	                	<td>性别：</td>
	                	<td>
	                		<select class="easyui-combobox" name="sex" style="width:150px;">   
							    <option value="1">男性</option>   
							    <option value="0">女性</option>   
							</select> 
	                	</td>
	                </tr>
	                <tr>
	                    <td>手机：</td>
	                    <td><input class="check2" name="cellphone" style="width: 150px;" /></td>
	                </tr>
	                <tr>
	                    <td>工作电话：</td>
	                    <td><input name="officePhone" style="width: 150px;" /></td>
	                </tr>
	            </table>
			</form>
		</div>
		<div style="text-align: right; padding: 5px;">
            <a href="javascript:void(0)" onclick="saveData()" id="save-btn">保存</a>
            <a href="javascript:void(0)" onclick="closeWindow()" id="cancel-btn1">取消</a>
        </div>
	</div>
	<div id="edit-win">
		<div style="padding: 20px 0px 0px 40px">
			<form id="edit-form" method="post">
				<input type="hidden" name="userid">
				<input type="hidden" name="password">
	            <table>
	                <tr>
	                    <td>用户名：</td>
	                    <td><input name="usercode" style="width: 150px;" readonly="readonly"/></td>
	                </tr>
	                <tr>
	                    <td>真实姓名：</td>
	                    <td><input class="check2" name="username" style="width: 150px;"/></td>
	                </tr>
	                <tr>
	                	<td>身份：</td>
	                	<td>
	                		<select class="easyui-combobox" name="role" style="width:150px;">   
							    <option value="1">管理员</option>   
							    <option value="2">基地主任</option>   
							    <option value="3">讲师</option>   
							    <option value="4">助教</option>   
							    <option value="5">学生</option>   
							</select> 
	                	</td>
	                </tr>
	                <tr>
	                    <td>邮箱：</td>
	                    <td><input name="email" style="width: 150px;" /></td>
	                </tr>
	                <tr>
	                	<td>性别：</td>
	                	<td>
	                		<select class="easyui-combobox" name="sex" style="width:150px;">   
							    <option value="1">男性</option>   
							    <option value="0">女性</option>   
							</select> 
	                	</td>
	                </tr>
	                <tr>
	                    <td>手机：</td>
	                    <td><input class="check2" name="cellphone" style="width: 150px;" /></td>
	                </tr>
	                <tr>
	                    <td>工作电话：</td>
	                    <td><input name="officePhone" style="width: 150px;" /></td>
	                </tr>
	            </table>
			</form>
		</div>
		<div style="text-align: right; padding: 5px;">
            <a href="javascript:void(0)" onclick="editData()" id="edit-btn">修改</a>
            <a href="javascript:void(0)" onclick="closeWindow()" id="cancel-btn2">取消</a>
        </div>
	</div>
  </body>
</html>
