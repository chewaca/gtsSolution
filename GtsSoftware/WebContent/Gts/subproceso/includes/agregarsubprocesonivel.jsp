
<script>

function alt_submit(){
		var form= document.frmSubproceso;
		form.submit();
		//if(validaForm()) form.submit();			
}

</script>
<jsp:useBean id="subproceso" scope="session" class="GtsSoftware.subproceso.SubprocesoBeanData"></jsp:useBean>

<%-- 		 <jsp:include page="/Gts/general/superior.jsp" /> --%> 
		<div class="container-fluid">
		<div class="row-fluid">
				
			<!-- left menu starts -->
<%-- 			<jsp:include page="/Gts/general/leftmenu3.jsp" /> --%>
			
		<!-- left menu ends -->   
		
		  <noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">
			  <!-- content starts -->
	<!-- 		  <div>
			    <ul class="breadcrumb">
			      <li> <a href="#">Home</a> / <a href="#">Crear Proceso</li>
		        </ul>
		      </div> -->
			  <div class="row-fluid sortable">
			    <div class="box span12">
			      <div class="box-header well" data-original-title>
			        <h2>CREAR SUBPROCESO</h2>
					</div>
					<div class="box-content">
					
						<form class="form-horizontal" id="frmSubproceso" name="frmSubproceso" method="POST" action="<%= response.encodeURL("SMVSubproceso")%>">
			                <input type="hidden" name="accion" value="Agregar"></input>
			                <input type="hidden" name="codigo" value="<%=subproceso.getCodigosubprocesopadre()%>"></input>
			                <input type="hidden" name="nombre" value="<%=subproceso.getNombre()%>"></input>
			                <input type="hidden" name="descripcion" value="<%=subproceso.getDescripcion()%>"></input>
							<input type="hidden" name="tipo" value="2"></input>
							
						  <fieldset>        
						                                                                        
							  <div class="control-group">                        
                                  <label class="control-label" for="typeahead1">Nombre Subproceso Padre:</label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtSubprocesoPadre" name="txtSubprocesoPadre" data-provide="typeahead" disabled value="<%=subproceso.getNombre()%>">
                                  </div>
                              </div>
                              
							  <div class="control-group">                        
                                  <label class="control-label" for="typeahead1">Nombre Subproceso:</label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtSubproceso" name="txtSubproceso" data-provide="typeahead" >
                                  </div>
                              </div>      					
         					
                             <div class="control-group">
			              		<label class="control-label" for="typeahead2">Fecha Registro: </label>
			              		<div class="controls">
			                		<input type="text"  class="input-xlarge datepicker" id="fFechaActual" name="fFechaActual" value="22/09/2014">
		                  		</div>
		                	</div>
                        					
			                   <div class="control-group">  
                                  <label class="control-label" for="typeahead4">Descripci�n: </label>
                                  <div class="controls">                   
                                      <textarea id="txtDescripcion" name="txtDescripcion" rows="3" cols="1000" style="resize:none; height: 74px; width: 273px"></textarea>
                                  </div>
                              </div>   
                              
			            <div class="form-actions">
			              <button type="submit" class="btn btn-primary" onclick="javascript:alt_submit()">
			              <i class="icon-check icon-white"></i> 
			              Crear</button>
			              <button type="reset" class="btn" onclick="location.href='configurarsubproceso.jsp'">
			              <i class="icon-circle-arrow-left icon-black"></i>
			              Regresar</button>
		                </div>
						

		              </fieldset>
		            </form>
		          </div>
		        </div>
				
			    <!--/span-->
		      </div>
			  <!--/row-->

			  <!--/row-->

			  <!--/row-->
			   
       		<!-- content ends -->
		  </div><!--/#content.span10-->
				</div><!--/fluid-row-->
				
		<hr>

		<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3>Settings</h3>
			</div>
			<div class="modal-body">
				<p>Here settings can be configured...</p>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">Close</a>
				<a href="#" class="btn btn-primary">Save changes</a>
			</div>
		</div>
<!-- 
		<footer>
		  <p class="pull-left"><a href="http://usman.it/free-responsive-admin-template">GTS</a> &copy;  2014</p>
          <p class="pull-right">Powered by: <a href="http://usman.it/free-responsive-admin-template">PUCP</a></p>
		</footer> -->
		
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
	<script>
	function loadContent() 
{ 
   $("#includedContent").load("menu.html"); 
} 

	</script>
		<script>loadContent()</script> 
</body>
</html>
