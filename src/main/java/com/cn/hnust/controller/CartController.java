package com.cn.hnust.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn.hnust.model.CartDetailModel;
import com.cn.hnust.pojo.Cart;
import com.cn.hnust.pojo.CartDetails;
import com.cn.hnust.pojo.Goods;
import com.cn.hnust.service.ICartDetailService;
import com.cn.hnust.service.ICartService;
import com.cn.hnust.service.IGoodsService;
import com.cn.hnust.util.LoggerUtil;
import com.github.pagehelper.util.StringUtil;





@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private ICartService cartService;
	@Autowired
	private ICartDetailService cartDetailService;
	@Autowired
	private IGoodsService goodsService;
	
	
	/**
	 * 购物车详情
	 * @param session
	 * @param userName
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView cartList(HttpSession session){

	  String userName=(String) session.getAttribute("uname");
	  if(StringUtils.isEmpty(userName)){
		  return new ModelAndView("login");  
	  }
	 
	  Cart cart=cartService.getByUser(userName);
	  if(StringUtils.isEmpty(cart)){
		  
		  return new ModelAndView("cart").addObject("error", "购物车为空");
	  }
	 System.out.println(cart.getId());
	  
	   List<CartDetailModel> cartDetailList= cartDetailService.getByCartID(cart.getId());
	   if(cartDetailList==null||cartDetailList.size()==0){
		   
		   return new ModelAndView("cart").addObject("error", "购物车为空");
		   
	   }
	  	
	    cartService.updatePrice(cart.getId());
		return new ModelAndView("cart").addObject("cartDetailList", cartDetailList);
	}
	
	/**
	 * 更新
	 * @param session
	 * @param cartDetails
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, Object> update(HttpSession session,CartDetails cartDetails){
		 Map<String, Object> map = new HashMap<String,Object>();
         try {
        	 String userName = (String) session.getAttribute("uname");
        	 System.out.println(userName);
    		 CartDetails cartDetails1 = cartDetailService.selectByPrimaryKey(cartDetails.getId());
    		 cartDetails1.setNumber(cartDetails.getNumber()); 
    		 cartDetails1.setTotalPrice(cartDetails1.getNumber()*cartDetails1.getGoodsPrice());
    		 int count= cartDetailService.updateByPrimaryKeySelective(cartDetails1,userName);
    		 
               map.put("code", 1);
               map.put("count", count);
    		 return map;

		} catch (Exception e) {
			LoggerUtil.error("更新失败");
			map.put("code", 0);
			return map;
		}

	}
	/**
	 * 删除
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpSession session,Integer id){
		 Map<String, Object> map = new HashMap<String,Object>();
         try {
    	System.out.println(id);
            int count =cartDetailService.deleteByPrimaryKey(id);
               map.put("code", 1);
               map.put("count", count);
    		 return map;

		} catch (Exception e) {
			LoggerUtil.error("删除失败");
			map.put("code", 0);
			return map;
		}

	}
	
	/**
	 * 添加到购物车
	 * @param session
	 * @param goodsId
	 * @return
	 */
	@RequestMapping("/add")
	public ModelAndView add(HttpSession session,Integer goodsId){ 
		
/*		String userName = (String) session.getAttribute("uname");
		System.out.println(userName);*/
            try {
        		String userName = (String) session.getAttribute("uname");
        		 if(StringUtils.isEmpty(userName)){
        			  return new ModelAndView("login");  
        		 }
        		Cart byUser = cartService.getByUser(userName);
        		System.out.println(goodsId);
        		Goods goods = goodsService.selectselectByPrimaryKey(goodsId);
        		if(byUser==null){
        			//新增cart表
        			 Cart cart = new Cart();
        			 cart.setUserName(userName);
        			 cart.setCartTime(new Date());
        			 cart.setPrice(goods.getPrice());
        			 cartService.insert(cart);
        			 
        			 System.out.println(cart.getId());
        			 //新增detail表
        			 CartDetails cartDetails = new CartDetails();
        			 cartDetails.setCartId(cart.getId());
        			 cartDetails.setGoodsId(goodsId);
        			 cartDetails.setGoodsName(goods.getGoodsName());
        			 cartDetails.setGoodsPrice(goods.getPrice());
        			 cartDetails.setTotalPrice(goods.getPrice());
        			 cartDetails.setNumber(1);
        			 cartDetailService.insert(cartDetails);
        		}
        		else{
        		 CartDetails cartDetails1=cartDetailService.getByCartIDAndGoodsID(byUser.getId(),goodsId);
        		 if(cartDetails1==null){
        			 CartDetails cartDetails = new CartDetails();
        			 cartDetails.setCartId(byUser.getId());
        			 cartDetails.setGoodsId(goodsId);
        			 cartDetails.setGoodsName(goods.getGoodsName());
        			 cartDetails.setGoodsPrice(goods.getPrice());
        			 cartDetails.setTotalPrice(goods.getPrice());
        			 cartDetails.setNumber(1);
        			 cartDetailService.insert(cartDetails);
        			 //改变cart表的总价格
        			 Double price = byUser.getPrice();
        			 price+=goods.getPrice();
        			 byUser.setPrice(price);
        			 cartService.updateByPrimaryKeySelective(byUser);
        		 }
        		 else{
        			 Double price = cartDetails1.getTotalPrice();
        			 Integer number = cartDetails1.getNumber();
        			 number+=1;
        			 price+=goods.getPrice();
        			 //改变cartDetails1
        			 cartDetails1.setTotalPrice(price);
        			 cartDetails1.setNumber(number);
        			 cartDetailService.updateByPrimaryKeySelective(cartDetails1,userName);
/*        			 //改变cart表的总价格
        			 Double price1 = byUser.getPrice();
        			 price1+=goods.getPrice();
        			 byUser.setPrice(price1);
        			 cartService.updateByPrimaryKeySelective(byUser);*/

        		 }
        		 
        		}
               //获取列表
/*        		  Cart cart=cartService.getByUser(userName);
        		  if(StringUtils.isEmpty(cart)){
        			  
        			  return new ModelAndView("cart").addObject("error", "购物车为空");
        		  }
        		 System.out.println(cart.getId());
        		  
        		   List<CartDetailModel> cartDetailList= cartDetailService.getByCartID(cart.getId());
        		   if(cartDetailList==null||cartDetailList.size()==0){
        			   
        			   return new ModelAndView("cart").addObject("error", "购物车为空");
        			   
        		   }	*/
        		System.out.println("aa");
        			return new ModelAndView("redirect:/cart/list");
			} catch (Exception e) {
				LoggerUtil.error("添加到购物车错误",e);
				return new ModelAndView("404");
			}
			

	}
}
