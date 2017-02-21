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

public class UserUpdateServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}	
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer id = Integer.valueOf(request.getParameter("id"));
		
		Connection con = null;
		PreparedStatement pstmt = null;		
		String result=null;
		User user = new User();		
		user.setId(Integer.valueOf(request.getParameter("id")));
		user.setUsername(request.getParameter("username"));	
		user.setPassword(request.getParameter("password"));
		user.setDate(request.getParameter("date"));
		user.setSex(request.getParameter("sex"));
		user.setEmail(request.getParameter("email"));
		user.setInformation(request.getParameter("information"));
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("update user set U_username=?,U_password=?,U_date=?,U_sex=?,U_email=?,U_information=? where U_id=?");	

			pstmt.setString(1, user.getUsername());			
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getDate());
			pstmt.setString(4, user.getSex());
			pstmt.setString(5, user.getEmail());
			pstmt.setString(6,user.getInformation());
			pstmt.setInt(7, user.getId());
			pstmt.executeUpdate();
			
			 result = "user.jsp";
		} catch (Exception e) {
			result = "user.jsp";
			e.printStackTrace();
			throw new RuntimeException(e);			
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.getRequestDispatcher(result).forward(request, response);
	}
}
