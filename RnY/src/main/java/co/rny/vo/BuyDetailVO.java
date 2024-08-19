package co.rny.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BuyDetailVO {
    private int buyDetailNo;
    private int buyNo;
    private int itemNo;
    private int itemCnt;
    private Date createdAt;
    private Date updatedAt;
    private Date deletedAt;
    private int isDeleted;
}
