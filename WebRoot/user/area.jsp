<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'area.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
  				title: "地区管理",
        		iconCls: "icon-save",
        		url: "user/listArea.do",
        		queryParams:{
        			//deptno : 1
        		},
        		//fitColumns:true, //自动展开/收缩列的大小
        		striped:true,//斑马线效果
        		method:"post",
        		idField:"aid", //指明哪一个字段是标识字段
                pagination: true,//显示分页 
		        rownumbers: true, //显示一个行号列
		        singleSelect: false,//只允许选择一行
		        pageSize:10,//分页大小  
		        pageList:[10,20,30,40,50],//每页的个数  
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
                    {field: "aid", hidden:true},
                    {field: "aname", title: "地区名称"}
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
		        }]
  			});
  			
  			//设置下拉选不可修改
			$(".easyui-combobox").combobox({    
				editable:false 
			});
			$(".check").validatebox({    
			    required: true
			});   
  			//保存窗口
  			$("#save-win").window({
  				title:"保存窗口",
  				width:350,    
			    height:150,
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
			    height:150,
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
				url : "user/saveArea.do",
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
	  			$("#edit-form").form("load","user/getArea.do?aid="+ss[0].aid);
  			}
  		}
  		function editData(){
  			$("#edit-form").form("submit",{
				url : "user/editArea.do",
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
						ids.push(ss[i].aid);
					}
					$.post("user/delBatchArea.do",{
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
  	</script>
  </head>
  
  <body class="easyui-layout">
	<div data-options="region:'center'">
		<div id="data"></div>
	</div>
	<div id="save-win">
		<div style="padding: 20px 0px 0px 40px">
			<form id="save-form" method="post">
	            <table>
	                <tr>
	                    <td>地区名称：</td>
	                    <td><input class="check" name="aname" style="width: 150px;"/></td>
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
				<input type="hidden" name="aid">
	            <table>
	                <tr>
	                    <td>地区名称：</td>
	                    <td><input class="check" name="aname" style="width: 150px;"/></td>
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
