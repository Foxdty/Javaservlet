package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;

import com.laptrinhjavaweb.model.CategoryModel;

public class CategoryMapper implements RowMapper<CategoryModel>{

	@Override
	public CategoryModel mapRow(ResultSet resultset) {
		try {
			CategoryModel category = new CategoryModel();
			category.setId(resultset.getLong("id"));
			category.setCode(resultset.getString("code"));
			category.setName(resultset.getString("name"));
			return category;
		}catch (Exception e) {
			return null;
		}
	
	}
	

}
