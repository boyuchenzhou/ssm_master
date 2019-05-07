package com.oracle.ssh.service;

import java.util.List;

import com.oracle.web.bean.Monster;
import com.oracle.web.bean.Monster2;
import com.oracle.web.bean.PageBean;

 
public interface MonsterService {

	List<Monster> list();

	 

	void delete(Monster monster);

	Monster  showOne(Integer integer);

	void update(Monster monster);
/*
	PageBean<Monster> showPesgefl(int pageNow, int pageSize);
*/
	int save(Monster monster);



	List<Monster2> showPesgefl(int pageNow);



	int count();



	PageBean<Monster2> selectAllByPageHelper(Integer pageNow);

	 

 

}
