<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/res/bootstrap.jsp" />
<style type="text/css">

</style>
<h2 class="modal-title"  id="myModalLabel">
                            <center > 用户添加</center> 
            </h2>
<form action="user_add" method="post" class="form-horizontal ">                  
                    <div class="form-group ">
                                   <label for="input22" class="col-md-3 control-label input-lg">用户名：</label>
                              <div class="col-md-7">
                                 <input type="text" class="form-control  input-lg "  name="zusername" id="input22" placeholder="请输入长度为3~16位的用户名">
                              </div>
                    </div>                     
                      <div class="form-group">
                                   <label for="input33" class="col-md-3 control-label input-lg">密码：</label>
                              <div class="col-md-7">
                                 <input type="password" class="form-control input-lg" name="zpassword" id="input33"  placeholder="请输入长度为3~16位的密码">
                              </div>
                     </div>                    
                     <div class="form-group">
                                   <label for="input55"class="col-md-3 control-label input-lg"> 邮箱：</label>
                               <div class="col-md-7">
                                   <input type="email" class="form-control input-lg" name="email" id="input55" placeholder="可选填">
                                </div>
                     </div>
                     <div class="form-group">
                                   <label for="input66"class="col-md-3 control-label input-lg"> 出生日期：</label>
                               <div class="col-md-7">
                                   <input type="date" class="form-control input-lg" name="date" id="input66" placeholder="格式如:20000101">
                                </div>
                     </div>
                     <div class="form-group">
                      <label for="input77" class="col-md-3 control-label input-lg">性别：</label>
                     <div class="col-md-6" >
                     		  <select class="form-control input-lg" id="input77"  name="sex">
                                      <option selected="selected" >男</option>
                                     <option >女</option> 
                              </select>
                      </div>
                   </div>      
                     <div class="form-group">
                                <label for="input88" class=" col-md-3  control-label input-lg">个人信息:</label>
                                     <div class="col-md-7">
                                    <textarea class="form-control  input-lg" id="input88" name="information" placeholder="可选填" cols="5"></textarea>
                                    </div>
                      </div>                                                                       
                            <div class="form-group">
							<div class="col-sm-3"></div>
								<button type="submit" class="btn btn-primary btn-lg col-sm-2" >
								                                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp 添加</button>	
								                                         									
							</div>								                    			
               </form>
               	
        