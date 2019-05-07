package com.oracle.web.mapper;

import com.oracle.web.bean.Monster;
import com.oracle.web.bean.Monster2;
import com.oracle.web.bean.PageBean;

import java.util.List;

public interface MonsterMapper {
    int deleteByPrimaryKey(Integer monsterId);

    int insert(Monster record);

    Monster  selectByPrimaryKey(Integer monsterId);

    List<Monster> selectAll();

    int updateByPrimaryKey(Monster record);

	List<Monster2> showPesgefl(int pageNow);

	int count();

	List<Monster2> selectAllByPageHelper();

	 
}