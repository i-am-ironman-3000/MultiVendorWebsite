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
@WebServlet("/AddShop")
public class AddShopServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bid=req.getParameter("bid");
		String suname=req.getParameter("suname");
		String areaid=req.getParameter("areaid");
		String doj=req.getParameter("doj");
		String pwd=req.getParameter("pwd");
		HttpSession session=req.getSession();
		try {
			Connection con=dbutils.connect();
			String sql="insert into shop(bid,suname,areaid,doj,pwd) values(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, bid);
			ps.setString(2, suname);
			ps.setString(3, areaid);
			ps.setString(4, doj);
			ps.setString(5, pwd);
			ps.executeUpdate();
			session.setAttribute("msg", "Shop Created!!");
			resp.sendRedirect("aadmindash.jsp");
		}
		catch(Exception e) {
			session.setAttribute("msg", e.getMessage());
			resp.sendRedirect("aadmindash.jsp");
		}
	}
}
