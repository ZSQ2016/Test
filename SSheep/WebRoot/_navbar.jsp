
    <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style type="text/css">
.panell{		
	background: url("images/11145.jpg") ;
	background-size:1920px 1000px ;
}
</style>
    <div class="row panell"> 
   <div class="col-md-10">
           <div class="container">	
			<h2><a href="index.jsp">多多羊星座</a></h2>
			</div>
   </div>
   <div class="col-md-2 panell">
          <h4><c:if test="${sessionScope['_user'] == null}">
					<li><a href="login.jsp"><i class="icon-user"></i> 用户登录</a></li>
				</c:if>
				<c:if test="${sessionScope['_user'] != null}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i>${sessionScope['_user'].username}
						<span class="caret"></span> </a>
						<ul class="dropdown-menu" >
						    <c:if test="${sessionScope['_user'].admin==1}">
						    <li><a href="user.jsp">用户管理</a></li></c:if>
						    <c:if test="${sessionScope['_user'].admin==2}">
							<li><a href="user_msg?id=${sessionScope['_user'].id}">个人信息</a></li>
							<li><a href="user_uedit?id=${sessionScope['_user'].id}">修改信息</a></li>	
							<li><a href="user_message?id=${sessionScope['_user'].username}">留言板</a></li>			
							<li>
							    <a href="<%=request.getContextPath()%>/user_editpsw.jsp?id=${sessionScope['_user'].id}&identity=user">修改密码</a>
							</li>
							<li class="divider"></li></c:if>
							<li><a href="<%=basePath%>login.jsp">退出登录</a></li>
						</ul>
					</li>
				</c:if>         
          </h4>  
    </div>
</div>
    
   