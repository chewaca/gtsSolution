
<%@page import="GtsSoftware.marca.MarcaBeanData"%>
<%@page import="GtsSoftware.activo.TipoActivoBeanData"%>
<%@page import="GtsSoftware.tipomoneda.TipoMonedaBeanData"%>
<%@page import="GtsSoftware.proveedor.ProveedorBeanData"%>
<%@page import="GtsSoftware.general.Constants"%>
<%@page import="GtsSoftware.local.LocalBeanData"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
	
	
	
<jsp:useBean id="localData" scope="request" class="GtsSoftware.local.LocalBeanData"></jsp:useBean>
<jsp:useBean id="activo" scope="request" class="GtsSoftware.activo.ActivoBeanData"></jsp:useBean>
<jsp:useBean id="tipoMoneda" scope="request" class="GtsSoftware.tipomoneda.TipoMonedaBeanData"></jsp:useBean>
<jsp:useBean id="proveedor" scope="request" class="GtsSoftware.proveedor.ProveedorBeanData"></jsp:useBean>
<jsp:useBean id="tipoActivo" scope="request" class="GtsSoftware.activo.TipoActivoBeanData"></jsp:useBean>
<jsp:useBean id="marcaData" scope="request" class="GtsSoftware.marca.MarcaBeanData"></jsp:useBean>

<jsp:useBean id="marcasData" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="proveedoresData" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="tipoMonedasData" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="localesData" scope="request" class="java.util.Vector"></jsp:useBean>	
<jsp:useBean id="tiposActivos" scope="request" class="java.util.Vector"></jsp:useBean>	


<script>

