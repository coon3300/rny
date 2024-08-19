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
import co.rny.control.AddReviewFormControl;
import co.rny.control.AddUpdateControl;
import co.rny.control.AddWish;
import co.rny.control.AddressControl;
import co.rny.control.AddressFormControl;
import co.rny.control.AdminPageControl;
import co.rny.control.CartAddControl;
import co.rny.control.CartListControl;
import co.rny.control.CartRemoveControl;
import co.rny.control.ContactControl;
import co.rny.control.DeleteMemberControl;
import co.rny.control.DeleteReplyControl;
import co.rny.control.DeleteWish;
import co.rny.control.EmailCheckControl;
import co.rny.control.IdCheckControl;
import co.rny.control.ItemAddControl;
import co.rny.control.ItemFormControl;
import co.rny.control.ItemInfoControl;
import co.rny.control.ItemListControl;
import co.rny.control.ItemListJsonControl;
import co.rny.control.ItemListLineControl;
import co.rny.control.ItemListSearchControl;
import co.rny.control.ItemManageControl;
import co.rny.control.ItemModifyControl;
import co.rny.control.ItemRemoveControl;
import co.rny.control.ItemRestoreControl;
import co.rny.control.ItemUpdateControl;
import co.rny.control.LineAddControl;
import co.rny.control.LineFormControl;
import co.rny.control.LineManageControl;
import co.rny.control.LineModifyControl;
import co.rny.control.LineRemoveControl;
import co.rny.control.LineRestoreControl;
import co.rny.control.LineUpdateControl;
import co.rny.control.MemberListControl;
import co.rny.control.MyAddressControl;
import co.rny.control.MyPageControl;
import co.rny.control.NoticeAdmControl;
import co.rny.control.NoticeControl;
import co.rny.control.NoticeListControl;
import co.rny.control.OrderCheckControl;
import co.rny.control.OrderControl;
import co.rny.control.OrderDetailListControl;
import co.rny.control.OrderListControl;
import co.rny.control.PayControl;
import co.rny.control.QnaControl;
import co.rny.control.QnaListControl;
import co.rny.control.QnaReplyControl;
import co.rny.control.QnaReplyListControl;
import co.rny.control.ReviewControl;
import co.rny.control.ReviewLikeControl;
import co.rny.control.ReviewListControl;
import co.rny.control.UpdateUserControl;
import co.rny.control.UpdateUserFormControl;
import co.rny.control.UserControl;
import co.rny.control.WishControl;
import co.rny.control.loginControl;
import co.rny.control.mainControl;
import co.rny.control.noticeAdmAddControl;
import co.rny.control.noticeAdmDetailControl;
import co.rny.control.noticeFormControl;

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
		// 아이템 라인
		map.put("/itemListLine.do", new ItemListLineControl());
		// 아이템 관리
		map.put("/itemManage.do", new ItemManageControl());
		// 아이템 수정 form
		map.put("/itemModify.do", new ItemModifyControl());
		// 아이템 업데이트
		map.put("/itemUpdate.do", new ItemUpdateControl());
		// 아이템 삭제
		map.put("/itemRemove.do", new ItemRemoveControl());
		// 아이템 삭제 취소
		map.put("/itemRestore.do", new ItemRestoreControl());
		// 아이템 등록 form
		map.put("/itemForm.do", new ItemFormControl());
		// 아이템 등록
		map.put("/itemAdd.do", new ItemAddControl());
		// 라인 관리
		map.put("/lineManage.do", new LineManageControl());
		// 라인 수정 form
		map.put("/lineModify.do", new LineModifyControl());
		// 라인 업데이트
		map.put("/lineUpdate.do", new LineUpdateControl());
		// 라인 삭제
		map.put("/lineRemove.do", new LineRemoveControl());
		// 라인 삭제 취소
		map.put("/lineRestore.do", new LineRestoreControl());
		// 라인 등록 form
		map.put("/lineForm.do", new LineFormControl());
		// 라인 등록
		map.put("/lineAdd.do", new LineAddControl());

		
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
		// 주소록 수정
		map.put("/addupdate.do", new AddUpdateControl());
		
		// 하린아=================================================================
		
		
		
		
		

		
		//==================예림====================
		
		/* 위시 */
		// 위시리스트
		map.put("/wish.do", new WishControl());
		// 찜 등록
		map.put("/addWish.do", new AddWish()); 
		// 찜 삭제
		map.put("/deleteWish.do", new DeleteWish()); 
		
		
		
		/* 장바구니 */
		// 장바구니 (화면)
		map.put("/cartList.do", new CartListControl());
		// 장바구니 (삭제)
		map.put("/cartRemove.do", new CartRemoveControl());
		// 장바구니 추가 (기능)
		map.put("/cartAdd.do", new CartAddControl());
		
		
		
		/* 주문 */
		// 주문 (화면)
		map.put("/orderList.do", new OrderListControl()); 
		// 주문 (기능)
		map.put("/order.do", new OrderControl()); 
		// 주문상세 (기능)
		map.put("/orderDetailList.do", new OrderDetailListControl()); 
		// 주문확인(기능)
		map.put("/orderCheck.do", new OrderCheckControl());
		
		
		
		// 결제페이지
		map.put("/pay.do", new PayControl());
		
		
		//==================예림====================

		
		
		
		
		
		
		// 공지사항 목록
		map.put("/noticeList.do", new NoticeListControl());
		// 공지사항 상세
		map.put("/notice.do", new NoticeControl());
		
		//(관리자) 공지사항
		map.put("/noticeAdm.do", new NoticeAdmControl());
		//(관리자) 공지사항 상세
		map.put("/noticeAdmDetail.do", new noticeAdmDetailControl());
		//(관리자) 공지사항 등록
		map.put("/noticeForm.do", new noticeFormControl());
		map.put("/noticeAdmAdd.do", new noticeAdmAddControl());
			

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
		//Review 상세
		map.put("/review.do", new ReviewControl());
		//Review 등록
		map.put("/reviewForm.do", new AddReviewFormControl());
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
