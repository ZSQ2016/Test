<%@page import="cn.edu.wic.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<jsp:include page="/res/bootstrap.jsp" />
<style type="text/css">
.login-panell {
	margin-top: 5%;
	margin-bottom: 20%;
	padding-top: 5%;
	padding-bottom: 10%;
	background: url("images/22245.jpg");
	background-size: 1320px 1000px;
}
</style>
</head>
<body>
	<jsp:include page="_navbar.jsp" />

	<h2>
		<center>修改信息</center>
	</h2>

	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-9">
				<form action="user_ueditsuer" method="post"
					class="form-horizontal login-panell">
				
					<div class="form-group ">
						<label for="input2" class="col-md-3 control-label input-lg">用户姓名：</label>
						<div class="col-md-6">
							<input type="text" class="form-control  input-lg " name="qwer" id="input2"
								value="<%=((User) request.getAttribute("user")).getUsername()%>" />
						</div>
					</div>
					<div class="form-group ">
						<label for="input4" class="col-md-3 control-label input-lg">出生日期：</label>
						<div class="col-md-6">
							<input type="text" class="form-control  input-lg " name="date"	id="input4"
								value="<%=((User) request.getAttribute("user")).getDate()%>" />
						</div>
					</div>
					<div class="form-group">
						<label for="input5" class="col-md-3 control-label input-lg">性别：</label>
						<div class="col-md-6">
							<select class="form-control input-lg" id="input5" name="sex">
								<option selected="selected" value="男">男</option>
								<option value="女">女</option>
							</select>
						</div>
					</div>
					<div class="form-group ">
						<label for="input6" class="col-md-3 control-label input-lg">邮箱：</label>
						<div class="col-md-6">
							<input type="text" class="form-control  input-lg " name="email"
								id="input6"
								value="<%=((User) request.getAttribute("user")).getEmail()%>" />
						</div>
					</div>
					<div class="form-group ">
						<label for="input7" class="col-md-3 control-label input-lg">个人信息：</label>
						<div class="col-md-6">
							<textarea type="text" class="form-control  input-lg "
								name="information" id="input7"><%=((User) request.getAttribute("user")).getInformation()%></textarea>
						</div>
					</div>
					<div>
						<div class="controls">
							<center>
								<input type="submit" value="保存" class="btn btn-success" />
							</center>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>