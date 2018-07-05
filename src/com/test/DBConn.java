package com.test;

import java.sql.*;

public class DBConn {
	//메소드들 내부에서 공통 사용하는 멤버는
	//멤버변수로 등록한다.
	//static 키워드 추가
	private static Connection conn;
	
	//커넥션 객체 준비 메소드
	//->Singleton -객체가 더이상 생성되지 않도록 막아주는 역할
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		if(conn == null){
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:project_3/1234@211.63.89.82:1521:xe");
			
		}
		return conn;
	}
	
	public static void close(){
		try {
			if (conn != null) {
				conn.close();
			}
		}catch(Exception e){
		}
		conn = null;
	}
}