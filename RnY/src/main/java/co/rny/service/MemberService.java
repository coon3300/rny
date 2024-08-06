package co.rny.service;

import java.util.List;

import co.rny.vo.MemberVO;

public interface MemberService {
	public List<MemberVO> memberList();

	public boolean addMember(MemberVO mvo);
}
