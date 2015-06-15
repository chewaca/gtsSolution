<%@page import="java.text.SimpleDateFormat"%>
<%@page import="GtsSoftware.actividad.ResultadoActividadBeanData"%>
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
	
	function alt_modificar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Modificar";
		form.codigo.value=cod;
		form.submit();
	}
	
 	function alt_agregar_subproceso(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="AgregarSubproceso";
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
						<h2><i class="icon-search"></i> BUSCAR ACTIVIDAD</h2>
                        <div  align="right">
                               <a class="btn btn-primary" href="javascript:alt_agregar()"> <i class="icon icon-add icon-white"></i> AGREGAR ACTIVIDAD </a> 
                           </div>             
				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmCriteriosBusqueda" id="frmCriteriosBusqueda"  method="POST" action="<%= response.encodeURL("SMVActividad")%>">
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
								<label class="control-label" for="selectError">Estado:</label>
								<div class="controls">
								  <select id="cmdTipoDocumento" name="cmdEstado" data-rel="chosen" >	  
									<option value="Activo">Activo</option>
									<option value="Inactivo">Inactivo</option>						
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
			
			
			<form id="frmAlternativo" name="frmAlternativo" method="POST" action="SMVActividad">
			 <input type="hidden" name="accion" value="Agregar"></input>
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
								  <th width="30%">Nombre</th>
								  <th>Descripción</th>
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
<%-- 					       <% if (((ResultadoActividadBeanData)resultados.get(i)).getEstado()==1){
                          		((ResultadoActividadBeanData)resultados.get(i)).setEstado2("Activo");    }
					       	  if (((ResultadoActividadBeanData)resultados.get(i)).getEstado()==2)
         						((ResultadoActividadBeanData)resultados.get(i)).setEstado2("Inactivo"); 
                          	%> 	 --%>
					        

                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoActividadBeanData)resultados.get(i)).getNombre()

                          				%>
                          	</td>
                          	 <td class="center">
                          				<%=
                          					((ResultadoActividadBeanData)resultados.get(i)).getDescripcion()
                          				%>
                          	</td>    

                          	
                          	        <td class="center">
                          				<a class="btn btn-primary"
                          					href="javascript:alt_consultar(<%=((ResultadoActividadBeanData)resultados.get(i)).getCodigo()%>)">
                          					<i
                          						class="icon-zoom-in icon-white">
                          					</i>
Visualizar
                          				</a>
                          				<a class="btn btn-primary"
                          					href="javascript:alt_modificar(<%=((ResultadoActividadBeanData)resultados.get(i)).getCodigo()%>)">
                          					<i
                          						class="icon-pencil icon-white">
                          					</i>
 Modificar
                          				</a>
                          				
                     <!--     				
                          				<a class="btn btn-danger"
                          					href="javascript:alt_agregar_subproceso(<%=((ResultadoActividadBeanData)resultados.get(i)).getCodigo()%>)">
                          					<i
                          						class="icon-plus icon-white">
                          					</i>
Agregar Subproceso
                          				</a>
 
                          			</td>-->  
                          	
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