package com.sinojava.core;

import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.Action;

/**
 * 路径跳转
 */
@Controller
public class SysAction extends BaseActionSupport {
	
	public String index(){
		return SUCCESS;
	}
	
	public String ask(){
		return SUCCESS;
	}
	
	public String reg(){
		return SUCCESS;
	}
	
	public String login(){
		return SUCCESS;
	}
}
