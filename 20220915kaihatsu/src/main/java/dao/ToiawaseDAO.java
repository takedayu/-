package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.Toiawase;

public class ToiawaseDAO {
	private Connection db = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
		
//    //ホスト名
//    String hostname = "163.149.99.38";
//    //SID
//    String sid = "oracle";
//    //ユーザー名
//    String username = "kenshu";
//    //パスワード
//    String passwd = "kenshu";	
//    
//    private void connect() throws NamingException, SQLException {	
//
//        try {
//        	
//        Class.forName("oracle.jdbc.driver.OracleDriver");
//        db = DriverManager.getConnection(
//                "jdbc:oracle:thin:@" + hostname + ":1521:" + sid,username,passwd);
//        
//    } catch (Exception e) {
//        e.printStackTrace();
//    }
//    }  
//    	private void disconnect() {
//		try {
//			if (rs != null) {
//				rs.close();
//			}
//			if (ps != null) {
//				ps.close();
//			}
//			if (db != null) {
//				db.close();
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
    	
	
	//接続共通処理
	private void connect() throws NamingException, SQLException {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/Test-DB");
		this.db = ds.getConnection();
	}

	//切断共通処理
	private void disconnect() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (db != null) {
				db.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public void insertOne(Toiawase toiawase) {
		try {
			this.connect();
			ps=db.prepareStatement("INSERT INTO TOIAWASE(NAME,MAIL_ADDRESS,TEL,INQUIRY_DETAILS) VALUES(?,?,?,?)");
			ps.setString(1,toiawase.getName());
			ps.setString(2,toiawase.getMail_address());
			ps.setString(3,toiawase.getTel());
			ps.setString(4,toiawase.getInquiry_details());
			ps.executeUpdate();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}finally {
			this.disconnect();
		}
	}
}
	