package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.common.PageDTO;
import co.rny.common.SearchVO;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.vo.MemberVO;

public class MemberListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		String sc = req.getParameter("searchCondition");
		String kw = req.getParameter("keyword");

		SearchVO search = new SearchVO();
		search.setKeyword(kw);
		search.setPage(Integer.parseInt(page));
		search.setSearchCondition(sc);

		MemberService svc = new MemberServiceImpl();
		List<MemberVO> list = svc.memberList(search);
		int totalCnt = svc.totalCount(search);

		PageDTO paging = new PageDTO(Integer.parseInt(page), totalCnt, 15);

		req.setAttribute("memberList", list);
		req.setAttribute("paging", paging);
		req.setAttribute("searchCondition", sc);
		req.setAttribute("keyword", kw);

		// 세션에 값을 보여주기 위해서....req에 저장하고 삭제하기.
		HttpSession session = req.getSession();
		String msg = (String) session.getAttribute("mainAddMsg");
		if (msg != null) {
			req.setAttribute("mainAddMsg", msg);
			session.removeAttribute("mainAddMsg");
		}

		req.getRequestDispatcher("admin/memberList.tiles") // tiles.xml "/WEB-INF/jsp/{1}.jsp"
				.forward(req, resp); // 페이지 재지정

	}

}
