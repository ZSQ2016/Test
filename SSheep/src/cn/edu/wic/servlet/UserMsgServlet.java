package cn.edu.wic.servlet;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.wic.bean.Pagination;
import cn.edu.wic.bean.User;
import cn.edu.wic.util.Dbcp;

import com.sun.net.httpserver.HttpContext;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

public class UserMsgServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<User> users = new ArrayList<User>();
	
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Integer id=Integer.valueOf(request.getParameter("id"));
		try {
			con = Dbcp.getConnection();
						
			
			pstmt = con.prepareStatement("select U_username,U_password,U_email,U_date,U_sex,U_information from user where U_id=?");
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				User user = new User();				
				user.setUsername(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setDate(rs.getString(4));
				user.setSex(rs.getString(5));				
				user.setInformation(rs.getString(6));
				users.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		
		request.setAttribute("users", users);
		request.getRequestDispatcher("user_msg.jsp").forward(request, response);
	}
}
