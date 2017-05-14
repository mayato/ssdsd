package com.cn.hnust.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.cn.hnust.model.DeliveryDto;
import com.cn.hnust.pojo.Delivery;
import com.cn.hnust.pojo.DeliveryDetails;
import com.cn.hnust.pojo.Order;
import com.cn.hnust.pojo.OrderDetails;
import com.cn.hnust.pojo.Store;
import com.cn.hnust.service.IDeliveryDetailsService;
import com.cn.hnust.service.IDeliveryService;
import com.cn.hnust.service.IGoodsService;
import com.cn.hnust.service.IOrderDetailService;
import com.cn.hnust.service.IOrderService;
import com.cn.hnust.util.HttpServletRequestUtil;
import com.cn.hnust.util.LoggerUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {
	
	@Autowired
	private IDeliveryService deliveryService;
	@Autowired
	private IDeliveryDetailsService deliveryDetailsService;
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IOrderDetailService orderDetailService;
	@Autowired
	private IGoodsService goodsService;

	
	 /**
	  * 获取列表
	  * @param pageNumber
	  * @param pageSize
	  * @param userName
	  * @param model
	  * @return
	  */
	@RequestMapping("/list")
	public @ResponseBody HashMap<String, Object>  orderList(
			@RequestParam(required=true,defaultValue="1") Integer pageNumber,
			@RequestParam(required=true,defaultValue="2") Integer pageSize,
			@RequestParam String userName,
			Model model){
		HashMap<String, Object> map = new HashMap<String,Object>();
		List<Delivery> deliveryList;
		if (userName=="") {
			PageHelper.startPage(pageNumber, pageSize);
			deliveryList=deliveryService.getAll();
		}
		else{
			PageHelper.startPage(pageNumber, pageSize);
			deliveryList=deliveryService.getbyuserName(userName);
		}		
		PageInfo<Delivery> p=new PageInfo<Delivery>(deliveryList);
		System.out.println(p.getList());
		if (pageNumber==0) {
			map.put("isError", true);	
			return map;
		}
		 map.put("isError", false);	
		 map.put("pages", p.getPages());
		 map.put("currentPage", p.getPageNum());
		 map.put("dataList", deliveryList);
		/*model.addObject("goods", goods);*/
		/*model.addObject("page",p);*/
		return map;
	}

	/**
	 * 详情
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("detail")
	@ResponseBody
	public Map<String,Object> detail(HttpSession session,Integer id){
		Map<String, Object> map = new HashMap<String,Object>();
		try {
			List<DeliveryDetails> list= deliveryDetailsService.getBydeliveryId(id);

			map.put("code", 1);	
			map.put("list", list);	
			return map;
		} catch (Exception e) {
			map.put("code", 0);	
			LoggerUtil.error("删除失败",e);
			return map;
		}
	
	}
	/**
	 * 新增
	 * @param request
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public Map<String,Object> add(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String,Object>();
		String str = HttpServletRequestUtil.getBody(request);
		System.out.println(str);
		try {
			DeliveryDto deliveryDto = JSON.parseObject(str, DeliveryDto.class);
			deliveryService.add(deliveryDto);

           System.out.println(deliveryDto);
			map.put("code", 1);
			map.put("deliveryDto", deliveryDto);

			return map;
		} catch (Exception e) {
			map.put("code", 0);	
			LoggerUtil.error("结算失败",e);
			return map;
		}
	
	}
	
/*	@RequestMapping("add")
	@ResponseBody
	public Map<String,Object> add(HttpSession session,@RequestBody DeliveryDto deliveryDto){
		Map<String, Object> map = new HashMap<String,Object>();
		try {
	
           System.out.println(deliveryDto);
			map.put("code", 1);
			map.put("deliveryDto", deliveryDto);

			return map;
		} catch (Exception e) {
			map.put("code", 0);	
			LoggerUtil.error("结算失败",e);
			return map;
		}
	
	}*/
	
}
