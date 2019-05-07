package com.oracle.ssh.service;

import com.oracle.web.bean.Admin;

public interface AdminService {

	int add(Admin admin);
	
	/* Admin loginYanZheng(Admin admin);*/

	 Admin FindByUsername(String userName);

 

}
