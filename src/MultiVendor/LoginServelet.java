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
@WebServlet("/login")
public class LoginServelet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname=req.getParameter("uname");
		String pwd=req.getParameter("pwd");
		HttpSession session=req.getSession();
		try {
			Connection connect=dbutils.connect();
			String sql="select * from admin where uname=? and pwd=?";
			PreparedStatement ps=connect.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				session.setAttribute("msg", "Welcome");
				session.setAttribute("name", rs.getString("name"));
				session.setAttribute("uname", rs.getString("uname"));
				session.setAttribute("pic", rs.getString("img"));
				resp.sendRedirect("aadmindash.jsp");
			}
			else {
				sql="select * from user where uname=? and pwd=?";
				ps=connect.prepareStatement(sql);
				ps.setString(1, uname);
				ps.setString(2, pwd);
				rs=ps.executeQuery();
				if(rs.next()) {
					session.setAttribute("msg", "Welcome");
					session.setAttribute("uname", rs.getString("uname"));
					session.setAttribute("name", rs.getString("name"));
					session.setAttribute("pic", rs.getString("img"));
					resp.sendRedirect("my-account.jsp");
				}
			}
		}catch(Exception e) {
			session.setAttribute("msg", e.getMessage());
		}
	}

}
