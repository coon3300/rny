package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.common.LineCache;
import co.rny.vo.LineVO;

public abstract class LineControl implements Control {
    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 공통 로직 (예: 라인 리스트 로딩)
        try {
            List<LineVO> lineList = LineCache.getLineList();
            req.setAttribute("lineList", lineList);
        } catch (Exception e) {
            req.setAttribute("errorMessage", "데이터 로딩 중 오류 발생");
        }

        // 실제 컨트롤러 로직 실행
        process(req, resp);

        // 뷰로 포워딩
        String viewPage = getViewPage();
        if (viewPage != null) {
            req.getRequestDispatcher(viewPage).forward(req, resp);
        }
    }

    protected abstract void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
    protected abstract String getViewPage();
}