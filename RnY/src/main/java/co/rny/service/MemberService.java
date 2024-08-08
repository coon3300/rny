package co.rny.service;

import java.util.List;

import co.rny.vo.MemberVO;
import co.rny.vo.WishVO;

public interface MemberService {
	public List<MemberVO> memberList(); // 회원목록
	MemberVO userinfo(String userNo); // 회원상세 
	public void addMember(MemberVO mvo); // 회원가입
	int selectId(String id); // 회원가입(ID중복체크)
	int selectEmail(String email); // 회원가입(ID중복체크)
	MemberVO loginCheck(String id, String pw); // 로그인
	String userNick(String id); // 닉네임
	
}
