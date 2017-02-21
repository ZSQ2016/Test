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
import cn.edu.wic.util.Dbcp;
import cn.edu.wic.vcode.ValidateCode;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vcode = request.getParameter("vcode");
		String svcode = (String)request.getSession(true).getAttribute(ValidateCode.VCODE_SESSION_KEY);
		
		List<String> errors = new ArrayList<String>();
		
		//验证码
		if(!vcode.toLowerCase().equals(svcode.toLowerCase())){
			errors.add("验证码错误");
			request.setAttribute("errors", errors);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		
		//用户名和密码
		String leix=request.getParameter("selectt");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		

		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String s1 = null;		
		Integer admin=null;
		if(leix.equals("1"))
		{
			s1="select U_id,U_username,U_password from user where U_username=? and U_password=?";
			admin=2;
		}
		else {
			s1="select A_id,A_name,A_password from admin where A_name=? and A_password=?";		
			admin=1;
		}
		
		try{
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement(s1);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()){
				SessionUser user = new SessionUser();
				user.setId(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setAdmin(admin);
				//写session
				request.getSession().setAttribute("_user", user);
				response.sendRedirect( "index.jsp");
			}else{
				errors.add("用户名或者密码错误");
				request.setAttribute("errors", errors);
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
	
	}
}
