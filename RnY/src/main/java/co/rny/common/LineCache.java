package co.rny.common;

import java.util.List;

import co.rny.service.LineService;
import co.rny.service.LineServiceImpl;
import co.rny.vo.LineVO;
import lombok.Data;

@Data
public class LineCache {
	
    private static List<LineVO> lineList;

    public static void initialize() {
//        System.out.println("LineCache: Initialization started");
        try {
            LineService svc = new LineServiceImpl();
            lineList = svc.lineList();
//            System.out.println("LineCache: Initialization completed. List size: " + (lineList != null ? lineList.size() : 0));
        } catch (Exception e) {
//            System.out.println("LineCache: Error during initialization: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static List<LineVO> getLineList() {
        return lineList;
    }
}
