<%@page import="cn.edu.wic.bean.Pagination"%>
<%@page import="cn.edu.wic.bean.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/res/bootstrap.jsp" />
  <jsp:include page="/_navbar.jsp"/>
<h2><center >留言板</center></h2>

<table class="table table-striped table-hover">
	<col width="80px">
	<col width="100px">
	<col width="400px">

	<col>
	<thead>
		<tr>
			<th>编号</th>
			<th>用户名</th>	
			<th>留言信息</th>
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
				<td><%= i.getInformation() %></td>
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
		<li><a href="user_message?page=<%= i %>"><%= i %></a></li>
	<%
		}
	%>
	</ul>
	<span class="text pull-right">
		总共<%= p.getCount() %>条记录，<%= p.getTotal() %>页，每页<%= p.getRows() %>条，当前第<%= p.getPage() %>页
	</span>
</div>