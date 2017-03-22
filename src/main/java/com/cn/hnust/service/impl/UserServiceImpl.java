package com.cn.hnust.service.impl;  
  
import javax.annotation.Resource;  
  
import org.springframework.stereotype.Service;  
  
import com.cn.hnust.dao.IUserDao;
import com.cn.hnust.exception.RepeatAppointException;
import com.cn.hnust.pojo.User;  
import com.cn.hnust.service.IUserService;

  
@Service("userService") 
public class UserServiceImpl implements IUserService {  
    @Resource  
    private IUserDao userDao;  
    @Override  
  
    public User getUserByName(String userName) {  
        // TODO Auto-generated method stub  
        return this.userDao.selectByPrimaryKey(userName);  
    	
    }
    public int addUser(User user) {
        // TODO Auto-generated method stub
        
			try {
				return this.userDao.insert(user);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 0;
			}	
		
        
		
    }
    public int updateUserPwdByName(User user) {
        // TODO Auto-generated method stub
        return this.userDao.updateByPrimaryKeySelective(user);
    }
}