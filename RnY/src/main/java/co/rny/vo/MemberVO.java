package co.rny.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO extends ItemVO {
    private String userNo;        // 회원 번호
    private String userId;     // 회원 아이디
    private String userPw;    // 회원 비밀번호
    private String userName;   // 회원 이름
    private String userNick; // 회원 닉네임
    private Date userBirth; // 회원 생년월일
    private String userPhone;  // 회원 전화번호
    private String userEmail;  // 회원 이메일
    private String userAdd; // 회원 주소
    private int userPoint;     // 회원 포인트
    private int userCoupon;     // 회원 포인트
    private Date userDate;    // 가입일자
    private String responsibility;  // 회원 권한

}
