package com.cn.hnust.service;  
  
import com.cn.hnust.pojo.User;  
  
public interface IUserService {  
    public User getUserByName(String userName);
    public int addUser(User user);
    public int updateUserPwdByName(User user);
    
    public int updateByPrimaryKeySelective(User user);
}