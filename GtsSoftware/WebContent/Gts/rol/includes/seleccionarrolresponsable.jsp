<%@page import="java.text.SimpleDateFormat"%>
<%@page import="GtsSoftware.usuario.ResultadoRolData"%>
<%@page import="java.util.Vector"%>

<script>
	function alt_fecha(obj){
	obj.value=obj.value.slice(0,5);
	
	}
	
	function alt_seleccionar_responsable(cod,nombre){
		parent.anhadirRolResponsable(cod,nombre);
	}
	</script>	
	
<!--The beans  -->
<jsp:useBean id="resultados" scope="request" class="java.util.Vector"></jsp:useBean>	
<jsp:useBean id="criterio" scope="request" class="GtsSoftware.usuario.CriterioRolBeanData"></jsp:useBean>	


			<!-- content starts -->

			<div class="row-fluid sortable">
				
			<!-- content starts -->
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-search"></i> BUSCAR ROL RESPONSABLE</h2>						                     
				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmCriteriosBusqueda" id="frmCriteriosBusqueda"  method="POST" action="<%= response.encodeURL("SMVUsuario")%>">
						   <input type="hidden" name="accion" value="BuscarRol"/></input>
						   <input type="hidden" name="tipo" value="3"></input>
						  <fieldset>
						  
						  						  
						    <div class="control-group">
						    <br>
						    <div class="control-group">
							    <label class="control-label" for="typeahead6">ID Rol : </label>
							    <div class="controls">
							      <input type="text" class="span1 typeahead" id="txtCodigo" name="txtCodigo" data-provide="typeahead" data-items="4" >
						        </div>
						      </div>
						       

						     <div class="control-group">
							    <label class="control-label" for="typeahead7">Nombre Rol : </label>
							    <div class="controls">
							      <input type="text" class="span3 typeahead" id="txtRol" name="txtRol" data-provide="typeahead" data-items="4" >
						        </div>
						     </div>
						    <div class="control-group">
								<label class="control-label" for="selectError">Estado:</label>
								<div class="controls">
								  <select id="cmdEstado" name="cmdEstado" data-rel="chosen" >	  
									<option value="Activo">Activo</option>
									<option value="Inactivo">Inactivo</option>						
								  </select>
								</div>
							  </div>

						    </div>
						    <div class="form-actions">
						    <button type="submit" class="btn btn-primary">
						    <i class="icon-search icon-white"></i>
						    Buscar</button>
							</div>
						  </fieldset>
					  </form>   

				  </div>
				</div><!--/span-->

			</div><!--/row-->

    
					<!-- content ends -->
			</div><!--/span-->

			
			<form id="frmAlternativo" name="frmAlternativo" method="POST" action="<%= response.encodeURL("SMVUsuario")%>">
			 <input type="hidden" name="accion" value="Agregar"></input>
			 <input type="hidden" name="codigo" value=""></input>
			 <input type="hidden" name="nombre" value=""></input>
			 <input type="hidden" name="descripcion" value=""></input>
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
							  	  <th width="5%">ID Rol</th>
								  <th width="10%">Rol</th>
								  <th width="50%">Descripción</th>
								  <th width="10%">Estado</th>
								  <th>Opciones</th>
							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 


						  <%SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy"); 
                          	for(int i=0;
                          			i<resultados.size();i++){
                             %>
                             	
                            
							 <tr>
							 <% if (((ResultadoRolData)resultados.get(i)).getEstado()==1){
                          		((ResultadoRolData)resultados.get(i)).setEstado2("Activo");    }
					       	  if (((ResultadoRolData)resultados.get(i)).getEstado()==0)
         						((ResultadoRolData)resultados.get(i)).setEstado2("Inactivo"); 
                          	%> 	
							 <% if (((ResultadoRolData)resultados.get(i)).getEstado()==1){
                          		((ResultadoRolData)resultados.get(i)).setBoton("Desactivar");    }
					       	  if (((ResultadoRolData)resultados.get(i)).getEstado()==0)
         						((ResultadoRolData)resultados.get(i)).setBoton("Activar"); 
                          	%>  
							 <td class="center"  onclick="javascript:alt_consultar(<%=((ResultadoRolData)resultados.get(i)).getCodigo()%>)">
	                          				<%=
	                          					((ResultadoRolData)resultados.get(i)).getCodigo()
	
	                          				%>
                          	</td>
					        
					        <td class="center"  onclick="javascript:alt_consultar(<%=((ResultadoRolData)resultados.get(i)).getCodigo()%>)">
	                          				<%=
	                          					((ResultadoRolData)resultados.get(i)).getNombre()
	
	                          				%>
                          	</td>
                          	 <td class="center"  onclick="javascript:alt_consultar(<%=((ResultadoRolData)resultados.get(i)).getCodigo()%>)">
	                          				<%=
	                          					((ResultadoRolData)resultados.get(i)).getDescripcion()
	
	                          				%>
                          	</td>
                            <td class="center"  onclick="javascript:alt_consultar(<%=((ResultadoRolData)resultados.get(i)).getCodigo()%>)">
                          			<%=		                          					
                          					((ResultadoRolData)resultados.get(i)).getEstado2()
                          			%>
                          	</td>
                          	
                          	        <td class="center">

                          				<a class="btn btn-primary"
                          					href="javascript:alt_seleccionar_responsable('<%=((ResultadoRolData)resultados.get(i)).getCodigo()%>','<%=((ResultadoRolData)resultados.get(i)).getNombre()%>')">
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
			
			</div><!--/row-->
                </form>                                                   


    
					<!-- content ends -->              
                         