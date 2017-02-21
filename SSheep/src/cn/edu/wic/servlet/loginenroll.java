package cn.edu.wic.servlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.validator.GenericValidator;

import cn.edu.wic.bean.SessionUser;
import cn.edu.wic.bean.User;
import cn.edu.wic.util.Dbcp;
import cn.edu.wic.vcode.ValidateCode;

public class loginenroll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vcode = request.getParameter("vcode");
		String svcode = (String)request.getSession(true).getAttribute(ValidateCode.VCODE_SESSION_KEY);
		request.setCharacterEncoding("UTF-8");
		List<String> errors = new ArrayList<String>();
	
		//验证码
		if(!vcode.toLowerCase().equals(svcode.toLowerCase())){
			errors.add("验证码错误");
			request.setAttribute("errors", errors);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		

		String result = null;
		
		 String sex=null;
		if( Integer.valueOf(request.getParameter("sex"))==1)
			  sex="男"; 
		else
			sex="女";
		String username = request.getParameter("zusername");
		String password = request.getParameter("zpassword");
		String password1 = request.getParameter("zpassword1");
		String date = request.getParameter("date");			
		String email = request.getParameter("email");
		String information = request.getParameter("information");
		
	if(!password.equals(password1)){
		errors.add("两次密码不一样");
	}
	if(GenericValidator.isBlankOrNull(username)){
	 errors.add("用户名不能为空");
	}
	if(GenericValidator.isBlankOrNull(password)){
		errors.add("密码不能为空");
	}
	if(!GenericValidator.minLength(username, 3) || !GenericValidator.maxLength(username, 16)){
		errors.add("用户名长度介于[3,16]之间");
	}
	if(!GenericValidator.minLength(password, 3) || !GenericValidator.maxLength(password, 16)){
		errors.add("密码长度介于[3,16]之间");
	}
	if(errors.size() > 0){
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		return;
	}
		User user = new User();		
		user.setUsername(username);	
		user.setPassword(password);
		user.setDate(date);
		user.setSex(sex);
		user.setEmail(email);
		user.setInformation(information);
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;			
		
			con = Dbcp.getConnection();
			if(true){
			try{
				pstmt = con.prepareStatement("select U_username from user where U_username=?");
				pstmt.setString(1, username);
				rs = pstmt.executeQuery();
				if(rs.next()){
				errors.add("该用户已存在");
				request.setAttribute("errors", errors);
				request.getRequestDispatcher("/login.jsp").forward(request, response);
				return;
				}}
			 catch(Exception e){
			e.printStackTrace();
			}
			}	
			
				try{					
					pstmt = con.prepareStatement("insert into user(U_username,U_password,U_date,U_sex,U_email,U_information) values(?,?,?,?,?,?)");			
					pstmt.setString(1, user.getUsername());			
					pstmt.setString(2, user.getUsername());
					pstmt.setString(3, user.getDate());
					pstmt.setString(4, user.getSex());
					pstmt.setString(5, user.getEmail());
					pstmt.setString(6, user.getInformation());
					pstmt.executeUpdate();
					SessionUser users = new SessionUser();					
					users.setUsername(user.getUsername());
					users.setPassword(user.getUsername());
					users.setAdmin(2);
					
					pstmt = con.prepareStatement("select U_id from user where U_username=?");
					pstmt.setString(1, user.getUsername());					
					rs = pstmt.executeQuery();
					while(rs.next()){						
						users.setId(rs.getInt(1));
					    }
					result = "index.jsp";
					request.getSession().setAttribute("_user", users);
					response.sendRedirect(result);
				} catch (Exception e) {
					e.printStackTrace();
					errors.add("注册失败，请检查出生日期等格式是否正确");
					request.setAttribute("errors", errors);
					result = "login.jsp";
				} finally {
					Dbcp.closePreparedStatement(pstmt);
					Dbcp.closeConnection(con);
				}
				
				
			}
		
}

		
		
	
	

