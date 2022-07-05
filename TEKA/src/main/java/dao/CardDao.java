package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CardVo;
import vo.MyCardSetVo;
import vo.ViewVo;

public class CardDao {
	//single-ton : ��ü 1���� �����ؼ� �������
	static CardDao single = null;
	
	SqlSessionFactory factory;
	public static CardDao getInstance() {

		//��ü�� ������ �����ض�
		if (single == null)
			single = new CardDao();

		return single;
	}

	//�ܺο��� �������� ����
	private CardDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//��üī����ȸ	
	public List<ViewVo> selectList() {

		List<ViewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("card.selectAll");
		
		sqlSession.close();

		return list;
	}

	
	//����� ������ �˻��ϸ� �����̸����� ���͸� �ؼ� ��ƺ���
	public List<ViewVo> selectBySubject(String subject) {
		// TODO Auto-generated method stub
		List<ViewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("card.selectBySubject", subject);
		
		sqlSession.close();

		return list;
	}
	
	//���� �н� ��Ʈ �߰��ϱ�
	public int insertMyCard(MyCardSetVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.insert("card.insertMyCard", vo);
		
		sqlSession.close();
		
		return res;
	}
	
	//���� �н� ��Ʈ �߰��ϱ� �� �̹� �߰��Ǿ����� Ȯ���ϱ�
	public MyCardSetVo selectCheckMyCard(MyCardSetVo check) {
		// TODO Auto-generated method stub
		MyCardSetVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("card.selectCheckMyCard", check);
		
		sqlSession.close();
		
		return vo;
	}

	public List<ViewVo> selectMyCardList(int m_idx) {
		// TODO Auto-generated method stub
		List<ViewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("card.selectMyCardList", m_idx);
		
		sqlSession.close();
		
		return list;
	} 
}