package com.sinojava.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginInterceptor implements Interceptor{

	private String freeAction;
	private String[] urls;
	public String getFreeAction() {
		return freeAction;
	}

	public void setFreeAction(String freeAction) {
		this.freeAction = freeAction;
	}
	
	public void destroy() {
	}

	public void init() {
		freeAction = freeAction == null ? "" : freeAction.trim();
		freeAction = freeAction.replaceAll("[\t\r\n]", "");
		urls = freeAction.split(",");
	}

	public String intercept(ActionInvocation ai) throws Exception {
		
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		
		HttpSession session = req.getSession();
		
		boolean isAjax = "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
		
		String path = req.getServletPath();
		
		if(isContain(path)){
			return ai.invoke();
		}else{
			Object loginManager = session.getAttribute("loginUser");
			if(loginManager == null){
				if(isAjax){
					resp.getWriter().write("登录超时，请重新登录！");
					return null;
				}
				
				return "login";
			}else{
				return ai.invoke();
			}
		}
	}
	
	public boolean isContain(String path){
		for (String s : urls) {
			if(path.endsWith(s)){
				return true;
			}
		}
		return false;
	}

}
