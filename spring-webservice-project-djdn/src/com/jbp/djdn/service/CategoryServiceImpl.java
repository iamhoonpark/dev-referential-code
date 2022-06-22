package com.jbp.djdn.service;

import java.util.List;

import com.jbp.djdn.dao.CategoryDAO;
import com.jbp.djdn.vo.Category;

public class CategoryServiceImpl implements CategoryService{

	private CategoryDAO categoryDAO;
	
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}
	
	//2020-08-07 민겸 
		@Override
		public List<Category> getCategory(int categoryNo) {
			// TODO Auto-generated method stub
			return categoryDAO.selectCategoryNo(categoryNo);
		}
}
