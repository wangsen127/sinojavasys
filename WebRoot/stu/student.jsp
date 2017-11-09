<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'student.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<jsp:include page="../base.jsp"></jsp:include>
	<link href="jquery-easyui-1.3.6/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="jquery-easyui-1.3.6/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="jquery-easyui-1.3.6/jquery.min.js" type="text/javascript"></script>
    <script src="jquery-easyui-1.3.6/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
  	<script type="text/javascript">
  		//var ids = [];
  		$(function(){
  			//表格
  			$("#data").datagrid({ 
  				title: "学生管理",
        		iconCls: "icon-save",
        		url: "stu/listStudent.do",
        		queryParams:{
        			
        		},
        		//fitColumns:true, //自动展开/收缩列的大小
        		striped:true,//斑马线效果
        		method:"post",
        		idField:"sid", //指明哪一个字段是标识字段
                pagination: true,//显示分页 
		        rownumbers: true, //显示一个行号列
		        singleSelect: true,//只允许选择一行
		        pageSize:10,//分页大小  
		        pageList:[10,20,30,40,50],//每页的个数  
		        sortOrder:"asc",//排序顺序
		        fit:true,
		        columns: [[
                    {checkbox:true},
                    {field: "sid", hidden:true},
                    {field: "stuname", title: "学生姓名"},
                    {field: "cname", title: "班级名称", formatter: function(value,row,index){
                    	return row.sc.cname;
                    }},
                    {field: "type", title: "班级类型", formatter: function(value,row,index){
                    	if(row.sc.type == 1) return "初级";
                    	else if(row.sc.type == 2) return "中级";
                    	else if(row.sc.type == 3) return "高级";
                    	else if(row.sc.type == 4) return "电商";
                    }},
                    {field: "aname", title: "所属地区", formatter: function(value,row,index){
                    	return row.sc.area.aname;
                    }},
                    {field: "cellphone", title: "手机号码"},
                    {field: "status", title: "学生状态", formatter: function(value,row,index){
                    	if(row.status == 1) return "正常";
                    	else if(row.status == 2) return "重修";
                    	else if(row.status == 3) return "休学";
                    }},
                    {field: "time", title: "问题次数"}
                ]],
                 toolbar: [{
		            text: "新增",
		            iconCls: "icon-add",
		            handler: save
		        }/*, '-', {
		            text: "修改",
		            iconCls: "icon-edit",
		            handler: edit
		        }*/, '-', {
		            text: "删除",
		            iconCls: "icon-remove",
		            handler: delData
		        }, '-', {
		            text: "学生异动",
		            iconCls: "icon-edit",
		            handler: change
		        }],
		        onSelect:function(rowIndex,rowData){
		        	var opts = $("#changeData").datagrid("options");
    				opts.url = "stu/listStudentClassRecordBySid.do";
		        	$("#changeData").datagrid("load", {    
					    sid: rowData.sid
					});  
		        },
		        onUnselect:function(rowIndex,rowData){
		        	
		        }
  			});
  			$("#changeData").datagrid({ 
        		url: "",
        		striped:true,//斑马线效果
        		method:"post",
        		idField:"rid", //指明哪一个字段是标识字段
		        rownumbers: true, //显示一个行号列
		        singleSelect: false,//只允许选择一行
		        sortOrder:"asc",//排序顺序
		        fit:true,
		        columns: [[
                    {field: "rid", hidden:true},
                    {field: "date", title: "异常日期"},
                    {field: "cname", title: "班级名称", formatter: function(value,row,index){
                    	return row.sc.cname;
                    }},
                    {field: "type", title: "班级类型", formatter: function(value,row,index){
                    	if(row.sc.type == 1) return "初级";
                    	else if(row.sc.type == 2) return "中级";
                    	else if(row.sc.type == 3) return "高级";
                    	else if(row.sc.type == 4) return "电商";
                    }},
                    {field: "aname", title: "所属地区", formatter: function(value,row,index){
                    	return row.sc.area.aname;
                    }}
                ]]
  			});
  			//下拉表格
  			//学生修改窗口中的下拉选
  			$("#area").combobox({    
			    //url:"user/listAreaAll.do",
			    editable : false,
			    required:true,    
			    valueField:"aid",    
			    textField:"aname",
			    onSelect:function(data){
			    	showStuclass(data.aid);
			    }
			});
			//学生异动窗口中的下拉选
			$("#diqu").combobox({    
			    url:"user/listAreaAll.do",
			    editable:false,
			    required:true,    
			    valueField:"aid",    
			    textField:"aname",
			    onSelect:function(data){
		  			var url = "stu/listStuclassByArea.do?aid="+data.aid;
			    	$("#banji").combobox("reload", url);
			    }
			});
			$("#banji").combobox({
  				editable:false,
  				required:true,
  				valueField:"cid",    
			    textField:"cname"
			});
			
			$(".check").validatebox({    
			    required: true
			});
			   
			//修改窗口
			$("#edit-win").window({
  				title:"修改窗口",
  				width:350,    
			    height:280,
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
			//异动窗口
			$("#change-win").window({
  				title:"异动窗口",
  				width:350,    
			    height:200,
			    collapsible:false,
			    minimizable:false,
			    maximizable:false,
			    resizable:false,    
			    modal:true,
			    closed:true
  			});
			$("#change-btn").linkbutton({    
			    iconCls: "icon-save" 
			});  
			$("#cancel-btn1").linkbutton({    
			    iconCls: "icon-cancel" 
			}); 
			
  		});
  		function save(){
  			$.messager.confirm("确认","学生信息录入请前往注册页面,确认前往吗？",function(r){
  				if(r)
  					window.open("reg.jsp");
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
	  			//表单数据回填后事件
	  			$("#edit-form").form({
	  				onLoadSuccess : function(data){
	  					var aid = data.sc.area.aid;
	  				    $("#area").combobox("setValue", aid);
	  				    showStuclass(aid);
	  				    $("#stuclass").combobox("setValue", data.sc.cid);
	  				}
	  			});  
	  			$("#edit-form").form("load","stu/getStudent.do?sid="+ss[0].sid);
  			}
  		}
  		function editData(){
  			$("#edit-form").form("submit",{
				url : "stu/editStudent.do",
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
						ids.push(ss[i].sid);
					}
					$.post("stu/delBatchStudent.do",{
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
  		function showStuclass(aid){
  			$("#stuclass").combobox({
  				url:"stu/listStuclassByArea.do?aid="+aid,
  				editable : false,
  				required:true,  
			    valueField:"cid",    
			    textField:"cname"
			});
  		}
  		function change(){
  			var ss = $("#data").datagrid("getSelections");
  			if(ss.length == 0){
  				$.messager.alert("提示","请选择要发生异动的学生数据");
  			}else{
  				var ids = [];
				for(var i=0;i<ss.length;i++){
					ids.push(ss[i].sid);
				}
				$("#ids").val(ids.toString());
  				$("#change-win").window("open");
  				$("#change-form").form("reset");
  			}
  		}
  		function changeData(){
  			$.messager.confirm("确认","您确认发生学生异动吗？<br>异常操作无法恢复，情谨慎使用！",function(r){
  				if(r){
  					$("#change-form").form("submit",{
						url : "stu/editStudentClass.do",
						onSubmit: function(){    
					        return $(this).form("validate");   
					    },    
					    success:function(data){
					        if(data){
					        	$("#change-win").window("close");
					        	$("#data").datagrid("reload");
					        	$("#data").datagrid("clearSelections");
					        	$.messager.alert("提示","操作成功"); 
					        }else{
					        	$.messager.alert("提示","操作失败"); 
					        }
					    }
					});
  				}
  			});
  		}
  	</script>
  </head>
  
  <body class="easyui-layout">
	<div data-options="region:'center'">
		<div id="data"></div>
	</div>
	<div data-options="region:'east',split:true,iconCls:'icon-redo'" title="异动记录" style="width:300px;">
		<div id="changeData"></div>
	</div>
	<div id="change-win">
		<div style="padding: 20px 0px 0px 40px">
			<form id="change-form" method="post">
				<input type="hidden" id="ids" name="ids">
	            <table>
	                <tr>
	                    <td>所在地区：</td>
	                    <td><input id="diqu" name="aid" style="width: 150px;" /></td>
	                </tr>
	                <tr>
	                    <td>所在班级：</td>
	                    <td><input id="banji" name="cid" style="width: 150px;" /></td>
	                </tr>
	                <tr>
	                	<td>学生状态：</td>
	                	<td>
	                		<select class="easyui-combobox" name="status" style="width:150px;">   
							    <option value="1">正常</option>   
							    <option value="2">重修</option>   
							    <option value="3">休学</option>   
							</select> 
	                	</td>
	                </tr>
	            </table>
			</form>
		</div>
		<div style="text-align: right; padding: 5px;">
            <a href="javascript:void(0)" onclick="changeData()" id="change-btn">确定</a>
            <a href="javascript:void(0)" onclick="closeWindow()" id="cancel-btn1">取消</a>
        </div>
	</div>
	<div id="edit-win">
		<div style="padding: 20px 0px 0px 40px">
			<form id="edit-form" method="post">
				<input type="hidden" name="sid">
				<input type="hidden" name="userid">
				<input type="hidden" name="time">
				<input type="hidden" name="status">
	            <table>
	                <tr>
	                    <td>学生姓名：</td>
	                    <td><input class="check" name="stuname" style="width: 150px;"/></td>
	                </tr>
	                <tr>
	                    <td>所在地区：</td>
	                    <td><input id="area" name="aid" style="width: 150px;" /></td>
	                </tr>
	                <tr>
	                    <td>所在班级：</td>
	                    <td><input id="stuclass" name="cid" style="width: 150px;" /></td>
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
	                    <td>手机号码：</td>
	                    <td><input class="check" name="cellphone" style="width: 150px;" /></td>
	                </tr>
	            </table>
			</form>
		</div>
		<div style="text-align: right; padding: 5px;">
            <a href="javascript:void(0)" onclick="editData()" id="edit-btn">修改</a>
            <a href="javascript:void(0)" onclick="closeWindow()" id="cancel-btn2">取消</a>
        </div>
	</div>
	<div id="area-win">
		<div id="areaData"></div>
	</div>
  </body>
</html>
