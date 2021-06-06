package MultiVendor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String uname=req.getParameter("uname");
		String mno=req.getParameter("mno");
		String pwd=req.getParameter("pwd");
		String rpwd=req.getParameter("rpwd");
		Part pic=req.getPart("pic");
		String n=uname+".jpg";
		HttpSession session=req.getSession();
		if(mno.length()!=10 || !pwd.equals(rpwd)) {
			session.setAttribute("msg", "Invalid mobile number or password di'dnt match");
			resp.sendRedirect("login.jsp");
		}
		try {
			Connection con=dbutils.connect();
			String sql="insert into user values(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, uname);
			ps.setString(3, mno);
			ps.setString(4, pwd);
			ps.setString(5, "img/"+n);
			ps.executeUpdate();
			String path=getServletContext().getRealPath("/img/");
		    pic.write(path+n);
			con.close();
			session.setAttribute("msg", "Student Registered successfully...");
		}
		catch(Exception e) {
			session.setAttribute("msg", e.getMessage());
		}
		resp.sendRedirect("login.jsp");
	}
}
