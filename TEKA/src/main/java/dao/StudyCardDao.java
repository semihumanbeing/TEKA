package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.ViewVo;

public class StudyCardDao {
	
	SqlSessionFactory factory;
	//single-ton : ��ü 1���� �����ؼ� �������
	static StudyCardDao single = null;

	public static StudyCardDao getInstance() {

		//��ü�� �����Ǿ� ���� ������ ������.
		if (single == null) {
			single = new StudyCardDao();
		}
		//������ ����� ���� ��ü�� �״�� ��ȯ�Ѵ�.
		return single;
	}

	//�ܺο��� �������� ���ϵ��� ��������. ��ü�� getInstance�޼ҵ带 ���ؼ��� ��������.
	private StudyCardDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//�н��ϱ� word -> ����&�亯 ��ȸ�ϱ� qnaCard ��
	public List<ViewVo> selectCard() {
		// TODO Auto-generated method stub
		
		List<ViewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("studyCard.selectCard");
		
		sqlSession.close();

		return list;
	}
}
