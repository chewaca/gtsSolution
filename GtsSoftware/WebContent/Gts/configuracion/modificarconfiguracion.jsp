<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="/Gts/general/header.jsp" />
	<link rel="shortcut icon" href="img/LogoGTS2.png">
<body>
	<jsp:include page="/Gts/general/superior.jsp" />  
		<div class="container-fluid">
			<div class="row-fluid">
				<jsp:include page="/Gts/general/leftmenu3.jsp" />
				<jsp:include page="/Gts/general/noscript.jsp" />
				<div id="content" class="span10">
				    <!-- content starts -->
				   <jsp:include page="includes/modificarconfiguracion.jsp" />
				    <!-- content ends -->
				</div>
			 </div>

		</div>
		<jsp:include page="/Gts/general/jsexternal.jsp" />
</body>
</html>