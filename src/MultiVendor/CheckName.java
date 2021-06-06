package MultiVendor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/CheckName")
public class CheckName extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String table=req.getParameter("table");
		HttpSession session=req.getSession();
		try {
			Connection con=dbutils.connect();
			String sql;
			PreparedStatement ps;
			if(table.equals("shop")) {
				sql="select * from bill where sname=?";
				ps=con.prepareStatement(sql);
				ps.setString(1, name);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					resp.getWriter().println("YES");
				}
			}
			else if(table.equals("catogary")) {
				sql="select * from catogary where cat=?";
				ps=con.prepareStatement(sql);
				ps.setString(1, name);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					resp.getWriter().println("YES");
				}
			}
		}catch(Exception e){
			session.setAttribute("msg", e.getMessage());
			resp.sendRedirect("aadmindash.jsp");
		}
	}
}
