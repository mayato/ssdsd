package com.cn.hnust.pojo;

public class Warehouse {
    private Integer warehouseId;

    private String warehouseName;

    private String warehousePlace;

    public Integer getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Integer warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName == null ? null : warehouseName.trim();
    }

    public String getWarehousePlace() {
        return warehousePlace;
    }

    public void setWarehousePlace(String warehousePlace) {
        this.warehousePlace = warehousePlace == null ? null : warehousePlace.trim();
    }
}