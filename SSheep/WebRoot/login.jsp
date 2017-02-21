<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<jsp:include page="/res/bootstrap.jsp"/>
<style type="text/css">
body{
	background: #f5f5f5;
	font-family: '微软雅黑','黑体','times new roman';
}

.login-panel{	
		padding-top:200px;
	padding-bottom:350px;
	background: url("images/beij.jpg") ;
	background-size:1950px 1200px ;
}
.tfform{
	background: white;
	   opacity:0.85 ;
	padding-top: 40px;
	padding-bottom: 30px;
}
.login-panel form .vcode{
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function(){
	$('.login-panel form .vcode').click(function(){
		$(this).attr('src', 'vcode.jpg?_' + new Date());
	});
});
</script>
</head>
<body>
<%
session.invalidate();
 %>
    <jsp:include page="/_navbar.jsp"/>
	<div class="login-panel">
		<div class="container">
			<div class="row">
	          <div class="col-md-6"></div>         
				<div class="col-md-6 tfform">
					<form action="login" method="post" class="form-horizontal ">
				<div class="form-group">
                      <label for="input1" class="col-md-4 control-label input-lg">登录人员：</label>
                     <div class="col-md-6">
                     					         <select class="form-control input-lg" id="input1"  name="selectt">
                                      <option selected="selected" value="1">普通用户登陆</option>
                                     <option value="2">管理员登陆</option> 
                              </select>
                      </div>
                   </div>                    
                    <div class="form-group ">
                                   <label for="input2" class="col-md-4 control-label input-lg">用户名：</label>
                              <div class="col-md-6">
                                 <input type="text" class="form-control  input-lg "  name="username" id="input2" placeholder="请输入用户名">
                              </div>
                    </div>   
                      <div class="form-group">
                                   <label for="input3" class="col-md-4 control-label input-lg">密码：</label>
                              <div class="col-md-6">
                                 <input type="password" class="form-control input-lg" name="password" id="input3"  placeholder="请输入密码">
                              </div>
                     </div>       
                      <div class="form-group">
                                   <label for="input4" class="col-md-4 control-label input-lg " >验证码：</label>
                              <div class="col-md-3 controls">
                                 <input type="text" name="vcode" class="form-control input-lg" id="input4"  >                                                   
                                    </div>                      
                                            <img alt=""   src="vcode.jpg" class="vcode" >  </div>    	                                                                        
                            <div class="form-group">
							<div class="col-sm-3"></div>
								<button type="submit" class="btn btn-primary btn-lg col-sm-2"  style="text-shadow: black 5px 3px 3px;">
								                                            <span class="glyphicon glyphicon-user"  aria-hidden="true"></span>&nbsp 登陆</button>	
								                                            <div class="col-sm-2"></div>			
								<a type="button"  href="#modealzhu" data-toggle="modal"  class="btn btn-primary btn-lg " style="text-shadow: black 5px 3px 3px;"> 
								                                      <span class="glyphicon  glyphicon-th-large " aria-hidden="true"></span>&nbsp注册</a>
							</div>								                    			
               </form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade hide.bs.modal login-errors" >
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h3>错误信息</h3></div>
		<div class="modal-body">      
			<ul>
				<c:forEach items="${requestScope.errors}" var="i">
					<li>${ i }</li>
				</c:forEach>
			</ul>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	</div>	</div></div>
<script type="text/javascript">
$(function(){
	if($('.login-errors .modal-body li').length > 0){
		$('.login-errors').modal();	}
});
</script>
 <jsp:include page="modal/modalzhu.jsp"></jsp:include>
</body>
</html>