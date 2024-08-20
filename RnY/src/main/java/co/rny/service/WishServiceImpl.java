package co.rny.service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.WishMapper;
import co.rny.vo.MemberVO;
import co.rny.vo.WishVO;

public class WishServiceImpl implements WishService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true); // true 넣으면 자동 커밋됨.
	WishMapper mapper = sqlSession.getMapper(WishMapper.class);
  @Override
  public String wishname(String wishnm) {
    return mapper.wish(wishnm);
  }
	@Override
	public List<WishVO> wishheart(String id) {
		return mapper.wishheart(id);
	}
	@Override
	public WishVO getWish(int wishNo) {
		return mapper.selectWish(wishNo);
	}
	@Override
	public boolean removeWish(int WishNo) {
		return mapper.deleteWish(WishNo) == 1;
	}
//	@Override
//	public boolean addWish(ItemVO ivo, MemberVO mvo) {
//		return mapper.plusWish(ivo, mvo) == 1;
//	}
//	@Override
//	public boolean addWish(String userNo, int itemNO) {
//		return mapper.plusWish(userNo, itemNO) == 1;
//	}
//	@Override
//	public boolean addWish(int itemNO) {
//		return mapper.plusWish(itemNO);
//	}
	@Override
	public boolean addWish(MemberVO mvo) {
		return mapper.plusWish(mvo) == 1;
	}
	
}
