package com.cn.hnust.controller;

import java.util.List;


import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cn.hnust.pojo.Goods;
import com.cn.hnust.service.IGoodsService;
/**
 * 货物相关
 * 
 * @author mayato
 */
@Controller
public class GoodsController {
		@Resource
		 private IGoodsService goodsService;
		/** 查询货物 */
		@RequestMapping("/goodsdetial/{goodsId}")
		public String index(@PathVariable("goodsId") Integer goodsId,Model model) {
			System.out.println(goodsId);
			Goods goods = goodsService.selectselectByPrimaryKey(goodsId);
			model.addAttribute("goods", goods);
			return "product_info";
		}
}
