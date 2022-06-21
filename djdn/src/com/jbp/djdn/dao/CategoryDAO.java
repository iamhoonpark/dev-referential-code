package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.Category;

public interface CategoryDAO {
	//2020-08-07 민겸
	public List<Category> selectCategoryNo(int categoryNo);

	public List<Category> selectListSubCategory(int no);

	public List<Category> selectListUpperCategory();

	// 2020-07-28
	public Category selectLessonCategoryByNo(int categoryNo);
	
	//2020-08-10 동범 카테고리이름으로 번호찾기
	public int selectCategoryNo(String categoryName);
}
