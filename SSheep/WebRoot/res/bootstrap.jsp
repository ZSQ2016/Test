<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String basePath = request.getScheme()
					+ "://"
					+ request.getServerName()
					+ ":"
					+ request.getServerPort()
					+ request.getContextPath()
					+ "/";
%>
<link rel="stylesheet" type="text/css" href="<%= basePath %>res/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= basePath %>res/theme.css">
<script type="text/javascript" src="<%= basePath %>res/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%= basePath %>res/bootstrap/js/bootstrap.min.js"></script>
