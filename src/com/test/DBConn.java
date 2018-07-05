package com.test;

import java.sql.*;

public class DBConn {
	//�޼ҵ�� ���ο��� ���� ����ϴ� �����
	//��������� ����Ѵ�.
	//static Ű���� �߰�
	private static Connection conn;
	
	//Ŀ�ؼ� ��ü �غ� �޼ҵ�
	//->Singleton -��ü�� ���̻� �������� �ʵ��� �����ִ� ����
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