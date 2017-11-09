package com.sinojava.core;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class BaseActionSupport extends ActionSupport implements RequestAware,SessionAware,ServletResponseAware{

	public final static String INDEX = "index";
	public final static String LIST = "list";
	public final static String SAVE = "save";
	public final static String EDIT = "edit";
	
	private int page;
	private int rows;
	private String sort;
	private String order;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public int getStart(){
		return (page - 1) * rows;
	}

	private Map<String,Object> request;
	
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}
	public Map<String, Object> getRequest() {
		return request;
	}

	private Map<String,Object> session;
	
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	
	private HttpServletResponse response;
	
	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
	}
	
	public void renderObject(String key, Object value){
		request.put(key, value);
	}
	
	/**
	 * 增加和修改
	 */
	public void renderJson(boolean flag){
		this.sendText(flag+"");
	}
	/**
	 * 表格数据
	 */
	public void renderJson(List data,Long total,String... names){
		Map<String,Object> map = new HashMap<String, Object>();
		if(data != null)
			map.put("rows", data);
		if(total != null)
			map.put("total", total);
		
		JSONObject obj = JSONObject.fromObject(map,getCfg(names));
		this.sendText(obj.toString());
	}
	/**
	 * 树形结构或者单个对象
	 */
	public void renderJson(Object data,String... names){
		if (data instanceof List) {
			JSONArray arr = JSONArray.fromObject(data,getCfg(names));
			this.sendText(arr.toString());
		}else{
			JSONObject obj = JSONObject.fromObject(data,getCfg(names));
			this.sendText(obj.toString());
		}
	}
	
	public void sendText(String text){
		try {
			response.getWriter().write(text);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public JsonConfig getCfg(String... names){
		JsonConfig jc = new JsonConfig();
		jc.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		if(names.length != 0)
			jc.setExcludes(names);
		
		return jc;
	}

}
