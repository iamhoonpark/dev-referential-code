package com.jbp.djdn.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Certificate;

@Repository
public class CertificatesDAOImpl implements CertificatesDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	//2020-08-12
	public int insertMentorCertificates(Certificate certificate) {
		return session.insert("certificates.insertMentorCertificates", certificate);
	}  
	
	//2020-08-12
	@Override
	public int selectCategoryNo(String categoryName) {
		// TODO Auto-generated method stub
		return session.selectOne("category.selectCategoryNo", categoryName);
	}
	
	//2020-08-12 동범 mentorProfile Category 삭제
	public int deleteByAppealNo(int appealNo) {
		return session.delete("certificates.deleteByAppealNo", appealNo);
	}	
}
