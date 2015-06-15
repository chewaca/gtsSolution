<!DOCTYPE html>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<html lang="en">
<head>
	<!--
		Charisma v1.0.0

		Copyright 2012 Muhammad Usman
		Licensed under the Apache License v2.0
		http://www.apache.org/licenses/LICENSE-2.0

		http://usman.it
		http://twitter.com/halalit_usman
	-->
	<meta charset="utf-8">
	<title>Visualizar Proceso</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
	<meta name="author" content="Muhammad Usman">
	
	<!--The beans  -->
	
	<jsp:useBean id="subproceso" scope="request" class="GtsSoftware.subproceso.SubprocesoBeanData"></jsp:useBean>

	<!-- The styles -->
	<link id="bs-css" href="css/bootstrap-united.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href="css/bootstrap-responsive.css" rel="stylesheet">
	<link href="css/charisma-app.css" rel="stylesheet">
	<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='css/fullcalendar.css' rel='stylesheet'>
	<link href='css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='css/chosen.css' rel='stylesheet'>
	<link href='css/uniform.default.css' rel='stylesheet'>
	<link href='css/colorbox.css' rel='stylesheet'>
	<link href='css/jquery.cleditor.css' rel='stylesheet'>
	<link href='css/jquery.noty.css' rel='stylesheet'>
	<link href='css/noty_theme_default.css' rel='stylesheet'>
	<link href='css/elfinder.min.css' rel='stylesheet'>
	<link href='css/elfinder.theme.css' rel='stylesheet'>
	<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='css/opa-icons.css' rel='stylesheet'>
	<link href='css/uploadify.css' rel='stylesheet'>

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The GTS icon -->
	<link rel="shortcut icon" href="img/LogoGTS2.png">
	<script>
	
	function alt_fecha(obj){
	obj.value=obj.value.slice(0,5);
	
	}

	</script>	
	<%! public boolean  encontrar(String a, String[] b){
		for(int i=0;i<b.length;i++){			
			if(b[i].equals(a)) return true;	
		}
	return false;
	}
	public String formatear(java.util.Date date){
		SimpleDateFormat DF= new SimpleDateFormat("dd/MM/yyyy");
		return DF.format(date);
	}
	%>
</head>

<body>
<%-- 		<jsp:include page="/Gts/general/superior.jsp" />  --%>
		<div class="container-fluid">
		<div class="row-fluid">
				
			<!-- left menu starts -->
			<jsp:include page="/Gts/general/leftmenu3.jsp" />
						<!-- left menu ends -->
			
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">
			<!-- content starts -->
			

<!-- 			<div>
				<ul class="breadcrumb">
					<li>
						<a href="/Conan3000V2/IngSoft/general/index.jsp">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="buscarproceso.jsp">Gestión de Proceso</a> <span class="divider">/</span>
					</li>
					<li>
						Visualizar de Proceso
					</li>
				</ul>
			</div> -->
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
					  <h2>VISUALIZAR SUBPROCESO</h2>
				  </div>
					<div class="box-content">
						<form class="form-horizontal" action="SMVSubproceso" name="frmData" method="POST">
						<input type="hidden" name="accion" value="Consultar"></input>
						<input type="hidden" name="tipo" value="2"></input>
						
						  <fieldset>
						    <div class="control-group">
						      <label class="control-label" for="typeahead7">Nombre: </label>
						      
						      <div class="controls">
						       <input type="text" class="span6 typeahead" id="txtNombre"  data-provide="typeahead"  name="txtNombre" disabled value="<%=subproceso.getNombre()%>">
					          </div>
					        </div>
					        
					        <div class="control-group">
						      <label class="control-label" for="typeahead7">Orden: </label>
						      
						      <div class="controls">
						       <input type="text" class="span6 typeahead" id="txtOrden"  data-provide="typeahead"  name="txtOrden" disabled value="<%=subproceso.getOrden()%>">
					          </div>
					        </div>
					        

							<div class="control-group">
							  <label class="control-label" for="typeahead8">Fecha Registro:</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="fFechaRegistro" name="fFechaRegistro" value="<%=formatear(new Date(subproceso.getFechaActual().getTime())) %>" disabled>
							  </div>
							</div>
							
							
							<div class="control-group">  
                                  <label class="control-label" for="typeahead4">Descripción: </label>
                                  <div class="controls">                   
                                      <textarea id="txtDescripcion" name="txtDescripcion" rows="3" cols="1000" style="resize:none; height: 74px; width: 273px" disabled><%=subproceso.getDescripcion()%></textarea>
                                  </div>
                              </div>

							<div class="control-group" >
								<label class="control-label" for="typeahead13">Estado :</label>
								<div class="controls">
								  <label class="radio">
									<input type="radio" name="rButton" id="optionsRadios1" value="Activo" <% if(subproceso.getEstado()==1){ %> checked <%}%> disabled>
									Activo
								  </label>
								  <div style="clear:both">
								  <label class="radio">
									<input type="radio" name="rButton" id="optionsRadios2" value="Inactivo" <% if(subproceso.getEstado()==2){ %> checked <%}%> disabled>
									Inactivo
								  </label>
								  </div>
								</div>
							  </div>											
							
						    <div class="form-actions" >
							 <!--  <button type="submit" class="btn btn-primary">Agregar</button> -->
							  <button type="button" class="btn" onclick="location.href='buscarsubproceso.jsp'" >
							  <i class="icon-circle-arrow-left icon-black"></i>
							  Regresar</button>
							</div>
						  </fieldset>
					  </form>   
					
				  </div>
				</div><!--/span-->

			</div><!--/row-->


			<div class="row-fluid sortable"><!--/span-->
			
			</div><!--/row-->
			
			<div class="row-fluid sortable"><!--/span-->

			</div><!--/row-->		 
					
			</div>
				</div><!--/fluid-row-->
				
		<hr>

		<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">Ã—</button>
				<h3>Settings</h3>
			</div>
			<div class="modal-body">
				<p>Here settings can be configured...</p>
			</div>
			<div class="modal-footer" >
				<a href="#" class="btn" data-dismiss="modal">Close</a>
				<a href="#" class="btn btn-primary">Save changes</a>
			</div>
		</div>
		<br/>
		<jsp:include page="/Gts/general/inferior.jsp" />
		
	</div><!--/.fluid-container-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.min.js"></script>
	<script src="js/jquery.flot.pie.min.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="js/charisma.js"></script>
	
		
</body>
</html>
