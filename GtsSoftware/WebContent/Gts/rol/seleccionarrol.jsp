<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/Gts/general/header.jsp" />

	<link rel="shortcut icon" href="img/LogoGTS2.png">
</head>
<body>
		<div class="container-fluid">
			<div class="row-fluid">
				<jsp:include page="/Gts/general/noscript.jsp" />
				
				<div id="content" class="span10">
				    <!-- content starts -->
				    <jsp:include page="includes/seleccionarrol.jsp" />
				    <!-- content ends -->
				</div>
			 </div>
		<hr>
<%-- 			<jsp:include page="/Gts/general/footer.jsp" /> --%>
		</div>
		<jsp:include page="/Gts/general/jsexternal.jsp" />
</body>
</html>

