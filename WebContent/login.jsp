<jsp:include page="header.jsp"/>
<script>

</script>
        <%
		if(session.getAttribute("msg")!=null){
		%>
		<div class="alert alert-danger text-center font-weight-bold">
		 <%= session.getAttribute("msg") %>
		</div>
		<% 
		 session.removeAttribute("msg");
		 }
		%>
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Products</a></li>
                    <li class="breadcrumb-item active">Login & Register</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Login Start -->
        <div class="login">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">    
                        <div class="register-form">
                        <form method="post" enctype="multipart/form-data" action="register">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Name</label>
                                    <input class="form-control" type="text" placeholder="Name" name="name">
                                </div>
                                <div class="col-md-6">
                                    <label>User Name</label>
                                    <input class="form-control" type="text" placeholder="U-mail" name="uname">
                                </div>
                                <div class="col-md-6">
                                    <label>Mobile No</label>
                                    <input class="form-control" type="text" placeholder="Mobile No" name="mno">
                                </div>
                                <div class="col-md-6">
                                    <label>Password</label>
                                    <input class="form-control" type="text" placeholder="Password" name="pwd">
                                </div>
                                <div class="col-md-6">
                                    <label>Retype Password</label>
                                    <input class="form-control" type="text" placeholder="Password" name="rpwd" id="rpwd">
                                </div>
                                <div class="col-md-6">
                                    <label>Photo</label>
                                    <input class="form-control" type="file" name="pic">
                                </div>
                                <div class="col-md-12">
                                    <input type="submit" value="Register" class="btn">
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="login-form">
                        <form method="post" action="login">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>E-mail / Username</label>
                                    <input class="form-control" type="text" placeholder="E-mail / Username" name="uname">
                                </div>
                                <div class="col-md-6">
                                    <label>Password</label>
                                    <input class="form-control" type="text" placeholder="Password" name="pwd">
                                </div>
                                <div class="col-md-12">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="newaccount">
                                        <label class="custom-control-label" for="newaccount">Keep me signed in</label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <input type="submit" class="btn" value="Login">
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Login End -->
        
      <jsp:include page="footer.jsp"/>