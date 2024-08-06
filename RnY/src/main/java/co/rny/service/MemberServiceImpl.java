package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.MemberMapper;
import co.rny.service.MemberService;
import co.rny.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true); // true 넣으면 자동 커밋됨.
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

	@Override
	public List<MemberVO> memberList() {
		return mapper.selectList();
	}

	@Override
	public boolean addMember(MemberVO mvo) {
		return mapper.insertMember(mvo) == 1;
	}


	}


