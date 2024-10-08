package co.rny.service;

import java.util.List;

import co.rny.vo.MemberVO;
import co.rny.vo.WishVO;

public interface WishService {
	String wishname(String wishnm); // 찜상품이름
	public List<WishVO> wishheart(String id);
	WishVO getWish(int wishNo);
	boolean removeWish(int WishNo);
	//boolean addWish(ItemVO ivo, MemberVO mvo);
	//boolean addWish(String userNo, int itemNO);
	//boolean addWish(int itemNO);
	boolean addWish(MemberVO mvo);
}
