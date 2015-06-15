
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
	
	<jsp:useBean id="proceso" scope="request" class="GtsSoftware.proceso.ProcesoBeanData"></jsp:useBean>
	
	<script>
		function procesar(form,indice){
			
		
		
		}
	
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
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
					  <h2>VISUALIZAR PROCESO</h2>
				  </div>
					<div class="box-content">
						<form class="form-horizontal" action="<%= response.encodeURL("SMVProceso")%>" name="frmData" method="POST">
						<input type="hidden" name="accion" value="Consultar"></input>
						<input type="hidden" name="tipo" value="2"></input>
						
						  <fieldset>
						    <div class="control-group">
						      <label class="control-label" for="typeahead7">Nombre: </label>
						      
						      <div class="controls">
						       <input type="text" class="span6 typeahead" id="txtNombreSocio"  data-provide="typeahead"  name="txtNombre" disabled value="<%=proceso.getNombre()%>">
					          </div>
					        </div>
					        

							  <div class="control-group">
							  <label class="control-label" for="typeahead8">Fecha Inicio:</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="fFechaInicio" name="fFechaInicio" value="<%=formatear(new Date(proceso.getFechaInicio().getTime())) %>" disabled>
							  </div>
							</div>
							
							 <div class="control-group">
							  <label class="control-label" for="typeahead8">Fecha Fin:</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="fFechaFin" name="fFechaFin" value="<%=formatear(new Date(proceso.getFechaFin().getTime())) %>" disabled>
							  </div>
							</div>
							
							<div class="control-group">  
                                  <label class="control-label" for="typeahead4">Descripción: </label>
                                  <div class="controls">                   
                                      <textarea id="txtDescripcion" name="txtDescripcion" rows="3" cols="1000" style="resize:none; height: 74px; width: 273px" disabled><%=proceso.getDescripcion()%></textarea>
                                  </div>
                              </div>

							<div class="control-group" >
								<label class="control-label" for="typeahead13">Estado :</label>
								<div class="controls">
								  <label class="radio">
									<input type="radio" name="rButton" id="optionsRadios1" value="Activo" <% if(proceso.getEstado()==1){ %> checked <%}%> disabled>
									Activo
								  </label>
								  <div style="clear:both">
								  <label class="radio">
									<input type="radio" name="rButton" id="optionsRadios2" value="Inactivo" <% if(proceso.getEstado()==2){ %> checked <%}%> disabled>
									Inactivo
								  </label>
								  
								  </div>
								</div>
							  </div>											
							
							
						    <div class="form-actions" >
							 <!--  <button type="submit" class="btn btn-primary">Agregar</button> -->
							  <button type="button" class="btn" onclick="location.href='buscarproceso.jsp'" >
							  <i class="icon-circle-arrow-left icon-black"></i>
							  Regresar</button>
							</div>
						  </fieldset>
					  </form>   
					
				  </div>
				</div><!--/span-->

			</div><!--/row-->		 
					
				
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
		
	<!--/.fluid-container-->

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
