<%@page import="MultiVendor.dbutils"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<style>
.c{
width:100%;
padding:5px;
}
</style>
</head>
<body>
<div class="c">
	<table style="width: 100%; height: 100%;">
		<thead class="table-dark table-bordered">
			<tr>
				<th>Bill Id</th>
				<th>Shop Name</th>
			</tr>
		</thead>
		<tbody>
	<%
	String a=request.getParameter("name");
	Connection con=dbutils.connect();
	final String sql="select * from bill where sname like ?";
	PreparedStatement stmt=con.prepareStatement(sql);
	stmt.setString(1,"%"+a+"%" );
	ResultSet rs=stmt.executeQuery();
	while(rs.next()){
	%>
		<tr>
			<td><%=rs.getString("bid") %></td>
			<td><%=rs.getString("sname") %></td>
		</tr>
		
	<%
	}
	con.close();
	%>
	</tbody>
	</table>
	</div>
	
</body>

</html>