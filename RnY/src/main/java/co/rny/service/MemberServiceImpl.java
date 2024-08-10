package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.MemberMapper;
import co.rny.service.MemberService;
import co.rny.vo.MemberVO;
import co.rny.vo.WishVO;

public class MemberServiceImpl implements MemberService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true); // true 넣으면 자동 커밋됨.
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	

	@Override
	public List<MemberVO> memberList() {
		return mapper.selectList();
	}

	@Override
	public boolean addMember(MemberVO mvo) {
//		System.out.println("userBirth in Service: " + mvo.getUserBirth());
		return mapper.insertMember(mvo) == 1;
	}

	@Override
	public MemberVO userinfo(String userNo) {
		return mapper.userinfo(userNo);
	}

	@Override
	public MemberVO loginCheck(String id, String pw) {
		return mapper.selectMember(id, pw);
	}

	@Override
	public String userNick(String id) {
		return mapper.usernick(id);
	}
	
	@Override
	public int selectId(String userId) {
		 return mapper.selectId(userId);
	}
	
	@Override
	public int selectEmail(String email) {
		 return mapper.selectEmail(email);
	}
  
}
