package com.laptrinhjavaweb.mapper;

import com.laptrinhjavaweb.model.CategoryModel;
import com.laptrinhjavaweb.model.RoleModel;
import com.laptrinhjavaweb.model.UserModel;

import java.sql.ResultSet;

public class UserMapper implements RowMapper<UserModel>{
    @Override
    public UserModel mapRow(ResultSet resultset) {
        try {
            UserModel user = new UserModel();
            user.setId(resultset.getLong("id"));
            user.setUserName(resultset.getString("userName"));
            user.setFullName(resultset.getString("fullName"));
            user.setPassword(resultset.getString("password"));
            user.setStatus(resultset.getInt("status"));
            try {
                RoleModel role = new RoleModel();
                role.setName(resultset.getString("name"));
                role.setCode(resultset.getString("code"));
                user.setRole(role);
            }catch (Exception e){
                System.out.println(e.toString());
            }

            return user;
        }catch (Exception e) {
            return null;
        }

    }
}
