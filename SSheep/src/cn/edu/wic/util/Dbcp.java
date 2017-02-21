package cn.edu.wic.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.dbcp.BasicDataSource;  //  Web App Libraries/commons-dbcp-1.3.jar下

public class Dbcp {                                         //写 对数据库操作的方法
	private static final String DRIVER_CLASS = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/ddsheep?useUnicode=true&characterEncoding=UTF-8";
	private static final String USER = "root";
	private static final String PASSWORD = null;
	private static BasicDataSource dataSource;
	
	static{
		dataSource = new BasicDataSource();
		dataSource.setDriverClassName(DRIVER_CLASS);             //加载注册JDBC驱动程序
		dataSource.setUrl(URL);                                                       
		dataSource.setUsername(USER);
		dataSource.setPassword(PASSWORD);
		dataSource.setInitialSize(2);
		dataSource.setMaxActive(12);
	}
	
	public static synchronized Connection getConnection(){                    //加锁  建立连接方法
		System.out.println("-----------------------------------");
		try {
//			System.out.println("活动的连接："+dataSource.getNumActive());
//			System.out.println("空闲的连接："+dataSource.getNumIdle());
			
			return dataSource.getConnection();
		} catch (SQLException e) {
			System.out.println("-----------------> 数据库连接失败 <-----------------");
			e.printStackTrace();
			return null;
		}
	}

	// 禁止实例化
	private Dbcp() {
	}

	// 关闭ResultSet方法
	public static void closeResultSet(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 关闭Statement方法
	public static void closeStatement(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 关闭CallableStatement方法
	public static void closeCallableStatement(CallableStatement cstmt) {
		try {
			if (cstmt != null)
				cstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 关闭PreparedStatement方法
	public static void closePreparedStatement(PreparedStatement pstmt) {
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 关闭本次连接方法
	public static void closeConnection(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
