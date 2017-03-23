package com.cn.hnust.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IAdminDao;
import com.cn.hnust.pojo.Admin;
import com.cn.hnust.service.IAdminService;
@Service("adminService") 
public class AdminServiceImpl implements IAdminService {
	 @Resource  
	   private IAdminDao admindao;
	@Override
	public Admin selectByPrimaryKey(String name) {
		return   admindao.selectByPrimaryKey(name);
	}
	 
	 
}
