package ssdsd;

import java.util.List;

import javax.annotation.Resource;  
  
import org.apache.log4j.Logger;  
import org.junit.Before;  
import org.junit.Test;  
import org.junit.runner.RunWith;  
import org.springframework.context.ApplicationContext;  
import org.springframework.context.support.ClassPathXmlApplicationContext;  
import org.springframework.test.context.ContextConfiguration;  
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;  
  
import com.alibaba.fastjson.JSON;
import com.cn.hnust.pojo.Goods;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IGoodsService;
import com.cn.hnust.service.IUserService;  
  
@RunWith(SpringJUnit4ClassRunner.class)     //��ʾ�̳���SpringJUnit4ClassRunner��  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
  
public class TestMyBatis2 {  
    private static Logger logger = Logger.getLogger(TestMyBatis2.class);  
//  private ApplicationContext ac = null;  
    @Resource  
    private IGoodsService goodsService = null;  
  
//  @Before  
//  public void before() {  
//      ac = new ClassPathXmlApplicationContext("applicationContext.xml");  
//      userService = (IUserService) ac.getBean("userService");  
//  }  
  
    @Test  
    public void test1() {  
    	Goods goods = goodsService.selectselectByPrimaryKey(1);  
        // System.out.println(user.getUserName());  
        // logger.info("ֵ��"+user.getUserName());  
       // logger.info(JSON.toJSONString(user));  
    	logger.info(JSON.toJSONString(goods));
    }  
}  