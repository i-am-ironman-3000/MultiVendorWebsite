package MultiVendor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/PayBill")
public class PayBillServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bid=req.getParameter("bid");
		String sname=req.getParameter("sname");
		String catid=req.getParameter("catid");
		String amt="1000";
		HttpSession session=req.getSession();
		try {
			Connection con=dbutils.connect();
			String sql="insert into bill values(?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, bid);
			ps.setString(2, sname);
			ps.setString(3, catid);
			ps.setString(4, amt);
			ps.executeUpdate();
			session.setAttribute("msg", "Bill Paid");
		}
		catch(Exception e) {
			session.setAttribute("msg", e.getMessage());
		}
		resp.sendRedirect("aadmindash.jsp");
	}
	
}
