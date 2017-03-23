package com.cn.hnust.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.cn.hnust.dao.IAdminDao;
import com.cn.hnust.pojo.Admin;
import com.cn.hnust.pojo.Goods;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IAdminService;
import com.cn.hnust.service.IGoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@SessionAttributes({"aname"}) 
public class adminGoodsController {
	@Resource
	 private IGoodsService goodsService;
	@Resource
	 private  IAdminService adminService;
		
	
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
		return "admin/adminindex";
	}
	@RequestMapping("/admin/{view}")
	public String show(Model model,@PathVariable("view") String view) {
		System.out.println(view);
	if (view==""||view==null) {
		return "admin/adminindex";
	}
	return "admin/"+view;	
	}
	@RequestMapping("/login/admin")
	public ModelAndView login(Admin admin) {
		ModelAndView model=new ModelAndView();
	Admin admin2=adminService.selectByPrimaryKey(admin.getName());
	System.out.println(admin.getPassword());	
	if (admin2!=null) {
		System.err.println(admin2.getPassword());
		String  passward=admin2.getPassword();
		if (passward.equals(admin.getPassword())) {
			model.addObject("resuccess",1);
			model.setViewName("admin/adminindex");
			model.addObject("aname", admin.getName()); 
			return   model;
		}
	}
			model.addObject("error",1);
			model.setViewName("admin/login");
			return   model;
	}
	 @RequestMapping("/cancel/admin")  
     public ModelAndView cancel( SessionStatus sessionStatus){
  	   sessionStatus.setComplete(); 
  	   ModelAndView view = new ModelAndView("admin/adminindex");
         return view;
     }
	
}
