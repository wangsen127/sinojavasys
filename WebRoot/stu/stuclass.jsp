<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'stuclass.jsp' starting page</title>
    
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
  				title: "班级管理",
        		iconCls: "icon-save",
        		url: "stu/listStuclass.do",
        		queryParams:{
        		},
        		//fitColumns:true, //自动展开/收缩列的大小
        		striped:true,//斑马线效果
        		method:"post",
        		idField:"cid", //指明哪一个字段是标识字段
                pagination: true,//显示分页 
		        rownumbers: true, //显示一个行号列
		        singleSelect: false,//只允许选择一行
		        pageSize:10,//分页大小  
		        pageList:[10,20,30,40,50],//每页的个数  
		        sortOrder:"asc",//排序顺序
		        fit:true,
		        columns: [[
                    {checkbox:true},
                    {field: "cid", hidden:true},
                    {field: "cname", title: "班级名称"},
                    {field: "area", title: "所属地区", formatter: function(value){
                    	return value.aname;
                    }},
                    {field: "type", title: "班级类型", formatter: function(value){
                    	if(value == 1) return "初级";
                    	else if(value == 2) return "中级";
                    	else if(value == 3) return "高级";
                    	else if(value == 4) return "电商";
                    }},
                    {field: "starttime", title: "开班时间"},
                    {field: "endtime", title: "结课时间"},
                    {field: "isend", title: "是否结课", formatter: function(value){
                    	if(value == 1) return "未结课";
                    	else if(value == 0) return "已结课";
                    }}
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
		            text: "结课",
		            iconCls: "icon-remove",
		            handler: endclass
		        }]
  			});
  			$("#areaData").datagrid({ 
        		iconCls: "icon-save",
        		url: "user/listAreaAll.do",
        		striped:true,//斑马线效果
        		method:"post",
        		idField:"aid", //指明哪一个字段是标识字段
		        rownumbers: true, //显示一个行号列
		        singleSelect: true,//只允许选择一行
		        sortOrder:"asc",//排序顺序
		        fit:true,
		        columns: [[
                    {field: "aid", hidden:true},
                    {field: "aname", title: "地区名称"}
                ]],
                 toolbar: [{
		            text: "添加地区",
		            iconCls: "icon-add",
		            handler: function(){
		            	var obj = $("#areaData").datagrid("getSelected");
		            	$("#aid1").val(obj.aid);
  						$("#aname1").val(obj.aname);
  						$("#aid2").val(obj.aid);
  						$("#aname2").val(obj.aname);
  						$("#area-win").dialog("close");
  						$("#areaData").datagrid("clearSelections");
		            }
		        }]
  			});
  			
  			//设置下拉选不可修改
			$(".easyui-combobox").combobox({    
				editable:false 
			});
			//设置日期不可修改和必填
			$(".easyui-datebox").datebox({    
			    required:true,
			    editable:false   
			});  
			$(".check").validatebox({    
			    required: true
			});   
  			//保存窗口
  			$("#save-win").window({
  				title:"保存窗口",
  				width:350,    
			    height:220,
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
			    height:220,
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
			
			//选择所属地区对话窗口
			$("#area-win").dialog({    
			    title: "选择地区",    
			    width: 200,    
			    height: 250,    
			    closed: true,    
			    modal: true   
			}); 
  			
  		});
  		function save(){
  			$("#save-win").window("open");
  			$("#save-form").form("reset");
  			$("#aid2").val("");
  		}
  		function saveData(){
  			$("#save-form").form("submit",{
				url : "stu/saveStuclass.do",
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
	  			//表单数据回填后事件
	  			$("#edit-form").form({
	  				onLoadSuccess : function(data){
	  					$("#aid2").val(data.area.aid);
	  					$("#aname2").val(data.area.aname);
	  				}
	  			});  
	  			$("#edit-form").form("load","stu/getStuclass.do?cid="+ss[0].cid);
  			}
  		}
  		function editData(){
  			$("#edit-form").form("submit",{
				url : "stu/editStuclass.do",
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
						ids.push(ss[i].cid);
					}
					$.post("stu/delBatchStuclass.do",{
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
  		function showArea(){
  			$("#area-win").dialog("open");
  			$("#areaData").datagrid("clearSelections");
 			$("#areaData").datagrid("selectRecord",$("#aid2").val());
  		}
  		function endclass(){
  			var ss = $("#data").datagrid("getSelections");
  			if(ss.length == 0){
  				$.messager.alert("提示","请选择一条数据");
  			}else if(ss.length > 1){
  				$.messager.alert("提示","只能选择一条数据");
  			}else{
  				$.messager.confirm("确认","您确认想要结课吗？",function(r){    
					if(r == false) return;
					$.post("stu/endClass.do",{
						cid : ss[0].cid
					},function(data){
						if(data){
		        			$("#data").datagrid("reload");
		        			$("#data").datagrid("clearSelections");
							$.messager.alert("提示","结课成功");
						}
					});
				});  
  			}
  		}
  	</script>
  </head>
  
  <body class="easyui-layout">
	<div data-options="region:'center'">
		<div id="data"></div>
	</div>
	<div id="save-win">
		<div style="padding: 20px 0px 0px 40px">
			<form id="save-form" method="post">
				<input type="hidden" id="aid1" name="aid">
	            <table>
	            	<tr>
	                    <td>开班时间：</td>
	                    <td><input class="easyui-datebox" name="starttime" style="width: 150px;"/></td>
	                </tr>
	                <tr>
	                    <td>所属地区：</td>
	                    <td><input class="check" id="aname1" style="width: 150px;" readonly="readonly" onclick="showArea()"/></td>
	                </tr>
	                <tr>
	                	<td>班级类型：</td>
	                	<td>
	                		<select class="easyui-combobox" name="type" style="width:150px;">   
							    <option value="1">初级</option>   
							    <option value="2">中级</option>   
							    <option value="3">高级</option>   
							    <option value="4">电商</option>   
							</select> 
	                	</td>
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
				<input type="hidden" name="cid">
	            <input type="hidden" id="aid2" name="aid">
	            <table>
	                <tr>
	                    <td>班级名称：</td>
	                    <td><input class="check" name="cname" style="width: 150px;"/></td>
	                </tr>
	                <tr>
	                    <td>开班时间：</td>
	                    <td><input class="easyui-datebox" name="starttime" style="width: 150px;"/></td>
	                </tr>
	                <tr>
	                    <td>所属地区：</td>
	                    <td><input class="check" id="aname2" style="width: 150px;" readonly="readonly" onclick="showArea()"/></td>
	                </tr>
	                <tr>
	                	<td>班级类型：</td>
	                	<td>
	                		<select class="easyui-combobox" name="type" style="width:150px;">   
							    <option value="1">初级</option>   
							    <option value="2">中级</option>   
							    <option value="3">高级</option>   
							    <option value="4">电商</option>   
							</select> 
	                	</td>
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
