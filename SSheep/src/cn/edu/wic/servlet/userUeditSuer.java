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

public class userUeditSuer extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}	
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		Connection con = null;
		PreparedStatement pstmt = null;		
		String result=null;
		User user = new User();		
		user.setUsername(request.getParameter("qwer"));	
		user.setDate(request.getParameter("date"));
		user.setSex(request.getParameter("sex"));
		user.setEmail(request.getParameter("email"));
		user.setInformation(request.getParameter("information"));
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("update user set U_username=?,U_date=?,U_sex=?,U_email=?,U_information=? where U_username=?");	
			     
			pstmt.setString(1, user.getDate());
			pstmt.setString(2, user.getSex());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4,user.getInformation());
			pstmt.setString(5, user.getUsername());
			pstmt.executeUpdate();
			
			 result = "user.jsp";
		} catch (Exception e) {
			result = "index.jsp";
			e.printStackTrace();
			throw new RuntimeException(e);			
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.getRequestDispatcher(result).forward(request, response);
	}
}
