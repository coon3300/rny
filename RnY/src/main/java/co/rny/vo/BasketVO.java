package co.rny.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BasketVO{
    private int basketNo;
    private String userNo;
    private Date createdAt;
    private Date updatedAt;
    private Date deletedAt;
    private int isDeleted;
    
    private int basketDetailNo;
    private String itemImage;
    private String itemName;
    private int quantity;
    private int itemCnt;
    private int itemPrice;
    private int itemTotPrice;    
    
    private String userName;
    private String userPhone;
    private String userEmail;
    private String userAdd;
    
    private int basketTotalPrice;
}
