package co.rny.mapper;

import java.util.List;

import co.rny.vo.MemberVO;

public interface MemberMapper {
	List<MemberVO> selectList();
	int insertMember(MemberVO mvo);
	
}
