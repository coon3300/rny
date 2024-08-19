package co.rny.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BuyVO {
    private int buyNo;
    private String userNo;
    private String buyStatus;
    private int buyPrice;
    private Date createdAt;
    private Date updatedAt;
    private Date deletedAt;
    private int isDeleted;
    
    private int buyCount;
    
    private int buyDetailNo;
    private String itemName;
    private int itemCnt;
    private int itemPrice;
    private int itemTotPrice;
    
    private String userName;
    private String userPhone;
    private String userEmail;
    private String userAdd;
    
}