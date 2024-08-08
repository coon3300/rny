package co.rny.service;

import java.util.List;

import co.rny.vo.OrderVO;
import co.rny.vo.WishListVO;
import co.rny.vo.WishVO;

public interface WishService {
	String wishname(String wishnm); // 찜상품이름
	public List<WishListVO> wishItem(String id);
	public List<WishVO> wishheart(String id);
	
}
