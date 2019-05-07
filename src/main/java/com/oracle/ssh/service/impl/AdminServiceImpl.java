package com.oracle.ssh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.oracle.ssh.service.AdminService;
import com.oracle.web.bean.Admin;
import com.oracle.web.mapper.AdminMapper;
import com.oracle.web.mapper.MonsterMapper;
@Service
public  class AdminServiceImpl implements AdminService {
	@Autowired
   private AdminMapper adminMapper;
	@Override
	@Transactional
	public int add(Admin admin) {
		// TODO Auto-generated method stub
		return this.adminMapper.insert(admin);
	}
 
/*	@Override
	@Transactional
	public Admin loginYanZheng(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.loginYanZheng(admin);
	}
 */
	@Override
	@Transactional
	public Admin FindByUsername(String userName) {
		// TODO Auto-generated method stub
		return this.adminMapper.FindByUsername(userName);
	}
 

	 

 

 
}
