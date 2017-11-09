<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'feedback.jsp' starting page</title>
    
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
  				title: "反馈管理",
        		iconCls: "icon-save",
        		url: "inq/listFeedback.do",
        		queryParams:{
        		},
        		//fitColumns:true, //自动展开/收缩列的大小
        		striped:true,//斑马线效果
        		method:"post",
        		idField:"bid", //指明哪一个字段是标识字段
                pagination: true,//显示分页 
		        rownumbers: true, //显示一个行号列
		        singleSelect: false,//只允许选择一行
		        pageSize:10,//分页大小  
		        pageList:[10,20,30,40,50],//每页的个数  
		        sortOrder:"asc",//排序顺序
		        fit:true,
		        columns: [[
                    {checkbox:true},
                    {field: "bid", hidden:true},
                    {field: "status", title: "状态", formatter: function(value,row,index){
                    	return ["","问题提出","解决中","已解决"][row.status];
                    }},
                    {field: "date", title: "反馈日期"},
                    {field: "stuname", title: "学生姓名", formatter: function(value,row,index){
                    	return row.stu.stuname;
                    }},
                    {field: "cname", title: "班级名称", formatter: function(value,row,index){
                    	return row.stu.sc.cname;
                    }},
                    {field: "type", title: "班级类型", formatter: function(value,row,index){
                    	return ["","初级","中级","高级","电商"][row.stu.sc.type];
                    }},
                    {field: "aname", title: "所属地区", formatter: function(value,row,index){
                    	return row.stu.sc.area.aname;
                    }},
                    {field: "findate", title: "完成日期"},
                    {field: "content", title: "反馈内容"}
                ]],
                 toolbar: [{
		            text: "处理",
		            iconCls: "icon-edit",
		            handler: doFeedback
		        }, '-', {
		            text: "完成反馈",
		            iconCls: "icon-edit",
		            handler: finish
		        }],
		        onSelect:function(rowIndex,rowData){
		        },
		        onUnselect:function(rowIndex,rowData){
		        }
  			});
  			
			$("#feedback-win").window({
  				title:"反馈窗口",
  				width:350,    
			    height:220,
			    collapsible:false,
			    minimizable:false,
			    maximizable:false,
			    resizable:false,    
			    modal:true,
			    closed:true
  			});
			$("#ok-btn").linkbutton({    
			    iconCls: "icon-save" 
			});  
			$("#cancel-btn").linkbutton({    
			    iconCls: "icon-cancel" 
			}); 
  		});
  		function doFeedback(){
  			var ss = $("#data").datagrid("getSelections");
  			if(ss.length == 0){
  				$.messager.alert("提示","请选择一条要修改的数据");
  			}else{
	  			$.messager.confirm("确认","您确认处理反馈信息吗？",function(r){
	  				if(r){
	  					var ids = [];
	  					for(var i=0;i<ss.length;i++){
							if(ss[i].status != 1){
								$.messager.alert("提示","您选择的反馈信息已经处理了！");
								return;
							}
						}
						for(var i=0;i<ss.length;i++){
							ids.push(ss[i].bid);
						}
	  					$.post("inq/doFeedback.do",{
	  						ids : ids.toString()
	  					},function(data){
	  						if(data){
	  							$("#data").datagrid("reload");
		        				$("#data").datagrid("clearSelections");
								$.messager.alert("提示","反馈处理中，情尽快与问题学生联系！");
	  						}
	  					});
	  				}
	  			});
  			}
  		}
  		function finish(){
  			var ss = $("#data").datagrid("getSelections");
  			if(ss.length == 0){
  				$.messager.alert("提示","请选择一条要修改的数据");
  			}else if(ss.length > 1){
  				$.messager.alert("提示","只能选择一条数据");
  			}else{
	  			$("#feedback-win").window("open");
	  			$("#feedback-form").form("reset");
	  			$("#bid").val(ss[0].bid);
  			}
  		}
  		function finishFeedback(){
  			$("#feedback-form").form("submit",{
				url : "inq/finishFeedback.do",
				onSubmit: function(){    
			        return $(this).form("validate");   
			    },    
			    success:function(data){
			        if(data){
			        	$("#feedback-win").window("close");
			        	$("#data").datagrid("reload");
			        	$("#data").datagrid("clearSelections");
			        	$.messager.alert("提示","反馈成功"); 
			        }else{
			        	$.messager.alert("提示","反馈失败"); 
			        }
			    }
			});
  		}
  	</script>
  </head>
  
  <body class="easyui-layout">
	<div data-options="region:'center'">
		<div id="data"></div>
	</div>
	<div id="feedback-win">
		<div style="padding: 20px 0px 0px 40px">
			<form id="feedback-form" method="post">
				<input type="hidden" id="bid" name="bid">
	            <table>
	                <tr>
	                    <td>反馈内容：</td>
	                    <td><textarea class="easyui-validatebox" data-options="required:true" name="content" style="height:100px;width: 150px;"></textarea></td>
	                </tr>
	            </table>
			</form>
		</div>
		<div style="text-align: right; padding: 5px;">
            <a href="javascript:void(0)" onclick="finishFeedback()" id="ok-btn">确定</a>
            <a href="javascript:void(0)" onclick="closeWindow()" id="cancel-btn">取消</a>
        </div>
	</div>
  </body>
</html>