function alt_submit(){
	var form= document.frmActivo;
	form.submit();
	//if(validaForm()) form.submit();			
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
					  <h2><i class="icon-zoom-in"></i> MODIFICAR ACTIVO</h2>
				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmActivo" id="frmActivo" method="POST" action="SMVActivo">
						<input type="hidden" name="codigo" value="<%=activo.getCodigo()%>"></input>
						<input type="hidden" name="accion" value="Modificar"></input>
						<input type="hidden" name="tipo" value="2"></input>
						
						  <fieldset>
						  
						 <span style="display:inline-block">
						    <div class="control-group">    
							  <br>                    
                                  <label class="control-label" for="typeahead1">N&uacute;mero Serie (*): </label>
                                  <div class="controls">
                                  	<input type="text"  class="span10 typeahead" id="txtNumeroSerie" name="txtNumeroSerie" data-provide="typeahead" value="<%=activo.getNumeroSerie()%>" >
                                  </div>
                              </div>
                              
                              <div class="control-group">    							             
                                  <label class="control-label" for="typeahead1">C&oacute;digo Patrimonial (*) : </label>
                                  <div class="controls">
                                  	<input type="text"  class="span10 typeahead" id="txtCodigoPatrimonial" name="txtCodigoPatrimonial" data-provide="typeahead" value="<%=activo.getCodigoPatrimonial()%>" >
                                  </div>
                              </div>
			                
			               <div class="control-group">   
                                <label class="control-label" for="selectS1">Nombre (*):</label>
                          		<div class="controls">
								  	<select data-rel="chosen" id="cmbTipoActivo" name="cmbTipoActivo" style="width:190px">
											<%for(int i=0;i<tiposActivos.size();i++){ %>
											<optgroup label="<%=((TipoActivoBeanData)tiposActivos.get(i)).getNombre()%>">
												<%for(int j=i+1;j<tiposActivos.size();j++){ %>
										
										  		<%if(((TipoActivoBeanData)tiposActivos.get(i)).getCodigo()==((TipoActivoBeanData)tiposActivos.get(j)).getTipoActivoPadre()) {%>
										  	<option value=<%=((TipoActivoBeanData)tiposActivos.get(j)).getCodigo()%> <%=j==tipoActivo.getCodigo()-1?"selected":""%>><%=((TipoActivoBeanData)tiposActivos.get(j)).getNombre()%> </option>
										 	<%} %>
										<%} %>
									</optgroup>
										<%} %>
								  	</select>
                          		</div>
                         	</div>
                           
                        	
                       				<div class="control-group">
                          				<label class="control-label" for="selectP">Ubicación :</label>
                          					<div class="controls">
							  					<select data-rel="chosen" id="cmbLocal" name="cmbLocal" style="width:190px">			
													<%for(int i=0;i<localesData.size();i++){ %>
														<option value="<%= ((LocalBeanData)localesData.get(i)).getCodigo()%>" <%=i==localData.getCodigo()-1?"selected":""%>><%= ((LocalBeanData)localesData.get(i)).getNombre()%></option>
													<%} %>
							  					</select>
                         					 </div>
                       				</div>
                         
                           
                              <div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Registro: </label>
				              <div class="controls">
				                <input type="text"  class="input-small datepicker" id="fFechaRegistro" name="fFechaRegistro" value="<%=formatear(new Date(activo.getFechaRegistro().getTime()))%>" >
			                  </div>
			                </div>	
			                
			                 <% 
								//SI es INACTIVO, se muestra la fecha de Baja y el motivo de baja                              
                              if(activo.getEstado()==Constants.DE_BAJA){ %>
			                		<div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Baja: </label>
				              <div class="controls">
				                <input type="text"  class="input-small datepicker" id="fFechaBaja" name="fFechaBaja" value="<%=formatear(new Date(activo.getFechaBaja().getTime()))%>" >
			                  </div>
			                </div>
			                
			                <%Integer estado=activo.getEstado(); %>
			                <div class="control-group">
								<label class="control-label" for="selectError">Estado:</label>
								<div class="controls">
								  <select id="cmdEstado" name="cmdEstado" data-rel="chosen" style="width: 250px">	  
									<option selected value="0">Todos</option>
									<option value="<%=Constants.OPER_CALIBRADO%>" <%=Constants.OPER_CALIBRADO==estado?"selected":""%>>Operativo Calibrado</option>
									<option value="<%=Constants.OPER_NO_CALIBRADO%>" <%=Constants.OPER_NO_CALIBRADO==estado?"selected":""%>>Operativo No Calibrado</option>
									<option value="<%=Constants.OPER_PAR_CALIBRADO%>" <%=Constants.OPER_PAR_CALIBRADO==estado?"selected":""%>>Operativo Parcialmente Calibrado</option>
									<option value="<%=Constants.OPER_NO_CALIBRADO%>" <%=Constants.OPER_NO_CALIBRADO==estado?"selected":""%>>Operativo Parcialmente No Calibrado</option>
									<option value="<%=Constants.INOP_POR_INSUMO%>" <%=Constants.INOP_POR_INSUMO==estado?"selected":""%>>Inoperativo por insumo</option>
									<option value="<%=Constants.INOP_POR_MANTENIMIENTO%>" <%=Constants.INOP_POR_MANTENIMIENTO==estado?"selected":""%>>Inoperativo por mantenimiento</option>
									<option value="<%=Constants.INOP_POR_REPUESTO%>" <%=Constants.INOP_POR_REPUESTO==estado?"selected":""%>>Inoperativo por repuestoo</option>
									<option value="<%=Constants.DE_BAJA%>" <%=Constants.DE_BAJA==estado?"selected":""%>>De baja</option>						
								  </select>
								</div>
							  </div>
			                
			                <%} %>
                         </span>
                              
                        <span style="display:inline-block">       
                              <div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Compra: </label>
				              <div class="controls">
				                <input type="text"  class="input-small datepicker" id="fFechaCompra" name="fFechaCompra" value="<%=formatear(new Date(activo.getFechaCompra().getTime()))%>" >
			                  </div>
			                </div>	
			                
                              <div class="control-group">                    
                                  <label class="control-label" for="typeahead1">Monto Compra: </label>
                                  <div class="controls">
                                  	<%if(activo.getMontoCompra()!=null){ %>
                                  	<input type="text"  class="span5 typeahead" id="txtMontoCompra" name="txtMontoCompra" data-provide="typeahead" value="<%=activo.getMontoCompra()%>" >
                                  	<%}else{ %>
                                  	<input type="text"  class="span5 typeahead" id="txtMontoCompra" name="txtMontoCompra" data-provide="typeahead" value="" >
                                  	<%} %>
                                  </div>
                              </div>
   
                    	<div class="control-group">   
                        	<label class="control-label" for="selectT" >Tipo Moneda :</label>
                          	<div class="controls">
							  	<select data-rel="chosen" data-placeholder="Seleccione" id="cmbTipoMoneda" name="cmbTipoMoneda" style="width:190px">
							  		<%if (tipoMoneda.getCodigo()==null){ %>
							  			<option value="">Seleccione opción</option>
							  		<%for(int i=0;i<tipoMonedasData.size();i++){ %>
							  			<option value="<%= ((TipoMonedaBeanData)tipoMonedasData.get(i)).getCodigo()%>"><%= ((TipoMonedaBeanData)tipoMonedasData.get(i)).getNombre()%></option>		
									<%}}else{%>
									<%for(int i=0;i<tipoMonedasData.size();i++){ %>
										<option value="<%= ((TipoMonedaBeanData)tipoMonedasData.get(i)).getCodigo()%>" <%=i==tipoMoneda.getCodigo()-1?"selected":""%>><%= ((TipoMonedaBeanData)tipoMonedasData.get(i)).getNombre()%></option>
									<%} 
									}%>
									
							  </select>
                         	</div>
                       </div>
                              
                          <div class="control-group">
                     		<label class="control-label" for="selectP">Proveedor (*):</label>
                     		<div class="controls">
		  						<select data-rel="chosen" data-placeholder="Seleccione" id="cmbProveedor" name="cmbProveedor" style="width:190px">			
								<%for(int i=0;i<proveedoresData.size();i++){ %>
									<option value="<%= ((ProveedorBeanData)proveedoresData.get(i)).getCodigo()%>" <%=i==proveedor.getCodigo()-1?"selected":""%>><%= ((ProveedorBeanData)proveedoresData.get(i)).getRazonSocial()%></option>
								<%} %>
		  						</select>
                     		</div>
                        </div> 
                              
                              <div class="control-group">   
                          	  		<label class="control-label" for="selectM">Marca :</label>
                          				<div class="controls">
								  			<select data-rel="chosen" id="cmbMarca" name="cmbMarca" style="width:190px">
								  				<%if (marcaData.getCodigo()==null){ %>
							  						<option value="">Seleccione opción</option>
							  					<%for(int i=0;i<tipoMonedasData.size();i++){ %>
							  						<option value="<%= ((MarcaBeanData)marcasData.get(i)).getCodigo()%>"><%= ((MarcaBeanData)marcasData.get(i)).getNombre()%></option>		
												<%}}else{%>	
							  									
												<%for(int i=0;i<marcasData.size();i++){ %>
													<option value="<%= ((MarcaBeanData)marcasData.get(i)).getCodigo()%>" <%=i==marcaData.getCodigo()-1?"selected":""%>><%= ((MarcaBeanData)marcasData.get(i)).getNombre()%></option>
												<%} 
												}%>
								  			</select>
                          				</div>
                          			</div>
                              
                                                            
                              <% 
								//SI es INACTIVO, se muestra la fecha de Baja y el motivo de baja                              
                              if(activo.getEstado()==Constants.DE_BAJA){ %>

	
							<div class="control-group">  
                                  <label class="control-label" for="typeahead4">Motivo Baja: </label>
                                  <div class="controls">                   
                                      <textarea id="txtMotivoBaja" name="txtMotivoBaja" rows="3" cols="1000" style="resize:none; height: 74px; width: 300px" ><%=activo.getMotivoBaja() %></textarea>
                                  </div>
                              </div>

							<%} %>
                     </span>         

							
						    <div class="form-actions" >
						    	<button type="button" class="btn btn-primary" onclick="javascript:alt_submit()">
			              		<i class="icon-check icon-white"></i> Guardar</button>
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

</body>
</html>
