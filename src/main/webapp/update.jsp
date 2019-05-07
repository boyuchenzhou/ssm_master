<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
	<div class="container ">
		<h1 align="center">
			修改页面<small>&lt;姜子牙专用版&gt;</small>
		</h1>
		<hr width="1000px">
		<div class="col-sm-offset-3 ">
			<form class="form-horizontal" action="http://localhost/ssm_crud/monsterupdate" method="post">
			<input type="hidden" name="_method" value="PUT">
                <input type="hidden" name="monsterId" value="${m.monsterId }">
				<div class="form-group">
					<label for="monsterName" class="col-sm-2 control-label">门派</label>
 			<div class="col-sm-4">
						<select name="schoolFk" class="form-control">
							<c:forEach items="${slist }" var="s" >
								<c:if test="${s.schoolId==m.schoolFk }">
									<option value="${s.schoolId }" selected="selected">${s.schoolname }</option>
								</c:if>
								<c:if test="${s.schoolId!=m.schoolFk }">
									<option value="${s.schoolId }">${s.schoolname }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>  
				<div class="form-group">
					<label for="monsterName" class="col-sm-2 control-label">妖怪姓名</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="monsterName"
							name="monstername" value="${m.monstername }">
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">妖怪邮箱</label>
					<div class="col-sm-4">
						<input type="email" class="form-control" id="email"
							value="${m.email }" placeholder="Email" name="email">
					</div>
				</div>
				<div class="form-group">
					<label for="birthday" class="col-sm-2 control-label">妖怪生日</label>
					<div class="col-sm-4">
						<input type="date" class="form-control" id="birthday"
							name="birthday" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${m.birthday }"/>" >
					</div>
				</div>
				<div class="form-group">
					<label for="entryday" class="col-sm-2 control-label">妖怪入职时间</label>
					<div class="col-sm-4">
						<input type="date" class="form-control" id="entryday"
							name="entryday" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${m.entryday }"/>" >
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-4">
						<button type="submit" class="btn btn-primary btn-block">Sign
							in</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>