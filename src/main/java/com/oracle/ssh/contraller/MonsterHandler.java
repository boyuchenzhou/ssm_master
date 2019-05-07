package com.oracle.ssh.contraller;

import java.util.List;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.ssh.service.MonsterService;
import com.oracle.ssh.service.SchoolService;
import com.oracle.web.bean.Monster;
import com.oracle.web.bean.Monster2;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.School;

@Controller
@Scope(value = "prototype")
public class MonsterHandler  {

	@Autowired
	private MonsterService monsterService;

	@Autowired
	private SchoolService schoolService;
	
 
	/*@RequestMapping(value="/monstershowPasgeMonster/{pageNow}",method=RequestMethod.GET)
	public String showPasgeMonster(@PathVariable(value="pageNow") Integer pageNow,HttpServletRequest request) {// 分页查看
 //System.out.println(pageNow);
 PageBean<Monster2> pb=new PageBean<Monster2>();
		if (pageNow == null || pageNow < 1) {
			pageNow = 1;
		}
		pb.setPageSize(4);
		int pageNows=(pageNow-1)*pb.getPageSize();	 
	    int  i=monsterService.count();
		pb.setCounts(i); 
		pb.setpageNow(pageNow);	
		List<Monster2> list = monsterService.showPesgefl(pageNows);
		pb.setBeanList(list);

		  //System.out.println(list.toString());
		request.setAttribute("pb", pb);

		// resp.sendRedirect("showUser.jsp");
		return "list2";

	}
	*/
	@RequestMapping(value="/monstershowPasgeMonster/{pageNow}",method=RequestMethod.GET)
	public String showPasgeMonster(@PathVariable(value="pageNow") Integer pageNow,HttpServletRequest request) {// 分页查看
 

		if (pageNow == null || pageNow < 1) {
			pageNow = 1;
		}
		
		PageBean<Monster2> pb=this.monsterService.selectAllByPageHelper(pageNow);
	

		  //System.out.println(list.toString());
		request.setAttribute("pb", pb);
		
		//System.out.println(pb);

		// resp.sendRedirect("showUser.jsp");
		return "list2";

	}
	@RequestMapping(value="/addUl",method=RequestMethod.GET) 
	public String addUl(HttpServletRequest request) {// 添加门派显示
		List<School> slist = this.schoolService.slist();
		request.setAttribute("slist", slist);
		return "add";
	}

	//转发forward:/....     重定向:redirect:/...
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(Monster monster) {// 添加妖怪
		// System.out.println(monster.toString());
		int i = this.monsterService.save(monster);
		if (i > 0) {
			return "redirect:/monstershowPasgeMonster/1";
		} else {
			return "forward:/addUl";
		}

	}
	@RequestMapping(value="/monsterdelete/{monsterId}",method=RequestMethod.DELETE)
	public String delete(@PathVariable(value="monsterId") Integer monsterId) {// 妖怪

		Monster m=new Monster();
		m.setMonsterId(monsterId);
		this.monsterService.delete(m);
		return "redirect:/monstershowPasgeMonster/1";

	}
	
	@RequestMapping(value="/monsterupdateUl/{monsterId}",method=RequestMethod.GET)
   public String updateUl(@PathVariable(value="monsterId") Integer monsterId,HttpServletRequest request) {// 妖怪

		 
		List<School> slist = this.schoolService.slist();
		request.setAttribute("slist", slist);
		Monster  m = this.monsterService.showOne(monsterId);
		// System.out.println(list.toString());
		request.setAttribute("m", m);
		return "update";

	}
	
	@RequestMapping(value="/monsterupdate",method=RequestMethod.PUT)
	public String update(Monster monster) {// 妖怪

		//System.out.println(monster.toString());
		this.monsterService.update(monster);

		return "redirect:/monstershowPasgeMonster/1";

	}
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index() {//返回
		 
		return "index";
	}
}
