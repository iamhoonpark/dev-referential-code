package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-08-07 민겸
	@Override
	public List<Category> selectCategoryNo(int categoryNo) {
		// TODO Auto-generated method stub
		return session.selectList("lessons.selectCategoryNo", categoryNo);
	}

	@Override
	public List<Category> selectListSubCategory(int no) {
		return session.selectList("selectListSubCategory", no);
	}

	@Override
	public List<Category> selectListUpperCategory() {
		return session.selectList("category.selectListUpperCategory");
	}

	// 2020-07-28
	@Override
	public Category selectLessonCategoryByNo(int categoryNo) {
		return session.selectOne("category.selectLessonCategoryByNo", categoryNo);
	}
	
	//2020-08-10
	public int selectCategoryNo(String categoryName) {
		return session.selectOne("category.selectCategoryNo2", categoryName);
	}

}
