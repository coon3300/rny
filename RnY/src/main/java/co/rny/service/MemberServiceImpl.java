package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.common.SearchVO;
import co.rny.mapper.MemberMapper;
import co.rny.service.MemberService;
import co.rny.vo.AddressVO;
import co.rny.vo.MemberVO;
import co.rny.vo.WishVO;

public class MemberServiceImpl implements MemberService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true); // true 
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

	@Override
	public List<MemberVO> memberList(int page) {
		return mapper.selectList(page);
	}

	@Override
	public boolean addMember(MemberVO mvo) {
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

	@Override
	public MemberVO memberpage(int userNo) {
		return mapper.selectBoard(userNo);
	}

	@Override
	public int totalCount(SearchVO search) {
		return mapper.selectTotalCount(search);
	}

	@Override
	public List<MemberVO> memberList(SearchVO search) {
		return mapper.selectListPaging(search);
	}

	@Override
	public String userName(String id) {
		return mapper.username(id);
	}

	@Override
	public boolean address(AddressVO avo) {
		return mapper.insertAddress(avo) == 1;
	}

	@Override
	public String userCheck(String id) {
		return mapper.userCheck(id);
	}

	@Override
	public List<AddressVO> myaddressList(AddressVO avo) {
		return mapper.selectAddress(avo);
	}

	@Override
	public boolean modifymember(MemberVO mvo) {
		return  mapper.updateList(mvo) == 1;
	}

	@Override
	public boolean modifyaddress(AddressVO avo) {
		return mapper.updateaddress(avo) == 1;
	}

	@Override
	public boolean removemember(String userNo) {
		return mapper.deletemember(userNo) == 1;
	}

	@Override
	public boolean removeadd(String mainAdd) {
		return mapper.adddelete(mainAdd)==1;
	}

	
	

}
