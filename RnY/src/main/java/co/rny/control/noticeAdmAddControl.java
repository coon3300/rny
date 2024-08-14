package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.rny.common.Control;
import co.rny.service.NoticeService;
import co.rny.service.NoticeServiceImpl;
import co.rny.vo.NoticeVO;

public class noticeAdmAddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String writer = req.getParameter("userId");
		String content = req.getParameter("noticeContent");
		String title = req.getParameter("noticeTitle");
		String savePath = req.getServletContext().getRealPath("images");
		int maxSize = 1080 * 1080 * 5 ;
		MultipartRequest request = new MultipartRequest(req, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy()); 
		// 1.요청정보 2.업로드 경로 3. 최대크기 지정 4. 파일명 해석 인코딩 방식지정, 5.리네임정책
		
		writer = request.getParameter("userId");
		content = request.getParameter("noticeContent");
		title = request.getParameter("noticeTitle");
		String images = request.getFilesystemName("noticeImage");
		
		
		NoticeVO nvo = new NoticeVO();
		nvo.setUserId(writer);
		nvo.setNoticeContent(content);
		nvo.setNoticeTitle(title);
		nvo.setNoticeImage(images);
		
		NoticeService nvc = new NoticeServiceImpl();
		if (nvc.noticeAdmAdd(nvo)) {
			//목록이동
			resp.sendRedirect("noticeAdm.do");
		}
	}

}