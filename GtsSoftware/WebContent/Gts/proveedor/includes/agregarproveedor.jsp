
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="GtsSoftware.proveedor.ProveedorBeanData"%>
<%@page import="GtsSoftware.tipomoneda.TipoMonedaBeanData"%>
<%@page import="GtsSoftware.local.LocalBeanData"%>
<%@page import="GtsSoftware.activo.TipoActivoBeanData"%>
<script>

function alt_submit(){
		var form= document.frmActivo;
		form.submit();
		//if(validaForm()) form.submit();			
}

</script>

<jsp:useBean id="proveedoresData" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="tipoMonedasData" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="localesData" scope="request" class="java.util.Vector"></jsp:useBean>	
<jsp:useBean id="tiposActivos" scope="request" class="java.util.Vector"></jsp:useBean>	

			  <div class="row-fluid sortable">
			    <div class="box span12">
			      <div class="box-header well" data-original-title>
			        <h2><i class="icon-wrench"></i> AGREGAR ACTIVO</h2>
					</div>
					<div class="box-content">
					<% 
					SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy"); 
					Date fechaActual=new Date(); %>
						<form class="form-horizontal" id="frmActivo" name="frmActivo" method="POST" action="<%= response.encodeURL("SMVActivo")%>">
			                <input type="hidden" name="accion" value="Agregar"></input>
							<input type="hidden" name="tipo" value="2"></input>
							
						  <fieldset>                                                                              
							  
							  <div class="control-group">    
							  <br>                    
                                  <label class="control-label" for="typeahead1">Número Serie : </label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtNumeroSerie" name="txtNumeroSerie" data-provide="typeahead" >
                                  </div>
                              </div>
			                
			                <div class="control-group">                      
                                  <label class="control-label" for="typeahead1">Nombre : </label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" >
                                  </div>
                              </div>
                              
                              <div class="control-group">
                          	<label class="control-label" for="selectS1">Tipo Activo :</label>
                          	<div class="controls">
								  <select data-rel="chosen" id="cmbTipoActivo" name="cmbTipoActivo">			
								  	<%-- <%for(int i=0;i<tiposActivos.size();i++){ %>
										<option value="<%= ((TipoActivoBeanData)tiposActivos.get(i)).getCodigo()%>" <%=i==0?"selected":""%>><%= ((TipoActivoBeanData)tiposActivos.get(i)).getNombre()%></option>
									<%} %> --%>
									<%for(int i=0;i<tiposActivos.size();i++){ %>
										<optgroup label="<%=((TipoActivoBeanData)tiposActivos.get(i)).getNombre()%>">
										<%for(int j=i+1;j<tiposActivos.size();j++){ %>
										
										  <%if(((TipoActivoBeanData)tiposActivos.get(i)).getCodigo()==((TipoActivoBeanData)tiposActivos.get(j)).getTipoActivoPadre()) {%>
										  <option value=<%=((TipoActivoBeanData)tiposActivos.get(j)).getCodigo()%>><%=((TipoActivoBeanData)tiposActivos.get(j)).getNombre()%></option>
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
								  <select data-rel="chosen" id="cmbLocal" name="cmbLocal">			
									<%for(int i=0;i<localesData.size();i++){ %>
										<option value="<%= ((LocalBeanData)localesData.get(i)).getCodigo()%>" <%=i==0?"selected":""%>><%= ((LocalBeanData)localesData.get(i)).getNombre()%></option>
									<%} %>
								  </select>
                          </div>
                        </div>
                              
                              
			                
			                
                              <div class="control-group">                    
                                  <label class="control-label" for="typeahead1">Monto Compra : </label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtMontoCompra" name="txtMontoCompra" data-provide="typeahead" >
                                  </div>
                              </div>
                              
                    	<div class="control-group">
                          <label class="control-label" for="selectT">Tipo Moneda :</label>
                          <div class="controls">
								  <select data-rel="chosen" data-placeholder="Seleccione" id="cmbTipoMoneda" name="cmbTipoMoneda">			
									<%for(int i=0;i<tipoMonedasData.size();i++){ %>
										<option value="<%= ((TipoMonedaBeanData)tipoMonedasData.get(i)).getCodigo()%>" <%=i==0?"selected":""%>><%= ((TipoMonedaBeanData)tipoMonedasData.get(i)).getNombre()%></option>
									<%} %>
								  </select>
                          </div>
                        </div>
                        
                        <div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Compra : </label>
				              <div class="controls">
				                <input type="text"  class="input-xlarge datepicker" id="fFechaCompra" name="fFechaCompra" value=<%=df.format(fechaActual)%>>
			             	   </div>
                         </div>	
                              
                        <div class="control-group">
                          <label class="control-label" for="selectP">Proveedor :</label>
                          <div class="controls">
								  <select data-rel="chosen" data-placeholder="Seleccione" id="cmbProveedor" name="cmbProveedor">			
									<%for(int i=0;i<proveedoresData.size();i++){ %>
										<option value="<%= ((ProveedorBeanData)proveedoresData.get(i)).getCodigo()%>" <%=i==0?"selected":""%>><%= ((ProveedorBeanData)proveedoresData.get(i)).getRazonSocial()%></option>
									<%} %>
								  </select>
                          </div>
                        </div>
                        
                        <div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Vencimiento Garantía : </label>
				              <div class="controls">
				                <input type="text"  class="input-xlarge datepicker" id="fFechaVencimientoGarantia" name="fFechaVencimientoGarantia" value=<%=df.format(fechaActual) %>>
			                  </div>
			            </div>	
                              
                         <div class="control-group" >
								<label class="control-label" for="typeahead13">Bajo Mantenimiento :</label>
								<div class="controls">
								  <label class="radio">
									<input type="radio" name="rButton" id="optionsRadios1" value="1"  checked >
									Si
								  </label>
								  <div style="clear:both">
								  <label class="radio">
									<input type="radio" name="rButton" id="optionsRadios2" value="0">
									No
								  </label>
								  </div>
								</div>
							  </div>      
                              
                              <div class="control-group">  
                                  <label class="control-label" for="typeahead4">Descripción : </label>
                                  <div class="controls">                   
                                      <textarea id="txtDescripcion" name="txtDescripcion" rows="3" cols="1000" style="resize:none; height: 74px; width: 320px"></textarea>
                                  </div>
                              </div>
                              
                              <%-- <div class="control-group">
								<label class="control-label" for="selectError2">Group Select</label>
								<div class="controls">
									<select data-placeholder="Your Favorite Football Team" id="selectError2" data-rel="chosen">
										<%for(int i=0;i<tiposActivos.size();i++){ %>
										<optgroup   label=<%=((TipoActivoBeanData)tiposActivos.get(i)).getNombre()%>>
										<%for(int j=i+1;j<tiposActivos.size();j++){ %>
										
										  <%if(((TipoActivoBeanData)tiposActivos.get(i)).getCodigo()==((TipoActivoBeanData)tiposActivos.get(j)).getTipoActivoPadre()) {%>
										  <option value=<%=((TipoActivoBeanData)tiposActivos.get(j)).getCodigo()%>><%=((TipoActivoBeanData)tiposActivos.get(j)).getNombre()%></option>
										  <%} %>
										
										<%} %>
										</optgroup>
										<%} %>
	
								  </select>
								</div>
							  </div> --%>

                              
                             						
			          
			            <div class="form-actions">
			              <button type="submit" class="btn btn-primary" onclick="javascript:alt_submit()">
			              <i class="icon-check icon-white"></i> 
			              AGREGAR</button>
			              <button type="reset" class="btn" onclick="location.href='buscaractivo.jsp'">
			              <i class="icon-circle-arrow-left icon-black"></i>
			              Regresar</button>
		                </div>
						
<!-- 					<div class="control-group">
                 <label class="control-label" for="typeahead2">(*)Campos Obligatorios </label>
                                  
                              </div> -->
		              </fieldset>
		            </form>
		          </div>
		        </div>
				
			    <!--/span-->
		      </div>
			  <!--/row-->

			  <!--/row-->

					<!-- content ends -->

		<hr>

		<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">Ã—</button>
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


		
	<!--/.fluid-container-->

	
</body>
</html>
