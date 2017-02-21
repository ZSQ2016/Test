<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<jsp:include page="/res/bootstrap.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="_navbar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="span3">
				<jsp:include page="_menu.jsp"></jsp:include>
			</div>
			<div class="span9">
				<ul class="breadcrumb">
					 <li><a href="#">用户管理</a> <span class="divider">/</span></li>
					 <li class="active">用户列表</li>
				</ul>
				<c:import url="user_table"></c:import>
			</div>
		</div>
	</div>
	
</body>
</html>