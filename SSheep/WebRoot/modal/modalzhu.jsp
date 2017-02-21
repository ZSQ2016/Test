<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
$(function(){
	$('.vcode').click(function(){
		$(this).attr('src', 'vcode.jpg?_' + new Date());
	});
});
</script>
<!-- 模态框（Modal） -->
<div class="modal fade" id="modealzhu" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog  text-info">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title"  id="myModalLabel">
                            <center > 用户注册</center> 
            </h4>
         </div>
         <div class="modal-body">          
          	<form action="loginenroll" method="post" class="form-horizontal ">                  
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
                                   <label for="input44" class="col-md-3 control-label input-lg">确认密码：</label>
                              <div class="col-md-7">
                                 <input type="password" class="form-control input-lg" name="zpassword1" id="input44"  placeholder="请确认密码">
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
                                   <input type="date" class="form-control input-lg" name="date" id="input66" placeholder="格式为20000101">
                                </div>
                     </div>
                     <div class="form-group">
                      <label for="input77" class="col-md-3 control-label input-lg">性别：</label>
                     <div class="col-md-6">
                     					         <select class="form-control input-lg" id="input77"  name="sex">
                                      <option selected="selected" value="1">男</option>
                                     <option value="2">女</option> 
                              </select>
                      </div>
                   </div>      
                     <div class="form-group">
                                <label for="input88" class=" col-md-3  control-label input-lg">个人信息:</label>
                                     <div class="col-md-7">
                                    <textarea class="form-control  input-lg" id="input88" name="information" placeholder="可选填"></textarea>
                                    </div>
                      </div>       
                      <div class="form-group">
                                   <label for="input99" class="col-md-3 control-label input-lg " >验证码：</label>
                              <div class="col-md-4 controls">
                                 <input type="text" name="vcode" class="form-control input-lg" id="input99"  >                                                   
                                    </div>                      
                                            <img alt=""   src="vcode.jpg" class="vcode" > </div>    	                                                                        
                            <div class="form-group">
							<div class="col-sm-3"></div>
								<button type="submit" class="btn btn-primary btn-lg col-sm-2" >
								                                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp 注册</button>	
								                                            <div class="col-sm-2"></div>	
								<button type="button" class="btn btn-primary btn-lg col-sm-2" data-dismiss="modal">
								                                            <span class=" glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp关闭 </button>						
							</div>								                    			
               </form>                  
          </div>  
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>