<%@page import="GtsSoftware.local.LocalBeanData"%>
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
		//if(validaForm()) form.submit();			
	}
	
	
	function alt_consultar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Consultar";
		form.codigo.value=cod;
		form.submit();
	}
	
	function alt_Insertar(){
		var elementos = document.getElementsByName("checkAcciones");
		//var texto=new Array(elementos.length);
/* 		for (x=0;x<elementos.length;x++)
			if (elementos[x].checked) {
				texto[x] =  elementos[x].value;
	    	}  */
 		var j=0;
		for (x=0;x<elementos.length;x++){
			if (elementos[x].checked) {				
				j++;
			}
		}

		var texto=new Array(j);
		var k=0;
		for (x=0;x<elementos.length;x++){
			if (elementos[x].checked) {
				texto[k] =  elementos[x].value;
				k++;
			}
		} 
		
		parent.anhadirRepuesto(texto);
	}
	</script>	
	
<!--The beans  -->

<jsp:useBean id="resultadosLocales" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosActivo" scope="request" class="java.util.Vector"></jsp:useBean>
	
			<!-- content starts -->

			<div class="row-fluid sortable">
				
			<!-- content starts -->

			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-search"></i> BUSCAR REPUESTO</h2>
                        <div class="box-icon">
							
						</div>

				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmCriteriosBusqueda" id="frmCriteriosBusqueda"  method="POST" action="<%= response.encodeURL("SMVActivo")%>">
						   <input type="hidden" name="accion" value="SeleccionarRepuesto"/></input>
						   <input type="hidden" name="tipo" value="2"/></input>
						  
						  <fieldset>
						  
						    <div class="control-group">
						    
						      <div class="control-group">						    
						     <div class="control-group">
							    <label class="control-label" for="typeahead6">Nombre: </label>
							    <div class="controls">
							      <input type="text" class="span6 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" data-items="4" >
						        </div>
						      </div>
						      
						      <div class="control-group">
							    <label class="control-label" for="typeahead6">Número Serie: </label>
							    <div class="controls">
							      <input type="text" class="span6 typeahead" id="txtNumeroSerie" name="txtNumeroSerie" data-provide="typeahead" data-items="4" >
						        </div>
						      </div>		    
						  
							<div class="control-group">
								<label class="control-label" for="selectU">Ubicación :</label>
								<div class="controls">
								  <select data-rel="chosen" id="cmdUbicacion" name="cmdUbicacion">
								    <option selected value="0">Todos</option>	  
									<%for(int i=0;i<resultadosLocales.size();i++){ %>
										<option value="<%= ((LocalBeanData)resultadosLocales.get(i)).getCodigo()%>" <%=i==0?"selected":""%>><%= ((LocalBeanData)resultadosLocales.get(i)).getNombre()%></option>
									<%} %>				
								  </select>
								</div>
							</div>  
							    						    
							<div class="control-group">
								<label class="control-label" for="selectError">Estado:</label>
								<div class="controls">
								  <select id="cmdEstado" name="cmdEstado" data-rel="chosen" >	  
									<option selected value="0">Todos</option>
									<option value="1">Activo</option>
									<option value="2">Inactivo</option>						
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
			
			
			<form id="frmAlternativo" name="frmAlternativo" method="POST" action="SMVActivo">
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
							  	  <th width="10%">Núm. Serie</th>
								  <th width="25%">Nombre</th>
								  <th width="15%">Proveedor</th>
								  <th width="8%">Monto Compra</th>
								  <th width="8%">Tipo Moneda</th>
								  <th width="20%">Descripción</th>
								  <th>Operación</th>

							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 

						  <%SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy"); 
                          			for(int i=0;
                          			i<resultadosActivo.size();i++){
                             %>
                             	
                            
							 <tr>
					       <% if (((ResultadoActivoBeanData)resultadosActivo.get(i)).getTipoMoneda()==1){
                          		((ResultadoActivoBeanData)resultadosActivo.get(i)).setTipoMonedaLetra("Soles");    }
					       	  if (((ResultadoActivoBeanData)resultadosActivo.get(i)).getTipoMoneda()==2)
         						((ResultadoActivoBeanData)resultadosActivo.get(i)).setTipoMonedaLetra("Dolares");
					         if (((ResultadoActivoBeanData)resultadosActivo.get(i)).getTipoMoneda()==3)
         						((ResultadoActivoBeanData)resultadosActivo.get(i)).setTipoMonedaLetra("Euros"); 
                          	%> 	
                          	
                          	<% if (((ResultadoActivoBeanData)resultadosActivo.get(i)).getIdProveedor()==1){
                          		((ResultadoActivoBeanData)resultadosActivo.get(i)).setProveedorLetra("Kendal Import");    }
					       	  if (((ResultadoActivoBeanData)resultadosActivo.get(i)).getIdProveedor()==2)
         						((ResultadoActivoBeanData)resultadosActivo.get(i)).setProveedorLetra("Atilio Palmieri");
					         if (((ResultadoActivoBeanData)resultadosActivo.get(i)).getIdProveedor()==3)
         						((ResultadoActivoBeanData)resultadosActivo.get(i)).setProveedorLetra("Suiza Lab"); 
                          	%> 	
							
							<td class="center">
                          				<%=
                          						((ResultadoActivoBeanData)resultadosActivo.get(i)).getNumeroSerie()
                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoActivoBeanData)resultadosActivo.get(i)).getNombre()
                          				%>
                          	</td>
                          	
                          	<td class="center">
                          				<%=
                          					((ResultadoActivoBeanData)resultadosActivo.get(i)).getProveedorLetra()
                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoActivoBeanData)resultadosActivo.get(i)).getMontoCompra()
                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoActivoBeanData)resultadosActivo.get(i)).getTipoMonedaLetra()
                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoActivoBeanData)resultadosActivo.get(i)).getDescripcion()
                          				%>
                          	</td>     

                          	        <td class="center">

                          				<a class="btn btn-primary">
												<label class="checkbox inline">
													 <input type="checkbox" name="checkAcciones" id="checkAcciones" value="<%=((ResultadoActivoBeanData)resultadosActivo.get(i)).getCodigo()%>">
													  
													  Seleccionar
												</label>
									   </a>

 
                          			</td> 
                          	
							<%}%>
					       </tbody>
					       </element>
					  </table>       
					     
					</div>
					
				</div><!--/span-->
			
			</div>
			 <td class="center">
                       	<a class="btn btn-primary"
                       		href="javascript:alt_Insertar()">
                       		<i class="icon-plus icon-white"></i>
							Asignar Repuestos
                       	</a>
            </td> 
			</form>
			
			
			<!--/row-->
                 


                
                
         