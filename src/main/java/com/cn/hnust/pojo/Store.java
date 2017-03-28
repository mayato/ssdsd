package com.cn.hnust.pojo;

public class Store {
    private Integer sId;

    private Integer goodsId;

    private Integer number;

    private String remark;

    private Integer warehouseId;
    
    private Goods  goods;
    private Warehouse  warehouse;
 
    public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getWarehouseId() {
		return warehouseId;
	}

	public void setWarehouseId(Integer warehouseId) {
		this.warehouseId = warehouseId;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Warehouse getWarehouse() {
		return warehouse;
	}

	public void setWarehouse(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

  

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	@Override
	public String toString() {
		return "Store [sId=" + sId + ", goodsId=" + goodsId + ", number=" + number + ", remark=" + remark
				+ ", warehouseId=" + warehouseId + ", goods=" + goods + ", warehouse=" + warehouse + "]";
	}

	

  
}