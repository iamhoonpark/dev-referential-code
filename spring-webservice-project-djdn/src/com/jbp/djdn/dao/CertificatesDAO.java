package com.jbp.djdn.dao;

import com.jbp.djdn.vo.Certificate;

public interface CertificatesDAO {

	public int insertMentorCertificates(Certificate certificate);
	
	//2020-08-10 동범 카테고리이름별 번호찾기
	public int selectCategoryNo(String categoryName);
	
	//2020-08-12 동범 mentorProfile Category 삭제
	public int deleteByAppealNo(int appealNo);
}
