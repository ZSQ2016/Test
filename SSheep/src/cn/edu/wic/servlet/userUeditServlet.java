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

public class userUeditServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.valueOf(request.getParameter("id"));
		
		Connection con = null;
		PreparedStatement pstmt = null;
		User user = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("select U_username,U_password,U_date,U_sex,U_email,U_information from user where U_id=?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				user = new User();		
				user.setId(id);
				user.setUsername(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setDate(rs.getString(3));
				user.setSex(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setInformation(rs.getString(6));				
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		
		request.setAttribute("user", user);
		request.getRequestDispatcher("user_uedit.jsp").forward(request, response);
	}
}
