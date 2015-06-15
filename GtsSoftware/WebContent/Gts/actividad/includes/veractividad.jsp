<%@page import="java.text.SimpleDateFormat"%>
 <%@page import="GtsSoftware.actividad.ResultadoActividadBeanData"%> 
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
		var texto=new Array(elementos.length);
		for (x=0;x<elementos.length;x++)
		    texto[x] =  elementos[x].value;
		parent.anhadir(texto);
	}
	</script>	
	
<!--The beans  -->
<jsp:useBean id="resultadosA" scope="session" class="java.util.Vector"></jsp:useBean>
	
			<!-- content starts -->

			<div class="row-fluid sortable">
				
			<!-- content starts -->
			

			
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-search"></i>  BUSCAR ACTIVIDAD				  </h2>
                        <div class="box-icon">
							
						</div>
                        
                        
				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmCriteriosBusqueda" id="frmCriteriosBusqueda"  method="POST" action="<%= response.encodeURL("SMVActividad")%>">
						   <input type="hidden" name="accion" value="Seleccionar"/></input>
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
			
			
			<form id="frmAlternativo" name="frmAlternativo" method="POST" action="SMVActividad">
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
								  <th width="30%">Nombre</th>
								  <th>Descripción</th>
								  <th>Operación</th>

							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 


						  <%SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy"); 
                          			for(int i=0;
                          			i<resultadosA.size();i++){
                             %>
                             	
                            
							 <tr>
<%-- 					       <% if (((ResultadoActividadBeanData)resultados.get(i)).getEstado()==1){
                          		((ResultadoActividadBeanData)resultados.get(i)).setEstado2("Activo");    }
					       	  if (((ResultadoActividadBeanData)resultados.get(i)).getEstado()==2)
         						((ResultadoActividadBeanData)resultados.get(i)).setEstado2("Inactivo"); 
                          	%> 	 --%>
					        

                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoActividadBeanData)resultadosA.get(i)).getNombre()

                          				%>
                          	</td>
                          	 <td class="center">
                          				<%=
                          					((ResultadoActividadBeanData)resultadosA.get(i)).getDescripcion()
                          				%>
                          	</td>    

                          	
                          	        <td class="center">
                          				<a class="btn btn-danger"
                          					href="javascript:alt_consultar(<%=((ResultadoActividadBeanData)resultadosA.get(i)).getCodigo()%>)">
                          					<i
                          						class="icon-zoom-in icon-white">
                          					</i>
Visualizar
                          				</a>
                          				<a class="btn btn-danger"
                          					href="javascript:alt_modificar(<%=((ResultadoActividadBeanData)resultadosA.get(i)).getCodigo()%>)">
                          					<i
                          						class="icon-pencil icon-white">
                          					</i>
 Modificar
                          				</a>
                          				
                          				
                          				<!--  poner los resultados a variables hidden y sacarlas =D, con arregle creo k falla u.u -->
                          				<a class="btn btn-danger">
												<label class="checkbox inline">
													 <input type="checkbox" name="checkAcciones" id="checkAcciones" value="<%=((ResultadoActividadBeanData)resultadosA.get(i)).getCodigo()%>">Seleccionar
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
			</form>
			
			
			<td class="center">
                       	<a class="btn btn-danger"
                       		href="javascript:alt_Insertar()">
                       		<i class="icon-plus icon-white"></i>
							Asignar Actividades
                       	</a>
            </td>
			
			<!--/row-->
                </form> 

			<div class="row-fluid sortable"><!--/span--><!--/span-->
			</div><!--/row-->
			
			<div class="row-fluid sortable"><!--/span--><!--/span-->
			
			</div><!--/row-->
			
			<div class="row-fluid sortable"><!--/span-->
			</div><!--/row-->
                
                
         