<%@page import="java.text.SimpleDateFormat"%>
<%@page import="GtsSoftware.activo.ResultadoActivoBeanData"%>
<%@page import="java.util.Vector"%>

<script>
	function alt_fecha(obj){
	obj.value=obj.value.slice(0,5);
	
	}
	
 	function alt_agregar(){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Agregar";
		form.submit();
	} 
	
	function alt_consultar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Consultar";
		form.codigo.value=cod;
		form.submit();
	}
	
	function alt_dar_de_baja(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="DarDeBaja";
		form.tipo.value="1";
		form.codigo.value=cod;
		form.submit();
	}
	
	function alt_modificar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Modificar";
		form.codigo.value=cod;
		form.submit();
	}
	
	function alt_eliminar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Eliminar";
		form.codigo.value=cod;
		form.submit();
	}
	</script>	
	
<!--The beans  -->
<jsp:useBean id="resultados" scope="request" class="java.util.Vector"></jsp:useBean>	

			<!-- content starts -->

			<div class="row-fluid sortable">
				
			<!-- content starts -->
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-search"></i> BUSCAR ACTIVO</h2>
                        <div  align="right">
                               <a class="btn btn-primary" href="javascript:alt_agregar()"> <i class="icon icon-add icon-white"></i> AGREGAR ACTIVO </a> 
                           </div>             
				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmCriteriosBusqueda" id="frmCriteriosBusqueda"  method="POST" action="<%= response.encodeURL("SMVActivo")%>">
						   <input type="hidden" name="accion" value="Buscar"/></input>
						  <fieldset>
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
						    <div class="form-actions">
						    <button type="submit" class="btn btn-primary">
						    <i class="icon-search icon-white"></i>Buscar</button>
			              <!-- <button type="button" class="btn" onclick="location.href='../socio/buscarsocio.jsp'">Cancelar</button> -->				    
							</div>
						  </fieldset>
					  </form>   
				  </div>
				</div><!--/span-->

			</div><!--/row-->

    
					<!-- content ends -->
			</div><!--/span-->
			
			
			<form id="frmAlternativo" name="frmAlternativo" method="POST" action="SMVActivo">
			 <input type="hidden" name="accion" value="Agregar"></input>
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
                          			i<resultados.size();i++){
                             %>
                             	
                            
							 <tr>
					       <% if (((ResultadoActivoBeanData)resultados.get(i)).getTipoMoneda()==1){
                          		((ResultadoActivoBeanData)resultados.get(i)).setTipoMonedaLetra("Soles");    }
					       	  if (((ResultadoActivoBeanData)resultados.get(i)).getTipoMoneda()==2)
         						((ResultadoActivoBeanData)resultados.get(i)).setTipoMonedaLetra("Dolares");
					         if (((ResultadoActivoBeanData)resultados.get(i)).getTipoMoneda()==3)
         						((ResultadoActivoBeanData)resultados.get(i)).setTipoMonedaLetra("Euros"); 
                          	%> 	
                          	
                          	<% if (((ResultadoActivoBeanData)resultados.get(i)).getIdProveedor()==1){
                          		((ResultadoActivoBeanData)resultados.get(i)).setProveedorLetra("Kendal Import");    }
					       	  if (((ResultadoActivoBeanData)resultados.get(i)).getIdProveedor()==2)
         						((ResultadoActivoBeanData)resultados.get(i)).setProveedorLetra("Atilio Palmieri");
					         if (((ResultadoActivoBeanData)resultados.get(i)).getIdProveedor()==3)
         						((ResultadoActivoBeanData)resultados.get(i)).setProveedorLetra("Suiza Lab"); 
                          	%> 	

                          	 <td class="center">
                          				<%=
                          					((ResultadoActivoBeanData)resultados.get(i)).getNombre()

                          				%>
                          	</td>
                          	
                          	<td class="center">
                          				<%=
                          					((ResultadoActivoBeanData)resultados.get(i)).getProveedorLetra()

                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoActivoBeanData)resultados.get(i)).getMontoCompra()

                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoActivoBeanData)resultados.get(i)).getTipoMonedaLetra()

                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoActivoBeanData)resultados.get(i)).getDescripcion()
                          				%>
                          	</td>    

                          	
                          	        <td class="center">
                          				<button class="btn btn-primary" 
                          					onclick="javascript:alt_consultar(<%=((ResultadoActivoBeanData)resultados.get(i)).getCodigo()%>)" >
                          					<i
                          						class="icon-zoom-in icon-white">
                          					</i>
Visualizar
                          				</button>
                          				
                          				<%
                          				//Si el estado =2 es porque el equipo esta deshabilitado, por eso se deshabilita el boton dar de baja
                          				Integer estado=((ResultadoActivoBeanData)resultados.get(i)).getEstado();
                          				%>
                          				
                          				<button class="btn btn-primary" <% if (estado==2) %> disabled <% %>
                          					onclick="javascript:alt_dar_de_baja(<%=((ResultadoActivoBeanData)resultados.get(i)).getCodigo()%>)">
                          					<i
                          						class="icon-trash icon-white">
                          					</i>
 Dar de baja
                          				</button>
                          				
 
                          			</td> 
                          	
							<%}%>
					       </tbody>
					       </element>
					  </table>            
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
                </form> 

			<div class="row-fluid sortable"><!--/span--><!--/span-->
			</div><!--/row-->
			
			<div class="row-fluid sortable"><!--/span--><!--/span-->
			
			</div><!--/row-->
			
			<div class="row-fluid sortable"><!--/span-->
			</div><!--/row-->
    
					<!-- content ends -->