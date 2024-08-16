package co.rny.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.common.SearchVO;
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
	public List<ItemVO> itemInfoRelated(int lineNo) {
		return mapper.selectItemRelated(lineNo);
		
	}

	@Override
	public ItemVO itemSelected(int itemNo) {
		return mapper.selectOne(itemNo);

	}
	
	@Override
	public ItemVO itemSelectedAll(int itemNo) {
		return mapper.selectOneAll(itemNo);
		
	}

	@Override
	public List<Map<String, Object>> itemMapList(int itemNo) {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public List<ItemVO> itemListSearched(String keyword) {
//		// TODO Auto-generated method stub
//		return mapper.selectListSearched(keyword);
//	}

	@Override
	public List<ItemVO> itemListSearched(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.selectListPaging(search);
	}
	
	@Override
	public List<ItemVO> itemListSearchedAll(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.selectListPagingAll(search);
	}
	
	@Override
	public List<ItemVO> itemListLine(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.selectLinePaging(search);
	}

	@Override
	public int totalCount(SearchVO search) {
		return mapper.selectTotalCount(search);
	}
	
	@Override
	public int totalCountLine(SearchVO search) {
		return mapper.selectTotalCountLine(search);
	}

	@Override
	public boolean modifyItem(ItemVO item) {
		return mapper.updateItem(item) == 1;

	}

	@Override
	public boolean deleteItem(ItemVO item) {
		return mapper.updateItemDisabled(item) == 1;
	}
	
	@Override
	public boolean deleteItemCancel(ItemVO item) {
		return mapper.updateItemEnabled(item) == 1;
	}

	@Override
	public boolean addItem(ItemVO item) {
		return mapper.insertItem(item) == 1;
	}
}
