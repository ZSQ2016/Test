<%@page import="cn.edu.wic.bean.Pagination"%>
<%@page import="cn.edu.wic.bean.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
//<!--
$(function(){
	$('.button-user-delete').click(function(){
		var href =  $(this).attr('_href');
		var result = confirm('你确定要删除当前用户');
		if(result){
			window.top.location.href=href;
		}
	});
});
//-->
</script>
<jsp:include page="/res/bootstrap.jsp" />
<table class="table table-striped table-hover">
	<col width="80px">
	<col width="100px">
	<col width="120px">
	<col width="120px">
	<col width="100px">
	<col width="120px">
	<col width="350px">
	<col>
	<thead>
		<tr>
			<th>编号</th>
			<th>用户名</th>
			<th>密码</th>
			<th>出生日期</th>
			<th>性别</th>
			<th>邮箱</th>
			<th>个人信息</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<% 
			List<User> users = (List<User>)request.getAttribute("users");
			
			for(User i : users){
		%>	
			<tr>
				<td><%= i.getId() %></td>
				<td><%= i.getUsername() %></td>
				<td><%= i.getPassword() %></td>
				<td><%= i.getDate() %></td>
				<td><%= i.getSex() %></td>
				<td><%= i.getEmail() %></td>
				<td><%= i.getInformation() %></td>
				<td>
				 	<a href="user_edit?id=<%= i.getId() %>" class="btn btn-small btn-primary"><span class="icon-pencil"></span> 编辑</a>
					<a _href="user_delete?id=<%= i.getId() %>" class="btn btn-small btn-danger button-user-delete"><span class="icon-trash"></span> 删除</a>
				 </td>
			</tr>	
		<%		
			}
		%>
	</tbody>	
</table>
<div class="pagination">
	<ul>
	<% 
		Pagination p = (Pagination)request.getAttribute("pagination");
		for(int i = 1; i <= p.getTotal(); i ++){
	%>
		<li><a href="user.jsp?page=<%= i %>"><%= i %></a></li>
	<%
		}
	%>
	</ul>
	<span class="text pull-right">
		总共<%= p.getCount() %>条记录，<%= p.getTotal() %>页，每页<%= p.getRows() %>条，当前第<%= p.getPage() %>页
	</span>
</div>