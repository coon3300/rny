package co.rny.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemVO {
    private int itemNo;          // 상품 번호
    private int lineNo;          // 라인 번호
    private String itemCode;     // 상품 코드
    private String itemName;     // 상품 이름
    private String itemDesc;     // 상품 설명
    private int itemPrice;       // 상품 가격
    private String itemImage;    // 상품 이미지
    private String itemPetSize;  // 애완동물 크기
    private String itemPetAgeRange; // 애완동물 연령대
    private String itemPetBreed; // 애완동물 품종
    private int itemStock;       // 재고 수량
    private Date createdDate;    // 생성일
    private Date updatedDate;    // 수정일
    private Date disabledDate;   // 비활성화일
    private int isDisabled;      // 비활성화 여부
}
