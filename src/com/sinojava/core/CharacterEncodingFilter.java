package com.sinojava.core;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {

	
	public void destroy() {
	}
	
	
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		
		if(encode != null && contentType != null){
			req.setCharacterEncoding(encode);
			resp.setContentType(contentType + ";charset=" +encode);
		}
		
		chain.doFilter(req, resp);
	}

	private String contentType;
	private String encode;
	
	public void init(FilterConfig cfg) throws ServletException {
		contentType = cfg.getInitParameter("contentType");
		encode = cfg.getInitParameter("encode");
	}

}
