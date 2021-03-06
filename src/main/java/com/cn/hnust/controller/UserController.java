package com.cn.hnust.controller;  
  
import java.io.Console;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;  
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.cn.hnust.pojo.Order;
import com.cn.hnust.pojo.OrderDetails;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IOrderDetailService;
import com.cn.hnust.service.IOrderService;
import com.cn.hnust.service.IUserService;
import com.sun.javafx.collections.MappingChange.Map;  


     
    @Controller  
    @RequestMapping("/user") 
    @SessionAttributes({"uname"}) 
    public class UserController {
        @Resource
        private IUserService userService;
        @Autowired
        private IOrderService orderService;
        @Autowired
        private IOrderDetailService orderDetailService;
 
       @RequestMapping("/loginjson")
       public @ResponseBody HashMap<String, Object> login(@RequestParam String userName,@RequestParam String password,Model model) throws IOException{  
           HashMap<String, Object> map = new HashMap<String,Object>();
           User user=userService.getUserByName(userName);        
           if (user==null) {
        	   map.put("msg", "用户名不存在");
        	   return map; 
		  }  
           if(user.getPassword().equals(password)){  
        	   user.setUserLogin(new Date());
        	   userService.updateByPrimaryKeySelective(user);
               map.put("msg", "成功");
               model.addAttribute("uname", userName); 
           }else{  
               map.put("msg", "密码错误");  
           }  
           return map;  
       } 
       @RequestMapping("/register1")  
       public ModelAndView register1(HttpServletRequest request,Model model){     
           String  username = request.getParameter("name");
           String pwd = request.getParameter("pwd");
           User user = new User(); 
           user.setUserName(username);
           user.setPassword(pwd);
           int i=this.userService.addUser(user);
           String url="register";
           if(username!=null||pwd!=null){        
           if(i>0){
               url="login";
           }else{
               url="fail";
           }                 
          }
           ModelAndView view = new ModelAndView(url);
          return view;
       } 
       @RequestMapping("/register")  
       public ModelAndView register(User user){
    	   user.setUserCreatetime(new Date());
    	   user.setUserType(1);
           int i=this.userService.addUser(user);
           String url="";
           ModelAndView view = new ModelAndView();
		   if(i>0){
               url="login";
               view.addObject("resuccess","注册成功");
           }else{
        	   view.addObject("error","用户名已存在");
        	   url="register";
           }                 
          view.setViewName(url);
           
          return view;
       } 
       @RequestMapping("/cancel")  
       public ModelAndView cancel( SessionStatus sessionStatus){
    	   sessionStatus.setComplete(); 
    	   ModelAndView view = new ModelAndView("validateCancel");
           return view;
       }
       @RequestMapping("/showview/{view}")  
           public ModelAndView cancel(@PathVariable("view") String view){	   
        	   ModelAndView view1 = new ModelAndView(view);
               return view1;
       }
/**
 * 用户详情
 * @param session
 * @return
 */
       @RequestMapping("/detail")  
       public ModelAndView detail(HttpSession session){
    	   String userName = (String) session.getAttribute("uname");
    	   if(StringUtils.isEmpty(userName)){
    		   return new ModelAndView("login");
    	   }
    	   User user = userService.getUserByName(userName);
    	  List<Order> orderList = orderService.getbyuserName(userName);
    	   ModelAndView view = new ModelAndView("userdetail").addObject("user",user)
    	    .addObject("orderList", orderList);
           return view;
       }
       
       @RequestMapping("/update")
       @ResponseBody
       public  HashMap<String, Object> update(User user,HttpSession session){  
           /*System.out.println(request.getParameter("userName"));  */
    	   
    	   String userName = (String) session.getAttribute("uname");
    	   user.setUserName(userName);
           HashMap<String, Object> map = new HashMap<String,Object>();
           int count = userService.updateByPrimaryKeySelective(user);
           System.out.println(count);
           if(count!=0){
        	   map.put("code", 1);
           }else{
           map.put("code", 0);
           }
           return map;  
       } 
     
         
         
       /* @RequestMapping("/showUser")  
       public String toIndex(HttpServletRequest request,Model model){  
           int userId = Integer.parseInt(request.getParameter("id"));  
           User user = this.userService.getUserById(userId);  
           model.addAttribute("user", user);  
           return "showUser";  
       }*/
      
       
       /* @RequestMapping("/showUser")  
           public String showUser(HttpServletRequest request,Model model){  
               int userId = Integer.parseInt(request.getParameter("id"));  
               User user = this.userService.getUserById(userId);  
               model.addAttribute("user", user);  
               return "showUser";  
   } 
        */
        
    /*     @RequestMapping("/table")  
         public ModelAndView showTable(HttpServletRequest request){  
         ModelAndView view = new ModelAndView("tables");
            return view; 
               
    } 
         @RequestMapping("/index1")  
            public ModelAndView toIndex(HttpServletRequest request){  
             ModelAndView view = new ModelAndView("login");
            return view;
    } */
        /* @RequestMapping("/login2")  
         public ModelAndView login(HttpServletRequest request,Model model){
             String  username = request.getParameter("username");
             String pwd = request.getParameter("pwd");
             User user = this.userService.getUserByName(username);
             String url="login";
             if(user!=null&&pwd.equals(user.getPassword())){
                 url="sucess";
             }else{
                 url="fail";
             }
             ;
             ModelAndView view = new ModelAndView(url);
             return view;
         } */
     /*    @RequestMapping("/register")
         public ModelAndView register(HttpServletRequest request,Model model){
        	 ModelAndView view = new ModelAndView("register"); 	 
			return view;     	
         }
         
         
         @RequestMapping("/register1")  
         public ModelAndView register1(HttpServletRequest request,Model model){     
             String  username = request.getParameter("name");
             String pwd = request.getParameter("pwd");
             User user = new User(); 
             user.setUserName(username);
             user.setPassword(pwd);
             int i=this.userService.addUser(user);
             String url="register";
             if(username!=null||pwd!=null){        
             if(i>0){
                 url="login";
             }else{
                 url="fail";
             }                 
            }
             ModelAndView view = new ModelAndView(url);
            return view;
         } 
        
         @RequestMapping("/updateUserPwd")  
            public String updateUserPwd(HttpServletRequest request,Model model){
            String name=request.getParameter("name");
            String pwd=request.getParameter("pwd");
            String pwd1=request.getParameter("pwd1");
            if(pwd1.equals(pwd)&&pwd1!=null){        
            User user=new User();
            user.setPassword(pwd);
            user.setUserName(name);
            int i=this.userService.updateUserPwdByName(user);        
            return "success";
            }
            else{
                return "fail2";
            }
             }
         @RequestMapping("/getUserByName")  
         public ModelAndView selectByName(HttpServletRequest request,Model model){
            String name = request.getParameter("name");
            User user=new User();
            user=this.userService.getUserByName(name);
            String url="getUserByName";
            if(name!=null){
                url="updateUserPwd";
            }        
            ModelAndView view = new ModelAndView();
            view.setViewName(url);
            view.addObject("xxx", user);
            
            return view;
         }*/
        

    }
    
    
    
    
