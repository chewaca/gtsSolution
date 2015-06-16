
<%@page import="GtsSoftware.marca.MarcaBeanData"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="GtsSoftware.proveedor.ProveedorBeanData"%>
<%@page import="GtsSoftware.tipomoneda.TipoMonedaBeanData"%>
<%@page import="GtsSoftware.local.LocalBeanData"%>
<%@page import="GtsSoftware.activo.TipoActivoBeanData"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="css/popups.css" rel="stylesheet">

<script >

function alt_submit(){
		var form= document.frmActivo;
		//form.submit();
		//if(validaForm()){
			$.ajax({
			  type: "POST",
			  url: "/GtsSoftware/Gts/activo/SMVActivo",
			  data: "accion=Agregar"+ "&tipo=3" +"&txtNumeroSerie=" + $(txtNumeroSerie).val() + "&txtCodigoPatrimonial=" + $(txtCodigoPatrimonial).val(),
			  dataType: "text",
			  success: function(msg){
			  	if(msg=="1"){
			  		alert("No se puede agregar el activo.El número de serie o código patrimonial ya existe !!!");
        			crearAlert2("No se puede agregar el activo. El número de serie ya existe.");
        		}else{
        			form.submit();    
        		}  				  								
			  },
			  error: function(){
			  	return "";
			  }
			});
		//}		
}

</script>

<jsp:useBean id="mensaje" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="marcasData" scope="request" class="java.util.Vector"></jsp:useBean>
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
						<form class="form-horizontal" id="frmActivo" name="frmActivo" method="POST" action="<%= response.encodeURL("SMVActivo")%>" target="_self">
			              <input type="hidden" name="accion" value="Agregar"></input>
						  <input type="hidden" name="tipo" value="2"></input>
							
						  <fieldset>                                                                              
							  
							  <span style="display:inline-block">
							      <div class="control-group">                 
                                  <label class="control-label" for="typeahead1">Número Serie (*): </label>
                                  <div class="controls">
                                  	<input type="text"  class="span25 typeahead" id="txtNumeroSerie" name="txtNumeroSerie" data-provide="typeahead" required title="Se necesita el número de serie">
                                  </div>
                                  </div>
                                  
                                  <div class="control-group">   
                                  	<label class="control-label" for="selectS1">Nombre (*):</label>
                          				<div class="controls">
								  			<select data-rel="chosen" id="cmbTipoActivo" name="cmbTipoActivo" style="width:190px">
								  					<option value="" selected>Seleccione opción</option>
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
                          	  		<label class="control-label" for="selectP">Marca :</label>
                          				<div class="controls">
								  			<select data-rel="chosen" id="cmbMarca" name="cmbMarca" style="width:190px">
								  				<option value="" selected>Seleccione opción</option>			
												<%for(int i=0;i<marcasData.size();i++){ %>
													<option value="<%= ((MarcaBeanData)marcasData.get(i)).getCodigo()%>"><%= ((MarcaBeanData)marcasData.get(i)).getNombre()%></option>
												<%} %>
								  			</select>
                          				</div>
                          			</div>
                          		
                          			<div class="control-group">
                          				<label class="control-label" for="selectP">Ubicación (*):</label>
                          					<div class="controls">
							  					<select data-rel="chosen" id="cmbLocal" name="cmbLocal" style="width:190px">			
													<option value="" selected>Seleccione opción</option>
													<%for(int i=0;i<localesData.size();i++){ %>
														<option value="<%= ((LocalBeanData)localesData.get(i)).getCodigo()%>" ><%= ((LocalBeanData)localesData.get(i)).getNombre()%></option>
													<%} %>
							  					</select>
                         					 </div>
                       				</div>     
							
							 <div class="control-group">    
                              <label class="control-label" for="typeahead1" >Monto Compra : </label>
                              <div class="controls">
                              	<input type="text"  class="span9 typeahead" id="txtMontoCompra" name="txtMontoCompra" data-provide="typeahead">
                              </div>
                              </div>
 
                              </span>
                            
                              <span style="display:inline-block">
                              <div class="control-group">       							             
                                  <label class="control-label" for="typeahead2"> Código Patrimonial (*): </label>
                                  <div class="controls">
                                  	<input type="text"  class="span9 typeahead" id="txtCodigoPatrimonial" name="txtCodigoPatrimonial" data-provide="typeahead" required title="Se necesita el código patrimonial">
                                  </div>
                              </div>
                              
                         		<div class="control-group">   
			              			<label class="control-label" for="typeahead3" >Fecha Compra : </label>
			              			<div class="controls">
			                			<input type="text"  style="width:190px" class="input-small datepicker" id="fFechaCompra" name="fFechaCompra" value=<%=df.format(fechaActual)%>>
		             	   			</div>
		             	   			</div>
 
                			<div class="control-group">
                          				<label class="control-label" for="selectP">Proveedor (*):</label>
                          					<div class="controls">
							  					<select data-rel="chosen" data-placeholder="Seleccione" id="cmbProveedor" name="cmbProveedor" style="width:190px">			
														<option value="" selected>Seleccione opción</option> 
													<%for(int i=0;i<proveedoresData.size();i++){ %>
														<option value="<%= ((ProveedorBeanData)proveedoresData.get(i)).getCodigo()%>"><%= ((ProveedorBeanData)proveedoresData.get(i)).getRazonSocial()%></option>
													<%} %>
							  					</select>
                          					</div>
                        			</div> 
 
                          <div class="control-group">   
                          <label class="control-label" for="typeahead3"> Vencimiento Garantía : </label>
			              <div class="controls">
			                <input type="text" style="width:120px" class="input-small datepicker" id="fFechaVencimientoGarantia" name="fFechaVencimientoGarantia" value=<%=df.format(fechaActual) %>>
		                  </div>
		                  </div>
		                  
		                     <div class="control-group">   
                        			<label class="control-label" for="selectT" >Tipo Moneda :</label>
                          				<div class="controls">
							  				<select data-rel="chosen" data-placeholder="Seleccione" id="cmbTipoMoneda" name="cmbTipoMoneda" style="width:190px">			
												<option value="" selected>Seleccione opción</option>
												<%for(int i=0;i<tipoMonedasData.size();i++){ %>
													<option value="<%= ((TipoMonedaBeanData)tipoMonedasData.get(i)).getCodigo()%>" ><%= ((TipoMonedaBeanData)tipoMonedasData.get(i)).getNombre()%></option>
												<%} %>
							 				 </select>
                         				 </div>
                         			</div>
		                  
                              </span>
                              
                              <span style="display:inline-block">
								<br><br>
                              <div class="control-group" >
								<label class="control-label" for="typeahead13">Bajo Mantenimiento :</label>
							<div class="controls">
							  	<label class="radio">
									<input type="radio" name="rButton" id="optionsRadios1" value="1"  checked >Si
							  	</label>
							  <div style="clear:both">
							  	<label class="radio">
									<input type="radio" name="rButton" id="optionsRadios2" value="0">No
							  	</label>
							  </div>
							</div>
							</div> 
 							   </span>

              					<br><br>			          
			            <div class="form-actions">
			              <button type="submit" class="btn btn-primary"  >
			              <i class="icon-check icon-white"></i> Agregar</button>
			              <button type="reset" class="btn" onclick="location.href='buscaractivo.jsp'">
			              <i class="icon-circle-arrow-left icon-black"></i> Regresar</button>
		                </div>
		                
		                 
		              </fieldset>
		            </form>
		          </div>
		        </div>
		      </div>

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

