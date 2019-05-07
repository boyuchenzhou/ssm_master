<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	//alert("ok");
	
	$(".deletemontser").click(function(){
		//拿到请求地址
		var $url=this.href;
		
		//alert($url);
		  //拿到表单
		$("#deleteForm").attr("action",$url);
		
		//提交表单
		$("#deleteForm").submit();
		
		return false; 
	}); 
	
	
});
</script>
</head>
<body>
	<div class="container ">
		<h1 align="center">
  <img alt="" src="${sessionScope.url }" width="50px" height="50px">妖怪管理系统------姜子牙专用版<small>&lt;妖怪列表页&gt;</small>
		</h1>
		<table width="1100px">
		<tr><td>  
		<table class="table table-hover table-striped">
			<tr align="center">
				<th>妖怪编号</th>
				<th>妖怪姓名</th>
				<th>妖怪邮箱</th>
				<th>妖怪生日</th>
				<th>妖怪入职时间</th>
				<th>门派名称</th>
				<th>点击删除</th>
				<th>点击修改</th>
			</tr>
			<c:forEach items="${pb.beanList }" var="m" >
				<tr>
					<td>${m.monsterId }</td>
					<td>${m.monstername }</td>
					<td>${m.email }</td>
					<td><fmt:formatDate  pattern="yyyy-MM-dd" value="${m.birthday }"></fmt:formatDate></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${m.entryday }"></fmt:formatDate></td>
					<td>${m.school.schoolname}</td>
					<td><a href="http://localhost/ssm_crud/monsterdelete/${m.monsterId }" class="deletemontser btn btn-warning"   >删除<a></td>
					<td><a href="http://localhost/ssm_crud/monsterupdateUl/${m.monsterId }" class="btn  btn btn-info" >修改<a></td>
				</tr>
			</c:forEach>
		</table> 
	
		</td>	 
		</tr>
		<tr><td>
		<form action="" method="post" id="deleteForm">
       <input type="hidden" name="_method" value="DELETE">
           </form>
		</td></tr>
			
		<tr >
		<td>
		 <center>
		<p >  
		  第${pb.pageNow }页/共${pb.pages }&nbsp;&nbsp;&nbsp;&nbsp;
		  <ul class="pagination ">
				 <li><a href="http://localhost/ssm_crud/monstershowPasgeMonster/1"> 首页</a>
									&nbsp;&nbsp;&nbsp;&nbsp;
				 </li>
						 	<c:if test="${pb.pageNow>1 }">
								 <li><a aria-label="Previous" href="http://localhost/ssm_crud/monstershowPasgeMonster/${pb.pageNow-1 }"><span
												aria-hidden="ture">上一页</span></a>
												</li>
									</c:if>									 
						 <!-- 分页2种情况
			               1.页数小于10
			                   2.页数大于10  -->							 
									<c:choose>
										<c:when test="${pb.pages<=10 }">
											<c:set var="begin" value="1"></c:set>
											<c:set var="end" value="${pb.pages }"></c:set>
										</c:when>
										<c:otherwise>
											<c:set var="begin" value="${pb.pageNow-5 }"></c:set>
											<c:set var="end" value="${pb.pageNow+4 }"></c:set>
											<c:if test="${begin<=1 }">
												<c:set var="begin" value="1"></c:set>
												<c:set var="end" value="10"></c:set>
											</c:if>
											<c:if test="${end>=pb.pages }">
												<c:set var="begin" value="${pb.pages-9 }"></c:set>
												<c:set var="end" value="${pb.pages}"></c:set>
											</c:if>

										</c:otherwise>
									</c:choose>
									<!-- 每页面显示10页数 -->

									<c:forEach begin="${begin }" end="${end }" var="i">
										<c:choose>
											<c:when test="${pb.pageNow==i }">
												<li class="active"><span>${i }</span></li>
											</c:when>
											<c:otherwise>
												<li><a href="http://localhost/ssm_crud/monstershowPasgeMonster/${i}">${i }</a>
													</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
                                

									<c:if test="${pb.pageNow<pb.pages }">
										<li> 
										<a href="http://localhost/ssm_crud/monstershowPasgeMonster/${pb.pageNow+1 }"
											aria-label="Previous"><span aria-hidden="ture">下一页</span></a>
										</li>
									</c:if>
									
									 
									 
										<li>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="http://localhost/ssm_crud/monstershowPasgeMonster/${pb.pages}" >尾页
										</a>
										</li>								 
							 </ul>
						 </p>
                       
					</center>	
						 <br>
						 <a href="http://localhost/ssm_crud/addUl" >添加妖怪</a>&nbsp;&nbsp;&nbsp;<a href="http://localhost/ssm_crud/index" >返回</a>
					</td>
				</tr>
		</table>
		
	</div>
</body>
</html>