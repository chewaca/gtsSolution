
<%@page import="GtsSoftware.local.LocalBeanData"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
	
	
	
<jsp:useBean id="localData" scope="request" class="GtsSoftware.local.LocalBeanData"></jsp:useBean>
<jsp:useBean id="activo" scope="request" class="GtsSoftware.activo.ActivoBeanData"></jsp:useBean>
<jsp:useBean id="tipoMoneda" scope="request" class="GtsSoftware.tipomoneda.TipoMonedaBeanData"></jsp:useBean>
<jsp:useBean id="proveedor" scope="request" class="GtsSoftware.proveedor.ProveedorBeanData"></jsp:useBean>
<jsp:useBean id="tipoActivo" scope="request" class="GtsSoftware.activo.TipoActivoBeanData"></jsp:useBean>

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
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
					  <h2><i class="icon-zoom-in"></i> VISUALIZAR ACTIVO</h2>
				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmData" method="POST" action="<%= response.encodeURL("SMVActivo")%>">
						<input type="hidden" name="accion" value="Consultar"></input>
						<input type="hidden" name="tipo" value="2"></input>
						
						  <fieldset>
						    <div class="control-group">    
							  <br>                    
                                  <label class="control-label" for="typeahead1">Número Serie: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtNumeroSerie" name="txtNumeroSerie" data-provide="typeahead" value="<%=activo.getNumeroSerie()%>" disabled>
                                  </div>
                              </div>
			                
			                <div class="control-group">                      
                                  <label class="control-label" for="typeahead1">Nombre: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" value="<%=activo.getNombre()%>" disabled>
                                  </div>
                              </div>
                              
                              <div class="control-group">
                          	<label class="control-label" for="selectS1">Tipo Activo:</label>
                          	<div class="controls">
								  <select data-rel="chosen" id="cmbTipoActivo" name="cmbTipoActivo" disabled>			
								  	
										<option value="<%= tipoActivo.getCodigo()%>" ><%= tipoActivo.getNombre()%></option>
								
								  </select>
                          	</div>
                        	</div>
                        	
                        <div class="control-group">
                          <label class="control-label" for="selectP">Ubicación :</label>
                          <div class="controls">
								  <select data-rel="chosen" id="cmbLocal" name="cmbLocal" disabled>			
		
										<option value="<%= localData.getCodigo()%>" ><%= localData.getNombre()%></option>

								  </select>
                          </div>
                        </div>
                              
                              <div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Registro: </label>
				              <div class="controls">
				                <input type="text"  class="input-xlarge datepicker" id="fFechaRegistro" name="fFechaRegistro" value="<%=formatear(new Date(activo.getFechaRegistro().getTime()))%>" disabled>
			                  </div>
			                </div>	
                              
                              
                              <div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Compra: </label>
				              <div class="controls">
				                <input type="text"  class="input-xlarge datepicker" id="fFechaCompra" name="fFechaCompra" value="<%=formatear(new Date(activo.getFechaCompra().getTime()))%>" disabled>
			                  </div>
			                </div>	
			                
                              <div class="control-group">                    
                                  <label class="control-label" for="typeahead1">Monto Compra: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtMontoCompra" name="txtMontoCompra" data-provide="typeahead" value="<%=activo.getMontoCompra()%>" disabled>
                                  </div>
                              </div>
                              
                    	<div class="control-group">
                          <label class="control-label" for="selectT">Tipo Moneda:</label>
                          <div class="controls">
								  <select data-rel="chosen" id="cmbTipoMoneda" name="cmbTipoMoneda" disabled>			
										<option value="<%= tipoMoneda.getCodigo()%>" disabled><%= tipoMoneda.getNombre()%></option>
								  </select>
                          </div>
                        </div>
                              
                          <div class="control-group">
                          <label class="control-label" for="selectP">Proveedor:</label>
                          <div class="controls">
								  <select data-rel="chosen" id="cmbProveedor" name="cmbProveedor" disabled>			
									<option value="<%= proveedor.getCodigo()%>" disabled><%= proveedor.getRazonSocial()%></option>
								  </select>
                          </div>
                        </div>
                              
                              <div class="control-group">  
                                  <label class="control-label" for="typeahead4">Descripción: </label>
                                  <div class="controls">                   
                                      <textarea id="txtDescripcion" name="txtDescripcion" rows="3" cols="1000" style="resize:none; height: 74px; width: 320px" disabled><%=activo.getDescripcion() %></textarea>
                                  </div>
                              </div>
                              
                              <% 
								//SI es INACTIVO, se muestra la fecha de Baja y el motivo de baja                              
                              if(activo.getEstado()==2){ %>
							
							<div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Baja: </label>
				              <div class="controls">
				                <input type="text"  class="input-xlarge datepicker" id="fFechaBaja" name="fFechaBaja" value="<%=formatear(new Date(activo.getFechaBaja().getTime()))%>" disabled>
			                  </div>
			                </div>
								
							<div class="control-group">  
                                  <label class="control-label" for="typeahead4">Motivo Baja: </label>
                                  <div class="controls">                   
                                      <textarea id="txtMotivoBaja" name="txtMotivoBaja" rows="3" cols="1000" style="resize:none; height: 74px; width: 300px" disabled><%=activo.getMotivoBaja() %></textarea>
                                  </div>
                              </div>
							
							
							<%} %>
							
						    <div class="form-actions" >
							 <!--  <button type="submit" class="btn btn-primary">Agregar</button> -->
							  <button type="button" class="btn" onclick="location.href='buscaractivo.jsp'" >
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
