<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
 <link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css" />
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<title>Insert title here</title>
<script  type="text/javascript">
$(function() {

	$(".form-horizontal")
			.bootstrapValidator(
					{

						feedbackIcons : {
							valid : 'glyphicon glyphicon-ok',
							invalid : 'glyphicon glyphicon-remove',
							validating : 'glyphicon glyphicon-refresh'

						},
						fields : {
							 
							touxiang : {

								validators : {
									file : {
										extension : 'pdf,jpg,gif,png,bmp,jpeg',
										type : 'image/pdf,image/jpg,image/gif,image/png,image/bmp,image/jpeg',
										message : '头像不合法.'
									}
								}
							},
							 username : {
								validators : {

									notEmpty : {

										message : '用户名不能为空'
									},
									stringLength : {
										min : 3,
										max : 15,
										message : '用户名必须是3-15个字母或数字组成'
									},

									// threshold :  6 , 有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
									remote : {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
										url : "findByName",//验证地址
										message : '该用户名已存在',//提示消息
										delay : 500,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
										type : 'Get',//请求方式

										//自定义提交数据，默认值提交当前input value
									  data : function(validator) {
											return {
												
												 username : $("input[name=username]").val()

											} 
										} 
 
									}

								}

							} 
						}
					});
});
</script>
</head>
<body>
	<div class="container ">
		<h1 align="center">
			管理员注册<br><font size="2">&lt;妖怪管理系统---姜子牙专用版&gt;</font>
		</h1>
		<hr width="1000px">
		<div class="col-sm-offset-3 " >
		<form class="form-horizontal" action="addAdmin" method="post" enctype="multipart/form-data">
      
      <div class="form-group">
				<label for="touxiang" class="col-sm-2 control-label">管理员头像</label>
				<div class="col-sm-4">			 
					<input type="file" class="form-control" id="touxiang1" name="touxiang1">
					 
				</div>
			</div>
		     
			<div class="form-group">
				<label for="adminname" class="col-sm-2 control-label">管理员姓名</label>
				<div class="col-sm-4">			 
					<input type="text" class="form-control" id="adminname" name="adminname">
							 
				</div>
			</div>
			
			<div class="form-group">
				<label for="username" class="col-sm-2 control-label">管理员用户名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="username"  
						  name="username"> 
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">管理员密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password" name="password">
				</div>
			</div>
			<div class="form-group">
				<label for="entryday" class="col-sm-2 control-label">管理员职时间</label>
				<div class="col-sm-4">
					<input type="date" class="form-control" id="entryday" name="entryday">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4">
					<button type="submit" class="  btn btn-primary btn-block">注册</button>
				</div>
			</div>
				<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4">
					<a href="login.jsp"   class="btn btn-primary btn-block">返回</a>
				</div>
			</div>	
		</form>
		</div>
	</div>
</body>
</html>