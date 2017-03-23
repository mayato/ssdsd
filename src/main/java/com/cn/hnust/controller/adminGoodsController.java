package com.cn.hnust.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn.hnust.pojo.Goods;
import com.cn.hnust.service.IGoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class adminGoodsController {
	@Resource
	 private IGoodsService goodsService;
	@RequestMapping("/admingoodslist")
	public @ResponseBody HashMap<String, Object>  admingoodslist(
			@RequestParam(required=true,defaultValue="1") Integer pageNumber,
			@RequestParam(required=true,defaultValue="2") Integer pageSize,
			@RequestParam String userName,
			Model model){
		HashMap<String, Object> map = new HashMap<String,Object>();
		PageHelper.startPage(pageNumber, pageSize);
		List<Goods> goods = goodsService.getgoodsDesc();
		PageInfo<Goods> p=new PageInfo<Goods>(goods);
		System.out.println(p.getList());
		if (pageNumber==0||p.getPages()==0) {
			map.put("isError", true);	
			return map;
		}
		 map.put("isError", false);	
		 map.put("pages", p.getPages());
		 map.put("currentPage", p.getPageNum());
		 map.put("dataList", goods);
		/*model.addObject("goods", goods);*/
		/*model.addObject("page",p);*/
		return map;
	}
	@RequestMapping("/admin")
	public String index(Model model) {
		return "admin/admingoods";
	}
}
