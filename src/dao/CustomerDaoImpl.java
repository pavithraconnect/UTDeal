package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DbManager;
import domain.login.Login;
import model.Customer;



public class CustomerDaoImpl implements CustomerDao {

	static Connection conn;
	static PreparedStatement ps;
	DbManager db = new DbManager();
	
	@Override
	public int register(Customer c) {
		int status = 0;
		try{
			conn = db.getConnection();
			ps =conn.prepareStatement("insert into user values(?,?,?,?,?)");
			ps.setString(1, c.getFirst_name());
			ps.setString(2, c.getLast_name());
			ps.setString(3, c.getUsername());
			ps.setString(4, c.getPassword());
			ps.setString(5, c.getCell_phone());
			status = ps.executeUpdate();
			conn.close();
		}catch(Exception e){
			System.out.println(e);
		}
		return status;
	}

	@Override
	public Customer validateCustomer(Login login) {
		Customer c = new Customer();
		try{
			conn = db.getConnection();
			ps =conn.prepareStatement("select * from user where net_id=? and password=?");
			ps.setString(1, login.getUsername());
			ps.setString(2, login.getPassword());
			

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				c.setFirst_name(rs.getString(1));
				c.setLast_name(rs.getString(2));
				c.setUsername(rs.getString(3));
				c.setPassword(rs.getString(4));
				c.setCell_phone(rs.getString(5));
			}
			conn.close();
		}catch(Exception e){
			System.out.println(e);
		}
		return c;
	}

	@Override
	public Customer getUserDetails(String username) {
		// TODO Auto-generated method stub
		
		Customer c = new Customer();
		try{
			conn = db.getConnection();
			ps =conn.prepareStatement("select * from user where net_id=?");
			ps.setString(1, username);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				c.setFirst_name(rs.getString(1));
				c.setLast_name(rs.getString(2));
				c.setUsername(rs.getString(3));
				c.setPassword(rs.getString(4));
				c.setCell_phone(rs.getString(5));
			}
			conn.close();
		}catch(Exception e){
			System.out.println(e);
		}
		return c;
	}

	@Override
	public void updateProfile(Customer user) {
		// TODO Auto-generated method stub
		
		try{
			conn = db.getConnection();
			ps =conn.prepareStatement("update user set first_name=?, last_name=?, password=?, cell_phone=? where net_id=?");
			ps.setString(1, user.getFirst_name());
			ps.setString(2, user.getLast_name());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getCell_phone());
			ps.setString(5, user.getUsername());
			

			int rs = ps.executeUpdate();
			
			conn.close();
		}catch(Exception e){
			System.out.println(e);
		}
		
	}

}
