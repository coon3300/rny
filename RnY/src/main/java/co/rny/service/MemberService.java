package co.rny.service;

import java.util.List;

import co.rny.common.SearchVO;
import co.rny.vo.AddressVO;
import co.rny.vo.MemberVO;

public interface MemberService {
	public List<MemberVO> memberList(int page); // 회원목록
	List<MemberVO> memberList(SearchVO search); // 회원목록
	List<AddressVO> myaddressList(AddressVO avo);
	MemberVO userinfo(String userNo); // 회원정보
	boolean removemember(String userNo); // 회원탈퇴
	
	boolean addMember(MemberVO mvo); // 회원가입
	boolean address(AddressVO avo); // 주소등록
	
	int selectId(String id); // 회원가입(ID중복체크)
	int selectEmail(String email); // 회원가입(이메일중복체크)
	
	MemberVO loginCheck(String id, String pw); // 로그인
	String userNick(String id); // 닉네임
	String userName(String id); // 이름
	String userCheck(String id); // 회원번호
	
	int totalCount(SearchVO search); // 페이징 계산시 건수
	MemberVO memberpage(int userNo);
	
	boolean modifymember(MemberVO mvo); // 회원정보수정
	boolean modifyaddress(AddressVO avo); // 주소수정
	boolean removeadd(String mainAdd); // 주소삭제
	
}
