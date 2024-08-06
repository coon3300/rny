package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.ItemMapper;
import co.rny.vo.ItemVO;

public class ItemServiceImpl implements ItemService{

	SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
	ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
	
	@Override
	public List<ItemVO> itemList(int lineNo) {
		return mapper.selectList(lineNo);
	}

	@Override
	public List<ItemVO> itemListRelated() {
		return mapper.selectListRelated();

	}

	@Override
	public ItemVO itemSelected(int itemNo) {
		return mapper.selectOne(itemNo);

	}

}
