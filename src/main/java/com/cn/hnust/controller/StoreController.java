package com.cn.hnust.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn.hnust.dao.IWarehouseDao;
import com.cn.hnust.pojo.Goods;
import com.cn.hnust.pojo.Store;
import com.cn.hnust.pojo.Warehouse;
import com.cn.hnust.service.IGoodsService;
import com.cn.hnust.service.IStoreService;
import com.cn.hnust.service.IWarehouseService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class StoreController {
	@Resource
	private IStoreService storeService;
	@Resource
	private IGoodsService goodsService;
	@Resource
	private IWarehouseService warehouseService;
	
	@RequestMapping("/admin/storelist")
	public @ResponseBody HashMap<String, Object>  storelist(
			@RequestParam(required=true,defaultValue="1") Integer pageNumber,
			@RequestParam(required=true,defaultValue="2") Integer pageSize,
			@RequestParam String storeName,
			Model model){
		HashMap<String, Object> map = new HashMap<String,Object>();
		List<Store> stores;
		if (storeName=="") {
			PageHelper.startPage(pageNumber, pageSize);
			stores = storeService.selectAll();
	}
		else{
			PageHelper.startPage(pageNumber, pageSize);
			stores = storeService.selectByNameLike(storeName);
		}	
		PageInfo<Store> p=new PageInfo<Store>(stores);
		System.out.println(p.getList());
		if (pageNumber==0||p.getPages()==0) {
			map.put("isError", true);	
			return map;
		}
		 map.put("isError", false);	
		 map.put("pages", p.getPages());
		 map.put("currentPage", p.getPageNum());
		 map.put("dataList", stores);
		/*model.addObject("goods", goods);*/
		/*model.addObject("page",p);*/
		return map;
	}
	@RequestMapping("/admin/cancelstore")
	public@ResponseBody HashMap<String, Object> cancelgoods(@RequestParam Integer id){
	        int  a= storeService.deleteByPrimaryKey(id);
	       HashMap<String, Object> map = new HashMap<String,Object>();
	        if (a>0) {
	        	map.put("msg","1");
		}
	        else {
	        	map.put("msg","0");
		}
	 
	        return map;
	}
	@RequestMapping("/admin/addstore")
	public @ResponseBody HashMap<String, Object> addstore(@RequestParam Integer goodsId,
			@RequestParam Integer warehouseId){	
		 HashMap<String, Object> map = new HashMap<String,Object>();
		Warehouse warehouse = null;
		Goods goods = null;
		if (warehouseId!=null) {
			warehouse=warehouseService.selectByPrimaryKey(warehouseId);	
		}
		if (goodsId!=null) {
			goods=goodsService.selectselectByPrimaryKey(goodsId);
		}
		map.put("warehouse",warehouse);
		map.put("goods",goods);
		map.put("msg", "1");	
		return map;
		
	}
	
	@RequestMapping("/admin/updatestore")
	public ModelAndView  updatestore(Store store,@RequestParam Integer goodsId,@RequestParam Integer warehouseId){
		
		store.setGoodsId(goodsId);
		store.setWarehouseId(warehouseId);
		System.out.println(goodsId);
		System.out.println(warehouseId);
		System.out.println(store.toString());
		if (store.getsId()==null) {
			int a=storeService.insertSelective(store);
		}
		else {
			int a=storeService.updateByPrimaryKeySelective(store);
		}
		ModelAndView view = new ModelAndView("admin/adminstore");
	  	   view.addObject("success", "修改成功");
	         return view;	
	}
	@RequestMapping("/admin/Modifystore")  
    public@ResponseBody HashMap<String, Object> cancelModify(@RequestParam Integer id){
 	  Store store= storeService.selectselectByPrimaryKey(id); 
 	  System.out.println(store);
 	       HashMap<String, Object> map = new HashMap<String,Object>();
 	        if (store!=null) {	
 	        	map.put("msg","1");
			}
 	        else {
 	        	map.put("msg","0");
			}
 	        return map;
    }
	@RequestMapping("/admin/storeadd")
	public String show(Model model,
			@RequestParam(value="id",required=false) Integer id ) {

	if (id!=null) {
		 Store store= storeService.selectselectByPrimaryKey(id);
		 model.addAttribute("store",store);
	 	 
	}
	return "admin/adminaddstore";	
	}
	
}

