package co.rny.mapper;

import java.util.List;

import co.rny.vo.WishVO;

public interface WishMapper {
	String wish(String no);
	List<WishVO> wishheart(String id);
	WishVO selectWish(int wishNo);
	int deleteWish(int wishNo);
	int plusWish(String userNo, int itemNo);
}
