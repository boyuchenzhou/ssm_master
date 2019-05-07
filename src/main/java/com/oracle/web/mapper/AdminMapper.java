package com.oracle.web.mapper;

import com.oracle.web.bean.Admin;
import java.util.List;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer adminid);

    int insert(Admin record);

    Admin selectByPrimaryKey(Integer adminid);

    List<Admin> selectAll();

    int updateByPrimaryKey(Admin record);
/*
	Admin loginYanZheng(Admin admin);
*/
	Admin FindByUsername(String userName);
}