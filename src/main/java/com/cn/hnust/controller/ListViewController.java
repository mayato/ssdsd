package com.cn.hnust.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cn.hnust.pojo.Goods;
import com.cn.hnust.service.IGoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Controller
public class ListViewController {

	@Resource
	 private IGoodsService goodsService;
	/** 显示全部列表 */
	@RequestMapping("/goodslist")
	public ModelAndView  goodslist(
			@RequestParam(required=true,defaultValue="1") Integer page) {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("product_list");
		
		PageHelper.startPage(page, 2);
		List<Goods> goods = goodsService.getgoodsDesc();
		PageInfo<Goods> p=new PageInfo<Goods>(goods);
		System.out.println(p.getList());
		if (page==0||p.getPages()==0) {
			model.addObject("error","没有商品了");
			return model;
		}
		model.addObject("goods", goods);
		model.addObject("page",p);
		
		return model;
	}
	@RequestMapping("/goodstype/{type}")
	public ModelAndView  goodslistchoose(@PathVariable("type") String type,
			@RequestParam(required=true,defaultValue="1") Integer page) {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("product_type");
		PageHelper.startPage(page, 2);
		List<Goods> goods = goodsService.getgoodschoose(type);
		PageInfo<Goods> p=new PageInfo<Goods>(goods);
		System.out.println(p.getList());
		if (page==0||p.getPages()==0) {
			model.addObject("error","没有商品了");
			return model;
		}
		model.addObject("goods", goods);
		model.addObject("page",p);
		
		return model;
	}
	@RequestMapping("/findProductBySearch")
	public ModelAndView search(@RequestParam String name,
			@RequestParam(required=true,defaultValue="1") Integer page) {
		ModelAndView model=new ModelAndView();
		System.out.println(name);
		model.setViewName("product_search");
		PageHelper.startPage(page, 2);
		List<Goods> goods = goodsService.selectByNameLike(name);
		PageInfo<Goods> p=new PageInfo<Goods>(goods);
		System.out.println(p.getList());
		if (page==0||p.getPages()==0) {
			model.addObject("error","没有此商品");
			return model;
		}
		model.addObject("goods", goods);
		model.addObject("page",p);
		model.addObject("name",name);
		return model;
	}
}
