package com.cn.hnust.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ErrorController {

	/**
	 * 错误页面
	 * 
	 * @return
	 */
	@RequestMapping("/404")
	public String error404(HttpServletRequest request) {
		
		return "404";
	}
}
	
	

