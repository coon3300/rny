package co.rny.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.rny.vo.BasketVO;

public interface BasketMapper {
	int insertBasketDetail(@Param("logid") String logid, @Param("itemNo") int itemNo, @Param("quantity") int quantity);
	List<BasketVO> selectList(String logid);
	List<BasketVO> selectListBuy(String logid);
	int selectIsBasket(String logid);
	int insertBasket(String logid);
	int updateBasket(String logid);
	int updateBasketDetail(String logid);
}
