<%@page import="GtsSoftware.proveedor.ResultadoProveedorBeanData"%>
<%@page import="GtsSoftware.personal.ResultadoPersonalBeanData"%>
<%@page import="java.text.SimpleDateFormat"%>
 <%@page import="GtsSoftware.activo.ResultadoActivoBeanData"%> 
<%@page import="java.util.Vector"%>

<script>
	function alt_fecha(obj){
	obj.value=obj.value.slice(0,5);
	
	}
	
	function alt_submit(){
		var form= document.getElementById("frmAlternativo");
		form.accion.value="AgregarMultiple";
		form.submit();
		
}
	
	
	function alt_consultar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Consultar";
		form.codigo.value=cod;
		form.submit();
	}
		
	function alt_Insertar_Proveedor(cod,name){
		
		parent.anhadirProveedor(cod,name);
	}
	</script>	
	
<!--The beans  -->
<jsp:useBean id="resultadosProveedor" scope="request" class="java.util.Vector"></jsp:useBean>
	
			<!-- content starts -->

			<div class="row-fluid sortable">
				
			<!-- content starts -->

			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-search"></i> BUSCAR PROVEEDOR</h2>
                        <div class="box-icon">
							
						</div>

				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmCriteriosBusqueda" id="frmCriteriosBusqueda"  method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/programacion/SMVProgramacion")%>">
						   <input type="hidden" name="accion" value="SeleccionarProveedor"/></input>
						   <input type="hidden" name="tipo" value="1"/></input>
						  
						  <fieldset>
						  
						    <div class="control-group">
						    
						      <div class="control-group">						    
						     <div class="control-group">
							    <label class="control-label" for="typeahead6">Raz�n Social : </label>
							    <div class="controls">
							      <input type="text" class="span6 typeahead" id="txtRazonSocial" name="txtRazonSocial" data-provide="typeahead" data-items="4" >
						        </div>
						      </div>
						      						    
							  <div class="control-group">
								<label class="control-label" for="selectError">Estado:</label>
								<div class="controls">
								  <select id="cmdTipoDocumento" name="cmdEstado" data-rel="chosen" >	  
									<option value="Activo">Activo</option>
									<option value="Inactivo">Inactivo</option>						
								  </select>
								</div>
							  </div>
						    </div>

						    </div>
						    
						    <div class="form-actions">
						    <button type="submit" class="btn btn-primary"><i class="icon-search icon-white"></i>Buscar</button>

							</div>
						  </fieldset>
					  </form>   

				  </div>
				</div><!--/span-->

			</div><!--/row-->

    
					<!-- content ends -->
			</div><!--/span-->
			
			
			<form id="frmAlternativo" name="frmAlternativo" method="POST" action="SMVProgramacion">
			  <input type="hidden" name="accion" value="AgregarMultiple"></input>
			  <input type="hidden" name="codigo" value=""></input>
			 <input type="hidden" name="tipo" value="1"></input>

			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2>RESULTADOS</h2>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">

						   <thead>
							  <tr>
								  <th width="25%">Nombre</th>
								  <th width="15%">Apellidos</th>
								  <th width="8%">Telefono</th>
								  <th width="8%">Correo Electronico</th>

								  <th>Operaci�n</th>

							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 

						  <%SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy"); 
                          			for(int i=0;
                          			i<resultadosProveedor.size();i++){
                             %>
                             	
                            
							 <tr>

                          	 <td class="center">
                          				<%=
                          					((ResultadoProveedorBeanData)resultadosProveedor.get(i)).getRazonSocial()

                          				%>
                          	</td>
                          	
                          	<td class="center">
                          				<%=
                          					((ResultadoProveedorBeanData)resultadosProveedor.get(i)).getRuc()

                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoProveedorBeanData)resultadosProveedor.get(i)).getTelefono1()

                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoProveedorBeanData)resultadosProveedor.get(i)).getCorreoElectronico()

                          				%>
                          	</td>
                           

                          	       <td class="center">
                          				<a class="btn btn-primary"
                          					href="javascript:alt_Insertar_Proveedor('<%=((ResultadoProveedorBeanData)resultadosProveedor.get(i)).getCodigo()%>','<%= ((ResultadoProveedorBeanData)resultadosProveedor.get(i)).getRazonSocial() %>')">
                          					<i
                          						class="icon-ok icon-white">
                          					</i>
Seleccionar
                          				</a>
                          				
                          			</td>
                          	
							<%}%>
					       </tbody>
					       </element>
					  </table>            
					</div>
				</div><!--/span-->
			
			</div>

			</form>
			
			
			<!--/row-->
                 

			


                
                
         