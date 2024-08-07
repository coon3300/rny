package co.rny.mapper;

import java.util.List;

import co.rny.vo.MemberVO;

public interface MemberMapper {
	List<MemberVO> selectList(); // 회원목록
	MemberVO userinfo(String userNo); // 회원상세목록
	int insertMember(MemberVO mvo); // 회원가입
	
	
}
