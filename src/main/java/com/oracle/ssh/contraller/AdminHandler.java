package com.oracle.ssh.contraller;

 
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

 
import com.oracle.ssh.service.AdminService;
import com.oracle.ssh.service.SchoolService;
import com.oracle.web.bean.Admin;
 
@Controller
@Scope(value="prototype")
public class AdminHandler  {

 
	@Autowired
	private SchoolService  schoolService;
	
	@Autowired
	private AdminService adminService;


	@RequestMapping(value="/ulAdmin",method=RequestMethod.GET)
	public String add() {//返回
		 
		return "addAdmin";
	}
 
	@RequestMapping(value="/addAdmin",method=RequestMethod.POST)
	public String addAdmin(Admin admin,@RequestParam(value="touxiang1") MultipartFile file,HttpSession session) throws IOException{//管理员
	
		String realPath = session.getServletContext().getRealPath("/upload");
		
		  //System.out.println(file.getOriginalFilename());
	     // String  path ="/upload/"+file.getOriginalFilename();
	     
	      int hashCode=file.getOriginalFilename().hashCode();
			String hex=Integer.toHexString(hashCode);
			char c1=hex.charAt(0);
			char c2=hex.charAt(1);
			//realPath=realPath+"/"+c1+"/"+c2;
			
			 
	        String redlName=UUID.randomUUID().toString()+"_"+file.getOriginalFilename();
	        String savepath = "/" + c1 + "/" + c2 + "/" + redlName;
	        File saveFile=new File(realPath+savepath);
	        saveFile.mkdirs();
	        file.transferTo(saveFile);
	      
	      admin.setTouxiang("/upload"+savepath);
		 
		
		 int i=this.adminService.add(admin);
		 session.setAttribute("url","upload/"+savepath);
		 if(i>0){
			 return "redirect:/login.jsp";
		 }else{
			 return "ulAdmin";
		 }
 
	}
	
	 @RequestMapping(value="/findByName",method=RequestMethod.GET)
	public void findByName(@RequestParam(value="username") String username,HttpServletResponse response) throws IOException{
       // 调用service进行查询
    	//System.out.println(userName);
		 response.setContentType("text/html;charset=UTF-8");
       Admin admin= adminService.FindByUsername(username);
       
      // System.out.println(existUser);
        //获取response对象，向页面输出信息
        //HttpServletResponse response = ServletActionContext.getResponse();
       
       // 判断是否为空  
        if(admin==null){
            //用户名已经存在，不能注册
          //  有异常则向上抛出	
        	response.getWriter().write("{\"valid\":\"true\"}");
        } else{
            //用户名不存在，可以注册
        	 
        	 response.getWriter().write("{\"valid\":\"false\"}");
        	
        }
     //   AJAX操作，不需要页面跳转
         
   }
	
	@RequestMapping(value="/loginYanZheng",method=RequestMethod.POST)
	public String loginYanZheng(Admin admin){//管理员
		 
		Admin	admin2=this.adminService.FindByUsername(admin.getUsername());
		
	 	 
		if (admin2 == null) {
			//request.getWriter().write("{\"valid\":\"false\"}");

			return "login";
		}

		if (!admin2.getPassword().equals(admin.getPassword())) {
			//resp.getWriter().write("{\"valid\":\"false\"}");
			return "login";
		} else {

			//resp.getWriter().write("{\"valid\":\"true\"}");
			return "index";
		}
	 

		} 
	
}
