<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'inq.jsp' starting page</title>
    
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
  				title: "调查管理",
        		iconCls: "icon-save",
        		url: "inq/listInq.do",
        		queryParams:{
        			//deptno : 1
        		},
        		//fitColumns:true, //自动展开/收缩列的大小
        		striped:true,//斑马线效果
        		method:"post",
        		idField:"inid", //指明哪一个字段是标识字段
                pagination: true,//显示分页 
		        rownumbers: true, //显示一个行号列
		        singleSelect: true,//只允许选择一行
		        pageSize:10,//分页大小  
		        pageList:[10,20,30,40,50],//每页的个数  
		        sortName:"inid",//进行排序
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
                    {field: "inid", hidden:true},
                    {field: "date", title: "调查日期"},
                    {field: "stuname", title: "学生姓名", formatter: function(value,row,index){
                    	return row.stu.stuname;
                    }},
                    {field: "cname", title: "班级", formatter: function(value,row,index){
                    	return row.stu.sc.cname;
                    }},
                    {field: "aname", title: "地区", formatter: function(value,row,index){
                    	return row.stu.sc.area.aname;
                    }},
                    {field: "issolve", title: "解决情况",formatter: function(value){
                    	return ["未解决","解决"][value];
                    }},
                    {field: "master", title: "掌握情况",formatter: function(value){
                    	return [null,"完全掌握","掌握","部分掌握","未掌握"][value];
                    }},
                    {field: "easy", title: "难易程度",formatter: function(value){
                    	return [null,"容易","一般","困难","非常困难"][value];
                    }},
                    {field: "other", title: "其他"}
                ]],
                 toolbar: [{
		            text: "删除",
		            iconCls: "icon-remove",
		            handler: delData
		        }],
		        onSelect:function(rowIndex,rowData){
		        
		        },
		        onUnselect:function(rowIndex,rowData){
		        	
		        }
  			});
  			
  			//设置下拉选不可修改
			$(".easyui-combobox").combobox({    
				editable:false 
			});
			$(".check2").validatebox({    
			    required: true
			});   
  		});
 		function delData(){
  			var ss = $("#data").datagrid("getSelections");
  			if(ss.length == 0){
  				$.messager.alert("提示","请选择一条要删除的数据");
  			}else{
  				$.messager.confirm("确认","您确认想要删除记录吗？",function(r){    
					if(r == false) return;
					var ids = [];
					for(var i=0;i<ss.length;i++){
						ids.push(ss[i].inid);
					}
					$.post("inq/delBatchInq.do",{
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
	<!-- <div data-options="region:'west',split:true,iconCls:'icon-redo'" title="组织机构" style="width:180px;">
		<div id="tree"></div>
	</div> -->
	<div data-options="region:'center'">
		<div id="data"></div>
	</div>
	
  </body>
</html>
