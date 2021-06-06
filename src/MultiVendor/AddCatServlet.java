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
@WebServlet("/AddCat")
public class AddCatServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cat=req.getParameter("cat");
		HttpSession session=req.getSession();
		try {
			Connection con=dbutils.connect();
			String sql="insert into catogary(cat) values(?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, cat);
			ps.executeUpdate();
			session.setAttribute("msg", "Catogary Added succesfully");
			con.close();
			resp.sendRedirect("aadmindash.jsp");
		}
		catch(Exception e) {
			session.setAttribute("msg", e.getMessage());
			resp.sendRedirect("aadmindash.jsp");
		}
	}
}
