
<%@page import="GtsSoftware.general.Constants"%>
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
						  
						 <span style="display:inline-block">
						    <div class="control-group">    
							  <br>                    
                                  <label class="control-label" for="typeahead1">N&uacute;mero Serie: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span10 typeahead" id="txtNumeroSerie" name="txtNumeroSerie" data-provide="typeahead" value="<%=activo.getNumeroSerie()%>" disabled>
                                  </div>
                              </div>
                              
                              <div class="control-group">    							             
                                  <label class="control-label" for="typeahead1">C&oacute;digo Patrimonial : </label>
                                  <div class="controls">
                                  	<input type="text"  class="span10 typeahead" id="txtCodigoPatrimonial" name="txtCodigoPatrimonial" data-provide="typeahead" value="<%=activo.getCodigoPatrimonial()%>" disabled>
                                  </div>
                              </div>
			                
			                <div class="control-group">                      
                                  <label class="control-label" for="typeahead1">Nombre: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span12 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" value="<%= tipoActivo.getNombre()%>" disabled>
                                  </div>
                              </div>
                           
                        	
                        <div class="control-group">
                          <label class="control-label" for="selectU">Ubicaci&oacute;n :</label>                          
                          <div class="controls">
                                  	<input type="text"  class="span8 typeahead" id="txtLocal" name="txtLocal" data-provide="typeahead" value="<%= localData.getNombre()%>" disabled>
                          </div>
                        </div>
                         
                           
                              <div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Registro: </label>
				              <div class="controls">
				                <input type="text"  class="input-small datepicker" id="fFechaRegistro" name="fFechaRegistro" value="<%=formatear(new Date(activo.getFechaRegistro().getTime()))%>" disabled>
			                  </div>
			                </div>	
			                
			                 <% 
								//SI es INACTIVO, se muestra la fecha de Baja y el motivo de baja                              
                              if(activo.getEstado()==Constants.DE_BAJA){ %>
			                		<div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Baja: </label>
				              <div class="controls">
				                <input type="text"  class="input-small datepicker" id="fFechaBaja" name="fFechaBaja" value="<%=formatear(new Date(activo.getFechaBaja().getTime()))%>" disabled>
			                  </div>
			                </div>
			                
			                <div class="control-group">
								<label class="control-label" for="selectError">Estado:</label>
								<div class="controls">
								  <select id="cmdEstado" name="cmdEstado" data-rel="chosen" style="width: 250px">	  
									<option selected value="0">Todos</option>
									<option value="<%=Constants.OPER_CALIBRADO%>">Operativo Calibrado</option>
									<option value="<%=Constants.OPER_NO_CALIBRADO%>">Operativo No Calibrado</option>
									<option value="<%=Constants.OPER_PAR_CALIBRADO%>">Operativo Parcialmente Calibrado</option>
									<option value="<%=Constants.OPER_NO_CALIBRADO%>">Operativo Parcialmente No Calibrado</option>
									<option value="<%=Constants.INOP_POR_INSUMO%>">Inoperativo por insumo</option>
									<option value="<%=Constants.INOP_POR_MANTENIMIENTO%>">Inoperativo por mantenimiento</option>
									<option value="<%=Constants.INOP_POR_REPUESTO%>">Inoperativo por repuestoo</option>
									<option value="<%=Constants.DE_BAJA%>">De baja</option>						
								  </select>
								</div>
							  </div>
			                
			                <%} %>
                         </span>
                              
                        <span style="display:inline-block">       
                              <div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Compra: </label>
				              <div class="controls">
				                <input type="text"  class="input-small datepicker" id="fFechaCompra" name="fFechaCompra" value="<%=formatear(new Date(activo.getFechaCompra().getTime()))%>" disabled>
			                  </div>
			                </div>	
			                
                              <div class="control-group">                    
                                  <label class="control-label" for="typeahead1">Monto Compra: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span4 typeahead" id="txtMontoCompra" name="txtMontoCompra" data-provide="typeahead" value="<%=activo.getMontoCompra()%>" disabled>
                                  </div>
                              </div>
                              
                    	<div class="control-group">
                          <label class="control-label" for="selectT">Tipo Moneda:</label>
                          <div class="controls">
                          			<input type="text"  class="span4 typeahead" id="txtTipoMoneda" name="txtTipoMoneda" data-provide="typeahead" value="<%= tipoMoneda.getNombre()%>" disabled>
                          </div>
                        </div>
                              
                          <div class="control-group">
                          <label class="control-label" for="selectP">Proveedor:</label>
                          <div class="controls">
                          		<input type="text"  class="span10 typeahead" id="txtProveedor" name="txtProveedor" data-provide="typeahead" value="<%= proveedor.getRazonSocial()%>" disabled>
                          </div>
                        </div>
                              
                              <div class="control-group">  
                                  <label class="control-label" for="typeahead4">Descripci&oacute;n: </label>
                                  <div class="controls">                   
                                      <textarea id="txtDescripcion" name="txtDescripcion" rows="3" cols="1000" style="resize:none; height: 74px; width: 300px" disabled><%=tipoActivo.getDescripcion() %></textarea>
                                  </div>
                              </div>
                              
                                                            
                              <% 
								//SI es INACTIVO, se muestra la fecha de Baja y el motivo de baja                              
                              if(activo.getEstado()==Constants.DE_BAJA){ %>

	
							<div class="control-group">  
                                  <label class="control-label" for="typeahead4">Motivo Baja: </label>
                                  <div class="controls">                   
                                      <textarea id="txtMotivoBaja" name="txtMotivoBaja" rows="3" cols="1000" style="resize:none; height: 74px; width: 300px" disabled><%=activo.getMotivoBaja() %></textarea>
                                  </div>
                              </div>

							<%} %>
                     </span>         

							
						    <div class="form-actions">
							  <button type="button" class="btn" onclick="location.href='buscaractivo.jsp'" >
							  <i class="icon-circle-arrow-left icon-black"></i>Regresar</button>
							</div>
						  </fieldset>
					  </form>   
					
				  </div>
				</div><!--/span-->

			</div><!--/row-->		 
					
				
		<hr>

		<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
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

		

	
		
</body>
</html>
