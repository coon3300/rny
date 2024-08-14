package co.rny.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.control.AddDeleteControl;
import co.rny.control.AddFormControl;
import co.rny.control.AddMemberControl;
import co.rny.control.AddWish;
import co.rny.control.AddressControl;
import co.rny.control.AddressFormControl;
import co.rny.control.AdminPageControl;
import co.rny.control.CartControl;
import co.rny.control.ContactControl;
import co.rny.control.DeleteCartControl;
import co.rny.control.DeleteMemberControl;
import co.rny.control.DeleteReplyControl;
import co.rny.control.DeleteWish;
import co.rny.control.EmailCheckControl;
import co.rny.control.IdCheckControl;
import co.rny.control.ItemInfoControl;
import co.rny.control.ItemListControl;
import co.rny.control.ItemListJsonControl;
import co.rny.control.ItemListSearchControl;
import co.rny.control.ItemManageControl;
import co.rny.control.MemberListControl;
import co.rny.control.MyAddressControl;
import co.rny.control.MyPageControl;
import co.rny.control.NoticeControl;
import co.rny.control.NoticeListControl;
import co.rny.control.OrderCheckControl;
import co.rny.control.OrderControl;
import co.rny.control.PayControl;
import co.rny.control.QnaControl;
import co.rny.control.QnaListControl;
import co.rny.control.QnaReplyControl;
import co.rny.control.QnaReplyListControl;
import co.rny.control.ReviewLikeControl;
import co.rny.control.ReviewListControl;
import co.rny.control.UpdateUserControl;
import co.rny.control.UpdateUserFormControl;
import co.rny.control.UserControl;
import co.rny.control.WishControl;
import co.rny.control.loginControl;
import co.rny.control.mainControl;

public class FrontController extends HttpServlet {

	Map<String, Control> map;

	public FrontController() {
		map = new HashMap<>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {

		// 메인
		map.put("/main.do", new mainControl());
		// 아이템 리스트
		map.put("/itemList.do", new ItemListControl());
		// 아이템 리스트 json
		map.put("/itemListJson.do", new ItemListJsonControl());
		// 아이템 정보
		map.put("/itemInfo.do", new ItemInfoControl());
		// 메인 -> Contact Us
		map.put("/contact.do", new ContactControl());
		// 아이템 검색
		map.put("/itemListSearch.do", new ItemListSearchControl());
		// 아이템 관리
		map.put("/itemManage.do", new ItemManageControl());

		
		// 하린아=================================================================
		// 관리자 메인
		map.put("/adminpage.do", new AdminPageControl());
		// 회원목록 출력
		map.put("/memberList.do", new MemberListControl());
		// 회원목록 삭제
		map.put("/deletemember.do", new DeleteMemberControl());
		// )회원상세목록
		map.put("/user.do", new UserControl());
		

		// 회원가입
		map.put("/addform.do", new AddFormControl());
		// 회원가입
		map.put("/addMember.do", new AddMemberControl());
		// 회원가입(중복체크)
		map.put("/idCheck.do", new IdCheckControl());
		map.put("/emailCheck.do", new EmailCheckControl());
		
		
		// 로그인
		map.put("/login.do", new loginControl());
		// 로그아웃
		map.put("/logout.do", new logOutControl());

		// 마이페이지
		map.put("/mypage.do", new MyPageControl());
		// 회원정보수정
		map.put("/updateuser.do", new UpdateUserControl());
		// 회원정보수정
		map.put("/updateuserform.do", new UpdateUserFormControl());
		
		
		// 주소록등록
		map.put("/address.do", new AddressControl());
		// 주소록(값받는애)
		map.put("/addressform.do", new AddressFormControl());
		// 주소록
		map.put("/myaddress.do", new MyAddressControl());
		// 주소록 삭제
		map.put("/adddelete.do", new AddDeleteControl());
		// 하린아=================================================================
		
		

		// 주문
		map.put("/order.do", new OrderControl());
		map.put("/ordercheck.do", new OrderCheckControl()); // 주문상세
		// 결제페이지
		map.put("/pay.do", new PayControl());
		// 위시리스트
		map.put("/wish.do", new WishControl());
		map.put("/addWish.do", new AddWish()); // 찜 등록
		map.put("/deleteWish.do", new DeleteWish()); // 찜 삭제
		// 장바구니
		map.put("/cart.do", new CartControl());
		map.put("/deleteCart.do", new DeleteCartControl()); // 장바구니 삭제

		// 공지사항 목록
		map.put("/noticeList.do", new NoticeListControl());
		// 공지사항 상세
		map.put("/notice.do", new NoticeControl());

		// QnA 목록
		map.put("/qnaList.do", new QnaListControl());
		// QnA 상세
		map.put("/qna.do", new QnaControl());
		// QnA 댓글
		map.put("/qnaReply.do", new QnaReplyControl());
		// QnA 댓글목록
		map.put("/qnaReplyList.do", new QnaReplyListControl());
		// QnA 댓글삭제
		map.put("/deleteReply.do", new DeleteReplyControl());
		
		//Review 목록
		map.put("/reviewList.do", new ReviewListControl());
		//Review 좋아요.........싫어요.......
		map.put("/reviewLike.do", new ReviewLikeControl());
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) //
			throws ServletException, IOException {
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String path = uri.substring(context.length());
		System.out.println(path);
		Control sub = map.get(path);
		sub.exec(req, resp);
	}
}
