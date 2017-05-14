package com.cn.hnust.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cn.hnust.dao.IAdminDao;
import com.cn.hnust.pojo.Admin;
import com.cn.hnust.pojo.Goods;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IAdminService;
import com.cn.hnust.service.IGoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.glass.ui.View;
import com.sun.xml.internal.bind.v2.model.core.ID;


@Controller
@SessionAttributes({"aname"}) 
public class AdminGoodsController {
	@Resource
	 private IGoodsService goodsService;
	@Resource
	 private  IAdminService adminService;
	@RequestMapping("/admingoodslist")
	public @ResponseBody HashMap<String, Object>  admingoodslist(
			@RequestParam(required=true,defaultValue="1") Integer pageNumber,
			@RequestParam(required=true,defaultValue="2") Integer pageSize,
			@RequestParam String goodsName,
			Model model){
		HashMap<String, Object> map = new HashMap<String,Object>();
		List<Goods> goods;
		if (goodsName=="") {
			PageHelper.startPage(pageNumber, pageSize);
			 goods = goodsService.getgoodsDesc();
		}
		else{
			PageHelper.startPage(pageNumber, pageSize);
			 goods = goodsService.selectByNameLike(goodsName);
		}		
		PageInfo<Goods> p=new PageInfo<Goods>(goods);
		System.out.println(p.getList());
		if (pageNumber==0) {
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
	@RequestMapping("/cancel/good")  
    public@ResponseBody HashMap<String, Object> cancelgoods(@RequestParam Integer id){
 	        int  a= goodsService.deleteByPrimaryKey(id);
 	       HashMap<String, Object> map = new HashMap<String,Object>();
 	        if (a>0) {
 	        	map.put("msg","1");
			}
 	        else {
 	        	map.put("msg","0");
			}
 	 
 	        return map;
    }
	@RequestMapping("/cancel/Modify")  
    public@ResponseBody HashMap<String, Object> cancelModify(@RequestParam Integer id){
 	  Goods goods= goodsService.selectselectByPrimaryKey(id); 
 	  System.out.println(goods);
 	       HashMap<String, Object> map = new HashMap<String,Object>();
 	        if (goods!=null) {	
 	        	map.put("msg","1");
			}
 	        else {
 	        	map.put("msg","0");
			}
 	        return map;
    }
	
	@RequestMapping("/admin")
	public String index(Model model) {	
		return "admin/adminindex";
	}
	/**
	 * 返回界面
	 * @param model
	 * @param view
	 * @param id
	 * @return
	 */
	@RequestMapping("/admin/{view}")
	public String show(Model model,@PathVariable("view") String view,
			@RequestParam(value="id",required=false) Integer id ) {
		
	if (view==""||view==null) {
		return "admin/adminindex";
	}
	if (id!=null&&view.equals("adminadd")) {
		 Goods goods= goodsService.selectselectByPrimaryKey(id);
		 model.addAttribute("goods",goods);
	 	 
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
	 @RequestMapping("/add/admin")  
     public ModelAndView add( MultipartFile file, HttpServletRequest request,
 			Goods goods, String categoryName){
		 
			 /*String path = request.getSession().getServletContext() .getRealPath("/upload");*/
		 String path="D:/upload";
			 String fileName = file.getOriginalFilename();
			 File targetFile = new File(path, fileName);
			 goods.setUrl(fileName);
			 if (goods.getGoodsId()==null) {
		   int a=goodsService.insert(goods);
			 }
			 else{
				 int a=goodsService.updateByPrimaryKeySelective(goods);
			 }
			 if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
				try {
					// 保存文件
					file.transferTo(targetFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
		 
  	   ModelAndView view = new ModelAndView("admin/admingoods");
  	   view.addObject("success", "修改成功");
         return view;
     }
	
}
