package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.Loginmodel;

public class LoginDAO {
		private Connection db = null;
		private PreparedStatement ps = null;
		private ResultSet rs = null;
			
//	    //ホスト名
//	    String hostname = "163.149.99.38";
//	    //SID
//	    String sid = "oracle";
//	    //ユーザー名
//	    String username = "kenshu";
//	    //パスワード
//	    String passwd = "kenshu";	
	//    
//	    private void connect() throws NamingException, SQLException {	
	//
//	        try {
//	        	
//	        Class.forName("oracle.jdbc.driver.OracleDriver");
//	        db = DriverManager.getConnection(
//	                "jdbc:oracle:thin:@" + hostname + ":1521:" + sid,username,passwd);
//	        
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    }
//	    }  
//	    	private void disconnect() {
//			try {
//				if (rs != null) {
//					rs.close();
//				}
//				if (ps != null) {
//					ps.close();
//				}
//				if (db != null) {
//					db.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
	    	
		
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
		
		
		
		public List<Loginmodel> searchAll(String userid,String userpassword) {
			List<Loginmodel> list = new ArrayList<>();
			try {
				this.connect();
					ps = db.prepareStatement("SELECT * FROM USERS WHERE USER_ID = ? AND USER_PASSWORD = ? ");				
					ps.setString(1,userid);
					ps.setString(2,userpassword);
				
				rs = ps.executeQuery();
				while (rs.next()) {
					String catchuserid = rs.getString("USER_ID");
					String catchuerpassword = rs.getString("USER_PASSWORD");
					
					Loginmodel l = new Loginmodel(catchuserid,catchuerpassword);
					l.setUserid(catchuserid);
					l.setUserpassword(catchuerpassword);
					list.add(l);

				}
			} catch (NamingException | SQLException e) {
				
				e.printStackTrace();
			}finally {
				this.disconnect();
			}

			return list;
		}

	
}
