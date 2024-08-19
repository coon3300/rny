package co.rny.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BasketDetailVO {
    private int basketDetailNo;
    private int basketNo;
    private int itemNo;
    private int itemCnt;
    private Date createdAt;
    private Date updatedAt;
    private Date deletedAt;
    private int isDeleted;
}
