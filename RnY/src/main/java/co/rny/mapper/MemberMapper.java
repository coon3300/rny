package co.rny.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.rny.common.SearchVO;
import co.rny.vo.AddressVO;
import co.rny.vo.MemberVO;

public interface MemberMapper {
	List<MemberVO> selectList(int page); // 회원목록
	List<MemberVO> selectList(SearchVO search); // 회원목록검색
	MemberVO userinfo(String userNo); // 회원상세목록
	int deletemember(String userNo); // 회원정보삭제
	int checkMainAdd(String userNo);
	int updateList(MemberVO mvo); // 회원정보수정
	int insertMember(MemberVO mvo); // 회원가입
	int selectId(String id); // 회원가입(중복체크)
	int selectEmail(String email); // 회원가입(중복체크)
	MemberVO selectMember(@Param("id") String id, @Param("pw") String pw);//로그인 체크
	String usernick(String id); //닉네임
	String username(String id); //이름
	String userCheck(String id); // 유저번호
	
	// 페이지
	List<MemberVO> selectListPaging(SearchVO search); //페이징
	int selectTotalCount(SearchVO search); // 검색
	MemberVO selectBoard(int userNo);
	
	
	int insertAddress(AddressVO avo); // 주소등록
	List<AddressVO> selectAddress(AddressVO avo); // 주소목록
	int updateaddress(AddressVO avo); // 주소수정
	int adddelete(String mainAdd); // 주소삭제
	
	
	
	
	
}
