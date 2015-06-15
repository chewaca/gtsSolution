		<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="/GtsSoftware/Gts/general/index.jsp"> <img alt="GTS logo" src="img/LogoGTS2.png" /> 
				<span>GTS<br> <span style="font-size:10px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Solution</span></span></a>
				

				<!-- theme selector ends -->
				
				<%if((String)request.getSession().getAttribute("username")==null) 
					%>
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"><%=(String)request.getSession().getAttribute("username") %></span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">Mi Cuenta</a></li>
						<li class="divider"></li>						
						<li><a href="<%=request.getContextPath()%>/Gts/general/login.jsp?accion=Logout">Cerra Sesi&oacute;n</a></li>
						
					</ul>
				</div>
				<!-- user dropdown ends -->
				
			</div>
		</div>
	</div>
	<!-- topbar ends -->