package co.rny.mapper;

import java.util.List;

import co.rny.vo.WishListVO;
import co.rny.vo.WishVO;

public interface WishMapper {
	String wish(String no);
	List<WishListVO> wishItemList(String id);
	List<WishVO> wishheart(String id);
}
