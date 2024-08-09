package co.rny.mapper;

import java.util.List;

import co.rny.vo.WishListVO;
import co.rny.vo.WishVO;

public interface WishMapper {
	String wish(String no);
	List<WishVO> wishheart(String id);
}
