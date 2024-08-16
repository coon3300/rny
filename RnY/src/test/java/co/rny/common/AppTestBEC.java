package co.rny.common;

import org.apache.ibatis.session.SqlSession;

import co.rny.mapper.QnaListMapper;

public class AppTestBEC {

	public static void main(String[] args) {

		/*
		 * SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		 * QnaListMapper mapper = sqlSession.getMapper(QnaListMapper .class);
		 * mapper.qnaList().forEach(qna -> { System.out.println(qna); });
		 *
		 */
		
		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		QnaListMapper mapper = sqlSession.getMapper(QnaListMapper.class);

		System.out.println(mapper.qnaPaging(1));
		
		//mapper.qnaPaging(1).forEach(qna -> { System.out.println(qna); });

		/*
		 * 
		 * SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		 * ItemMapper mapper = sqlSession.getMapper(ItemMapper .class);
		 * mapper.selectList(11).forEach(line -> { System.out.println(line); });
		 */

	}
}
