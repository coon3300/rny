package co.rny.common;

import org.apache.ibatis.session.SqlSession;

import co.rny.mapper.MemberMapper;

public class AppTest {

	public static void main(String[] args) {

		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.selectList(2).forEach(buy -> {

			System.out.println(buy);
		});

	}
}
