package com.cn.hnust.model;

import java.util.List;

import com.cn.hnust.pojo.DeliveryDetails;

public class DeliveryDto {
    

	
	private  Integer id;//订单id
	
	 private   List<DeliveryDetails> list;//

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<DeliveryDetails> getList() {
		return list;
	}

	public void setList(List<DeliveryDetails> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "DeliveryDto [id=" + id + ", list=" + list + "]";
	}
	
	
	
	
	
	
	
}
