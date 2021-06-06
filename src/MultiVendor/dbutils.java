package MultiVendor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class dbutils {
	public static Connection connect() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		final String URL="jdbc:mysql://localhost/ecommerse";
		final String USER="root";
		final String PWD="tannu";
		Connection con=DriverManager.getConnection(URL,USER,PWD);
		return con;
	}
	public static int BillId() throws Exception{
		Connection con=dbutils.connect();
		String sql="select max(bid) from bill";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		if(!rs.next()){
			return 1;
		}
		return rs.getInt("max(bid)")+1;
	}
	public static String ShopName(String bid) throws Exception{
		Connection con=dbutils.connect();
		String sql="select * from bill where bid=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, bid);
		ResultSet rs=ps.executeQuery();
		rs.next();
		return rs.getString("sname");
		
	}
	public static String CatName(String catid) throws Exception{
		Connection con=dbutils.connect();
		String sql="select * from catogary where catid=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, catid);
		ResultSet rs=ps.executeQuery();
		rs.next();
		return rs.getString("cat");
		
	}
	public static String AreaName(String areaid) throws Exception{
		Connection con=dbutils.connect();
		String sql="select * from area where areaid=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, areaid);
		ResultSet rs=ps.executeQuery();
		rs.next();
		return rs.getString("areaname");
		
	}
}
