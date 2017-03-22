package com.cn.hnust.controller;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.hnust.pojo.Goods;
import com.cn.hnust.service.IGoodsService;
import com.cn.hnust.service.IUserService;



/**
 * 首页Controller
 * 
 * @author mayato
 *
 */
@Controller
public class IndexController {
	
	@Resource
	 private IGoodsService goodsService;

	
	
	/** 访问主页 */
	@RequestMapping("/index")
	public String index(Model model) {
		List<Goods> goods = goodsService.getgoodsDesc();
		model.addAttribute("goods", goods);
		return "index";
	}


}
