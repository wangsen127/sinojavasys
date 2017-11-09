package com.sinojava.test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class aa {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd班");
		
		System.out.println(sdf.format(new Date()));
	}

}
