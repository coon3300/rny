package co.rny.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LineVO {
	private int level;          // 레벨
    private int lineNo;          // 라인 번호
    private Integer lineParentNo; // 상위 라인 번호
    private String lineName;     // 라인 이름
    private String lineDesc;     // 라인 설명
    private Date createdDate;    // 생성일
    private Date updatedDate;    // 수정일
    private Date disabledDate;   // 비활성화일
    private int isDisabled;      // 비활성화 여부
}
