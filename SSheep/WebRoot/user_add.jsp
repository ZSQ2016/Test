<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<jsp:include page="/res/bootstrap.jsp" />
</head>
<body>
	<jsp:include page="/_navbar.jsp"/>
	<div class="container">
		<div class="row">
			<div class="span3">
				<jsp:include page="_menu.jsp"></jsp:include>
			</div>
			<div class="span9">
				<ul class="breadcrumb">
					 <li><a href="#">用户管理</a> <span class="divider">/</span></li>
					 <li class="active">添加用户</li>
				</ul>
				<jsp:include page="user_add_form.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>