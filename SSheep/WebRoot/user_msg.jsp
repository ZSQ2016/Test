<%@page import="cn.edu.wic.bean.Pagination"%>
<%@page import="cn.edu.wic.bean.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/res/bootstrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
<style type="text/css">
.login-panell{	
	margin-top:5%;
	margin-bottom:20%;
	padding-top:5%;
	padding-bottom:10%;
	background: url("images/11145.jpg") ;
	background-size:1320px 1000px ;
}
</style>
</head>
<title></title>

<body>
  <jsp:include page="/_navbar.jsp"/>
		<% 
			List<User> users = (List<User>)request.getAttribute("users");
			
			for(User i : users){
		%>
<table class="table table-striped table-hover ">           
		</table>
		<h2><center >个人信息</center></h2>
		<div class="container">
			<div class="row">
	          <div class="col-md-2"></div>         
				<div class="col-md-9">
			<form action="#" method="post" class="form-horizontal login-panell" style="margin-top: 5%;">					
							<div class="form-group ">
                                   <label  class="col-md-3 control-label input-lg">用户名：</label>
                              <div class="col-md-6">
                                 <input type="text" class="form-control  input-lg "  name="username" disabled  value="<%=i.getUsername() %>"/>
                              </div>
                    </div>
					<div class="form-group ">
                                   <label  class="col-md-3 control-label input-lg">出生日期：</label>
                              <div class="col-md-6">
                                 <input type="text" class="form-control  input-lg "  name="date" disabled value="<%= i.getDate() %>"/>
                              </div>
                    </div>
					<div class="form-group">
                      <label  class="col-md-3 control-label input-lg">性别：</label>
                     <div class="col-md-6">
                     			<input type="text" class="form-control  input-lg "  name="sex" disabled  value="<%= i.getSex() %>"/>
                      </div>
                   </div>    			
					<div class="form-group ">
                                   <label  class="col-md-3 control-label input-lg">邮箱：</label>
                              <div class="col-md-6">
                                 <input type="text" class="form-control  input-lg "  name="email" disabled  value="<%= i.getEmail() %>"/>
                              </div>
                    </div>
					<div class="form-group ">
                                   <label  class="col-md-3 control-label input-lg">个人信息：</label>
                              <div class="col-md-6">
                                 <textarea type="text" class="form-control  input-lg "  name="information" disabled  ><%= i.getInformation() %></textarea>
                              </div>
                    </div>
                    </form>
				</div>
				</div>
				</div>
						
		<%		
			}
		%>
	
</body>
</html>