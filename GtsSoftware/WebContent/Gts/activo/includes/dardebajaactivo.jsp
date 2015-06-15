
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<jsp:useBean id="localData" scope="request" class="GtsSoftware.local.LocalBeanData"></jsp:useBean>	
<jsp:useBean id="activo" scope="request" class="GtsSoftware.activo.ActivoBeanData"></jsp:useBean>
<jsp:useBean id="tipoMoneda" scope="request" class="GtsSoftware.tipomoneda.TipoMonedaBeanData"></jsp:useBean>
<jsp:useBean id="proveedor" scope="request" class="GtsSoftware.proveedor.ProveedorBeanData"></jsp:useBean>
<jsp:useBean id="tipoActivo" scope="request" class="GtsSoftware.activo.TipoActivoBeanData"></jsp:useBean>

<script>

function alt_submit(){
	if(confirm("¿Seguro que desea guardar cambios?"))
	{
		var form= document.frmData;
		form.submit();	
	}
	return 0;
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
					  <h2><i class="icon-trash"></i> DAR DE BAJA ACTIVO</h2>
				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmData" method="POST" action="<%= response.encodeURL("SMVActivo")%>">
						<input type="hidden" name="accion" value="DarDeBaja"></input>
						<input type="hidden" name="codigo" value="<%=activo.getCodigo()%>"></input>
						<input type="hidden" name="tipo" value="2"></input>
						
						  <fieldset>
						  
						  <span style="display:inline-block">
						    <div class="control-group">    
							  <br>                    
                                  <label class="control-label" for="typeahead1">Número Serie: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span7 typeahead" id="txtNumeroSerie" name="txtNumeroSerie" data-provide="typeahead" value="<%=activo.getNumeroSerie()%>" disabled>
                                  </div>
                              </div>
                              
                              <div class="control-group">    							             
                                  <label class="control-label" for="typeahead1">Código Patrimonial : </label>
                                  <div class="controls">
                                  	<input type="text"  class="span7 typeahead" id="txtCodigoPatrimonial" name="txtCodigoPatrimonial" data-provide="typeahead" value="<%=activo.getCodigoPatrimonial()%>" disabled>
                                  </div>
                              </div>
			                
			                <div class="control-group">                      
                                  <label class="control-label" for="typeahead1">Nombre: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span10 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" value="<%= tipoActivo.getNombre()%>" disabled>
                                  </div>
                              </div>
                           
                        	
                        <div class="control-group">
                          <label class="control-label" for="selectU">Ubicación :</label>                          
                          <div class="controls">
                                  	<input type="text"  class="span7 typeahead" id="txtLocal" name="txtLocal" data-provide="typeahead" value="<%= localData.getNombre()%>" disabled>
                          </div>
                        </div>
                              
                              <div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Registro: </label>
				              <div class="controls">
				                <input type="text"  class="input-small datepicker" id="fFechaRegistro" name="fFechaRegistro" value="<%=formatear(new Date(activo.getFechaRegistro().getTime()))%>" disabled>
			                  </div>
			                </div>	
                              
                              
                              <div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Compra: </label>
				              <div class="controls">
				                <input type="text"  class="input-small datepicker" id="fFechaCompra" name="fFechaCompra" value="<%=formatear(new Date(activo.getFechaCompra().getTime()))%>" disabled>
			                  </div>
			                </div>	
			                </span>
			                
			                <span style="display:inline-block">
                              <div class="control-group">                    
                                  <label class="control-label" for="typeahead1">Monto Compra: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtMontoCompra" name="txtMontoCompra" data-provide="typeahead" value="<%=activo.getMontoCompra()%>" disabled>
                                  </div>
                              </div>
                              
                    	<div class="control-group">
                          <label class="control-label" for="selectT">Tipo Moneda:</label>
                          <div class="controls">
                          			<input type="text"  class="span6 typeahead" id="txtTipoMoneda" name="txtTipoMoneda" data-provide="typeahead" value="<%= tipoMoneda.getNombre()%>" disabled>
                          </div>
                        </div>
                              
                          <div class="control-group">
                          <label class="control-label" for="selectP">Proveedor:</label>
                          <div class="controls">
                          		<input type="text"  class="span7 typeahead" id="txtProveedor" name="txtProveedor" data-provide="typeahead" value="<%= proveedor.getRazonSocial()%>" disabled>
                          </div>
                        </div>
                              
                              <div class="control-group">  
                                  <label class="control-label" for="typeahead4">Descripción: </label>
                                  <div class="controls">                   
                                      <textarea id="txtDescripcion" name="txtDescripcion" rows="3" cols="1000" style="resize:none; height: 74px; width: 300px" disabled><%=tipoActivo.getDescripcion() %></textarea>
                                  </div>
                              </div>                              
                              
                              <div class="control-group">  
                                  <label class="control-label" for="typeahead4">Motivo Baja: </label>
                                  <div class="controls">                   
                                      <textarea id="txtMotivoBaja" name="txtMotivoBaja" rows="3" cols="1000" style="resize:none; height: 74px; width: 300px"></textarea>
                                  </div>
                              </div>
							</span>
							
						   <div class="form-actions">
							  <button type="button" class="btn btn-primary" onclick="javascript:alt_submit()"><i class="icon-check icon-white"></i> Guardar</button>
							  <button type="button" class="btn" onclick="location.href='buscaractivo.jsp'" >
							  <i class="icon-circle-arrow-left icon-black"></i> Regresar</button>
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
