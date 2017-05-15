package com.cn.hnust.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.hnust.pojo.Cart;
import com.cn.hnust.pojo.Goods;
import com.cn.hnust.pojo.Order;
import com.cn.hnust.pojo.OrderDetails;
import com.cn.hnust.pojo.Store;
import com.cn.hnust.service.ICartDetailService;
import com.cn.hnust.service.ICartService;
import com.cn.hnust.service.IOrderDetailService;
import com.cn.hnust.service.IOrderService;
import com.cn.hnust.service.IStoreService;
import com.cn.hnust.util.LoggerUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("order")
public class OrderController {
	
	@Autowired
	private IOrderService orderService;

	@Autowired
	private IOrderDetailService orderDetailService;

	@Autowired
	
	private ICartService cartService;
	
	@Autowired
	
	private ICartDetailService cartDetailService;
	@Autowired
	private  IStoreService storeService;
	/**
	 * 结算
	 * @param session
	 * @param price
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public Map<String,Object> add(HttpSession session,Double price){
		Map<String, Object> map = new HashMap<String,Object>();
		try {
			String userName = (String) session.getAttribute("uname");
/*		    Cart cart1 = cartService.getByUser(userName);
			cartService.updatePrice(cart1.getId());*/
			int code = orderService.add(userName,price);
			map.put("code", code);

			return map;
		} catch (Exception e) {
			map.put("code", 0);	
			LoggerUtil.error("结算失败",e);
			return map;
		}
	
	}
	
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
		List<Order> orderList;
		if (userName=="") {
			PageHelper.startPage(pageNumber, pageSize);
			orderList=orderService.getAll();
		}
		else{
			PageHelper.startPage(pageNumber, pageSize);
			orderList=orderService.getbyuserName(userName);
		}		
		PageInfo<Order> p=new PageInfo<Order>(orderList);
		System.out.println(p.getList());
		if (pageNumber==0) {
			map.put("isError", true);	
			return map;
		}
		 map.put("isError", false);	
		 map.put("pages", p.getPages());
		 map.put("currentPage", p.getPageNum());
		 map.put("dataList", orderList);
		/*model.addObject("goods", goods);*/
		/*model.addObject("page",p);*/
		return map;
	}
	/**
	 * 删除
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Map<String,Object> delete(HttpSession session,Integer id){
		Map<String, Object> map = new HashMap<String,Object>();
		try {
			orderService.deleteByPrimaryKey(id);
			map.put("code", 1);	
			return map;
		} catch (Exception e) {
			map.put("code", 0);	
			LoggerUtil.error("删除失败",e);
			return map;
		}
	
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
			List<OrderDetails> list= orderDetailService.getByOrderId(id);
			for (OrderDetails orderDetails : list) {
			List<Store> storeList=storeService.getWithOrder(orderDetails.getGoodsId(),orderDetails.getNumber());
			orderDetails.setStoreList(storeList);
			}
			map.put("code", 1);	
			map.put("list", list);	
			return map;
		} catch (Exception e) {
			map.put("code", 0);	
			LoggerUtil.error("获取详情失败",e);
			return map;
		}
	
	}
	
	

}
