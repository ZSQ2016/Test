package cn.edu.wic.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.validator.GenericValidator;

import cn.edu.wic.bean.User;
import cn.edu.wic.util.Dbcp;



public class UserAddServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		

		
		User user = new User();		
		user.setUsername(request.getParameter("zusername"));	
		user.setPassword(request.getParameter("zpassword"));
		user.setDate(request.getParameter("date"));
		user.setSex(request.getParameter("sex"));
		user.setEmail(request.getParameter("email"));
		user.setInformation(request.getParameter("information"));
		
		String result = null;
		Connection con = null;                         //连接对象
		PreparedStatement pstmt = null;        //执行对象statement
		try {
			con = Dbcp.getConnection();           // 建立连接  参数已在Dbcp类中
			pstmt = con.prepareStatement("insert into user(U_username,U_password,U_date,U_sex,U_email,U_information) values(?,?,?,?,?,?)");			
			pstmt.setString(1, user.getUsername());			
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getDate());
			pstmt.setString(4, user.getSex());
			pstmt.setString(5, user.getEmail());
			pstmt.setString(6,user.getInformation());
			pstmt.executeUpdate();                                        //执行给定的语句
			
			result = "user_add_success.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "user_add_error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		
		request.getRequestDispatcher(result).forward(request, response);
	}
}
