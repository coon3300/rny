package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.rny.common.Control;
import co.rny.service.ReviewService;
import co.rny.service.ReviewServiceImpl;
import co.rny.vo.ReviewVO;

public class ReviewImageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// key=value 처리위한 application/x-www.form-urlencode 방식.

		String userId = req.getParameter("userId");
		String content = req.getParameter("content");
		String title = req.getParameter("title");
		String itemNo = req.getParameter("itemNo");
		// 파일 전송 multipart/form-data 방식. cos라이브러리.
		// 1. 파일 업로드(images) 2.DB입력.
		String savePath = req.getServletContext().getRealPath("images");
		int maxSize = 1024 * 1024 * 5;
		MultipartRequest request = new MultipartRequest(req, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		// 1.요청정보 2.업로드 경로 3. 최대크기 지정 4. 파일명 해석 인코딩 방식지정, 5.리네임정책

		userId = request.getParameter("userId");
		content = request.getParameter("content");
		title = request.getParameter("title");
		itemNo = request.getParameter("itemNo");
		String images = request.getFilesystemName("image");

		ReviewVO rvo = new ReviewVO();
		rvo.setUserId(userId);
		rvo.setReviewContent(content);
		rvo.setReviewTitle(title);
		rvo.setItemNo(Integer.parseInt(itemNo));
		rvo.setReviewImage(images);

		ReviewService svc = new ReviewServiceImpl();
		if (svc.addReview(rvo)) {
			// 목록이동
            resp.sendRedirect("iteminfo.do?itemNo=" + itemNo);
		}
	}

}