<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	
	<script src="js/dialog.js"></script>
	
<c:choose>
	<c:when test="${mensaje=='OK'}">
		<script type="text/javascript">$(function() { dlgSuccess.open(); });</script>
	</c:when>
	<c:when test="${mensaje=='Error'}">
		<script type="text/javascript">$(function() { dlgError.open(); });</script>
	</c:when>	
	<c:otherwise>
	</c:otherwise>
	</c:choose>
	
<div id="dlgSuccess">
	<div class="wrapper_pop_ups">
		<div class="titular"><img align="middle" src="img/gts_solution.png"/></div>
		<div class="titular">Se agrego correctamente</div>
		<div class="caja">
			<img src="img/icon_check.png" class="icons">
			Haz click en continuar para cerrar la ventana
		</div>
		<div class="caja_boton">
			<div class="boton3">
				<div class="botonAction bRosado" style="margin-left: auto; margin-right: auto;" onclick="dlgSuccess.close();">Continuar</div>
			</div>
		</div>			
	</div>
</div>

<div id="dlgError">
	<div class="wrapper_pop_ups">
		<br>
		<div class="titular"><img align="middle" src="img/gts_solution.png"/></div>
		<div class="titular"><img src="">Error al agregar el activo</div>
		<br>
		<textarea disabled="disabled" rows="4" cols="50" style="resize:none">Motivo: ${mensajeDetalle} 
		</textarea> 
		<br/><br/>			
		<div >
			<div >
				<div class="botonAction bRosado" style="margin-left: auto; margin-right: auto;" onclick="dlgError.close();">Continuar</div>
			</div>
		</div>
			
	</div>
</div>
	<!--/.fluid-container-->	

</body>
</html>
