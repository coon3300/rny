package co.rny.service;

import java.util.List;

import co.rny.vo.MemberVO;

public interface MemberService {
	public List<MemberVO> memberList(); // 회원목록
	MemberVO userinfo(String userNo); // 회원상세 
	public void addMember(MemberVO mvo); // 회원가입
	MemberVO loginCheck(String id, String pw); // 로그인
	
	
	
}
