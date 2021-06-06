<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="MultiVendor.dbutils"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="adminheader.jsp"></jsp:include>
<script>
	$(function(){
		$("#sname").blur(function(){
			var sname=$(this).val();
			$.post("CheckName",{"name":sname,"table":"shop"},function(output){
				if(output.trim()=="YES"){
					alert("Shop Name already Exist");
					$(this).val("");
				}
			});
		});
		$("#search").keyup(function(){
			var s=$(this).val();
			$.get("ViewBill.jsp",{"name":s},function(output){
				$(".result").html(output);
			});
		});
	});
</script>
	<!-- Breadcrumb Start -->
	<%
			if(session.getAttribute("msg")!=null){
			%>
			<div class="clearfix"></div>
			<div class="alert alert-danger text-center font-weight-bold mt-3">
							<%=session.getAttribute("msg") %>
			</div>
			<%}
			session.removeAttribute("msg");
			%>
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Products</a></li>
                    <li class="breadcrumb-item active">My Account</li>
                  
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- My Account Start -->
        <div class="my-account">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                        	<img src="<%= session.getAttribute("pic")%>" style="width:280px;height:200px;">
                            <a class="nav-link active" id="dashboard-nav" data-toggle="pill" href="#dashboard-tab" role="tab"><i class="fa fa-tachometer-alt"></i>Dashboard</a>
                            <a class="nav-link" id="orders-nav" data-toggle="pill" href="#area-tab" role="tab"><i class="fa fa-compass"></i>Area</a>
                            <a class="nav-link" id="orders-nav" data-toggle="pill" href="#cat-tab" role="tab"><i class="fa fa-list-ul"></i>Category</a>
                            <a class="nav-link" id="payment-nav" data-toggle="pill" href="#payment-tab" role="tab"><i class="fa fa-credit-card"></i>Bill Payment</a>
                            <a class="nav-link" id="address-nav" data-toggle="pill" href="#addshop-tab" role="tab"><i class="fa fa-map-marker-alt"></i>AddShop</a>
                            <a class="nav-link" id="account-nav" data-toggle="pill" href="#account-tab" role="tab"><i class="fa fa-user"></i>Account Details</a>
                            <a class="nav-link" href="index.jsp"><i class="fa fa-sign-out-alt"></i>Logout</a>
                        </div>
                    </div>
                    <div class="col-md-9">
                    	<h4>Welcome! <%=session.getAttribute("name") %></h4>
                        <div class="tab-content">
                        
                         <div class="tab-pane fade" id="area-tab" role="tabpanel" aria-labelledby="orders-nav">
                            <div class="row">
                            <div class="col-md-6">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>Area Id</th>
                                                <th>Name</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<%
                                        	Connection con=dbutils.connect();
                                        	String sql="select * from area";
                                        	PreparedStatement ps=con.prepareStatement(sql);
                                        	ResultSet rs=ps.executeQuery();
                                        	while(rs.next()){
                                        		%>
                                        		<tr>
                                        			<td><%=rs.getString("areaid") %></td>
                                        			<td><%= rs.getString("areaname") %></td>
                                        			<td><a href="deletecity.jsp?areaid=<%= rs.getString("areaid")%> "class="btn btn-danger">Delete</a></td>
                                        		</tr>
                                        		<%
                                        	}
                                        	%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-6">
                            	<form action="AddCity" method="post">
                            		<div class="form-group">
	                            		<label>City Name</label>
	                                    <input class="form-control" type="text" placeholder="City Name" name="areaname">
                                    </div>
                                    <input type="submit" value="Add" class="btn">
                            	</form>
                            </div>
                            </div>
                            </div>
                        
                            
                            <div class="tab-pane fade" id="cat-tab" role="tabpanel" aria-labelledby="orders-nav">
                            <div class="row">
                            <div class="col-md-6">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>Catogary Id</th>
                                                <th>Name</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<%
                                        	con=dbutils.connect();
                                        	sql="select * from catogary";
                                        	ps=con.prepareStatement(sql);
                                        	rs=ps.executeQuery();
                                        	while(rs.next()){
                                        		%>
                                        		<tr>
                                        			<td><%=rs.getString("catid") %></td>
                                        			<td><%= rs.getString("cat") %></td>
                                        			<td><a href="deletecat.jsp?catid=<%= rs.getString("catid")%> "class="btn btn-danger">Delete</a></td>
                                        		</tr>
                                        		<%
                                        	}
                                        	%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-6">
                            	<form action="AddCat" method="post">
                            		<div class="form-group">
	                            		<label>Catogary Name</label>
	                                    <input class="form-control" type="text" placeholder="Catogary Name" name="cat">
                                    </div>
                                    <input type="submit" value="Add" class="btn">
                            	</form>
                            </div>
                            </div>
                            </div>
                         
                            <div class="tab-pane fade" id="payment-tab" role="tabpanel" aria-labelledby="payment-nav">
                                <form action="PayBill" method="post">
                            		<div class="form-group">
	                            		<label>Bill Id</label>
	                                    <input class="form-control" readonly type="text" placeholder="Bill Id" name="bid" value="<%= dbutils.BillId()%>">
                                    </div>
                                    <div class="form-group">
	                            		<label>Shop Name</label>
	                                    <input class="form-control" type="text" placeholder="Shop Name" name="sname" id="sname">
                                    </div>
                                    <div class="form-group">
	                            		<label>Shop Catogary</label>
	                            		<select class="form-control" name="catid">
										<option>-- Select Catogery --</option>
										<%
											Connection con1=dbutils.connect();
											final String sql1="select * from catogary";
											ResultSet rs1=con1.createStatement().executeQuery(sql);
											while(rs1.next()){
											%>
												<option value="<%=rs1.getString("catid") %>"><%= rs1.getString("cat") %></option>
											<%
											}
											con.close();
										%>
										</select>
	                                </div>
	                                <div class="form-group">
	                            		<label>Amount</label>
	                                    <input class="form-control" type="text" placeholder="Amount" name="amt" readonly value="&#8377 1000">
                                    </div>
                                    <input type="submit" value="Pay" class="btn">
                            	</form>
                            </div>
                            <div class="tab-pane fade" id="addshop-tab" role="tabpanel" aria-labelledby="address-nav">
                                <h4>Add Shop</h4>
                                <div class="row">
                                    <div class="col-md-6">
                                    <form action="AddShop" method="post">
	                            		<div class="form-group">
		                            		<label>Bill Id</label>
		                                    <input class="form-control" type="text" placeholder="Bill Id" name="bid">
	                                    </div>
	                                    <div class="form-group">
		                            		<label>Shop User Name</label>
		                                    <input class="form-control" type="text" placeholder="Shop User Name" name="suname" id="sname">
	                                    </div>
	                                    <div class="form-group">
		                            		<label>Shop Area</label>
		                            		<select class="form-control" name="areaid">
											<option>-- Select Area --</option>
											<%
												con=dbutils.connect();
												sql="select * from area";
												rs=con.createStatement().executeQuery(sql);
												while(rs.next()){
												%>
													<option value="<%=rs.getString("areaid") %>"><%= rs.getString("areaname") %></option>
												<%
												}
												con.close();
											%>
											</select>
		                                </div>
		                                <div class="form-group">
		                            		<label>Date</label>
		                                    <input class="form-control" type="date" placeholder="Amount" name="doj">
	                                    </div>
	                                    <div class="form-group">
		                            		<label>Password</label>
		                                    <input class="form-control" type="password" placeholder="password" name="pwd">
	                                    </div>
	                                    <input type="submit" value="Add Shop" class="btn">
                            		</form>
                                    </div>
                                    <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="search" id="search">
                                     </div>
                                        <div class="result"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="account-tab" role="tabpanel" aria-labelledby="account-nav">
                                <h4>Shop Details</h4>
                                <table class="table table-bordered table-stripped">
                                	<thead>
                                		<tr>
                                			<th>Shop Name</th>
                                			<th>Shop Uname</th>
                                			
                                			<th>Shop Area</th>
                                			<th>Action</th>
                                		</tr>
                                	</thead>
                                	<tbody>
                                		<%
                                		con=dbutils.connect();
                                		sql="select * from shop";
                                		ps=con.prepareStatement(sql);
                                		rs=ps.executeQuery();
                                		while(rs.next()){
                                			%>
                                			<tr>
                                				<td><%=dbutils.ShopName(rs.getString("bid")) %></td>
                                				<td><%=rs.getString("suname") %></td>
                                				<td><%=dbutils.AreaName(rs.getString("areaid")) %></td>
                                				<td><a href="#" class="btn">Delete</a></td>
                                			</tr>
                                			<% 
                                		}
                                		%>
                                	</tbody>
                                </table>
                                <h4>Password change</h4>
                                <div class="row">
                                    <div class="col-md-12">
                                        <input class="form-control" type="password" placeholder="Current Password">
                                    </div>
                                    <div class="col-md-6">
                                        <input class="form-control" type="text" placeholder="New Password">
                                    </div>
                                    <div class="col-md-6">
                                        <input class="form-control" type="text" placeholder="Confirm Password">
                                    </div>
                                    <div class="col-md-12">
                                        <button class="btn">Save Changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- My Account End -->
        
<jsp:include page="footer.jsp"></jsp:include>
