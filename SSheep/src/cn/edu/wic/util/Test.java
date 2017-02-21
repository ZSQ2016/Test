package cn.edu.wic.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test {
	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("select * from user where id<?");
			pstmt.setInt(1, 10);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				System.out.println(rs.getInt(1));
				System.out.println(rs.getString(2));
				System.out.println("-----------------");
			}
		}catch(Exception e){
			e.printStackTrace();
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			//非常重要
			Dbcp.closeConnection(con);
		}
	}
}
