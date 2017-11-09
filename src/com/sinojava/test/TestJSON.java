package com.sinojava.test;

import java.util.Date;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.sinojava.core.JsonDateValueProcessor;
import com.sinojava.entity.Area;
import com.sinojava.entity.Stuclass;

public class TestJSON {

	public static void main(String[] args) {
		
		Person p = new Person();
		p.setId(1);
		p.setName("tom");
		p.setBirth(new Date());
		
		JsonConfig jc = new JsonConfig();
		jc.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
//		jc.setExcludes(new String[]{"birth"});
		
		JSONObject obj = JSONObject.fromObject(p, jc);
		
		System.out.println(obj.toString());
		
		System.out.println("----------------");
		
		Stuclass sc = new Stuclass();
		sc.setCid(1);
		sc.setCname("aaa");
		sc.setType(1);
		sc.setStarttime(new Date());
		sc.setIsend(1);
		Area a = new Area();
		a.setAid(11);
		sc.setArea(a);
		
		JSONObject obj2 = JSONObject.fromObject(sc, jc);
		
		System.out.println(obj2.toString());
	}
}
