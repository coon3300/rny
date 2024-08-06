package co.rny.common;

import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import co.rny.vo.LineVO;

@WebListener
public class AppInitializer implements ServletContextListener {
    private static final Logger logger = Logger.getLogger(AppInitializer.class.getName());

    @Override
    public void contextInitialized(ServletContextEvent sce) {
//        System.out.println("AppInitializer: Context initialization started");
    	
        logger.info("AppInitializer: Context initialization started");
        try {
            LineCache.initialize();
            logger.info("AppInitializer: CategoryCache initialized successfully");
            List<LineVO> lineList = LineCache.getLineList();
            logger.info("AppInitializer: Number of categories loaded: " + (lineList != null ? lineList.size() : 0));
        } catch (Exception e) {
            logger.severe("AppInitializer: Error initializing CategoryCache: " + e.getMessage());
            e.printStackTrace();
        }
    }

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}
}