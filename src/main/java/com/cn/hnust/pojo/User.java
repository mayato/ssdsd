package com.cn.hnust.pojo;

import java.util.Date;

public class User {
    private String userName;

    private String password;

    private String email;

    private String tel;

    private String sex;

    private Date userLogin;

    private Date userCreatetime;

    private Integer userType;

    private Integer userPoints;
    
    private String userAddress;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Date getUserLogin() {
        return userLogin;
    }

    public void setUserLogin(Date userLogin) {
        this.userLogin = userLogin;
    }

    public Date getUserCreatetime() {
        return userCreatetime;
    }

    public void setUserCreatetime(Date userCreatetime) {
        this.userCreatetime = userCreatetime;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public Integer getUserPoints() {
        return userPoints;
    }

    public void setUserPoints(Integer userPoints) {
        this.userPoints = userPoints;
    }

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
    
    
}