<%@page import="java.text.SimpleDateFormat"%>
<%@page import="GtsSoftware.subproceso.ResultadoSubprocesoBeanData"%>
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
	
	function alt_configurar(cod,nom,des){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Configurar";
		form.nombre.value=nom;
		form.codigo.value=cod;
		form.descripcion.value=des;
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
	function alt_eliminar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Eliminar";
		form.codigo.value=cod;
		form.submit();
	}
	</script>	
	
<!--The beans  -->
<jsp:useBean id="resultados" scope="request" class="java.util.Vector"></jsp:useBean>	
<jsp:useBean id="criterio" scope="request" class="GtsSoftware.subproceso.CriterioSubprocesoBeanData"></jsp:useBean>	


			<!-- content starts -->

			<div class="row-fluid sortable">
				
			<!-- content starts -->
			

<!-- 			<div>
				<ul class="breadcrumb">
					
					<li><a href="/GtsSoftware/Gts/general/index.jsp">Home / </a><a href="/GtsSoftware/Gts/proceso/buscarproceso.jsp">Gestión de Procesos / </a>Buscar Proceso
			           
			              </li>
				</ul>
			</div> -->
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-search"></i>  BUSCAR SUBPROCESO				  </h2>
						
<!--  						<div  align="right">
                               <a class="btn btn-primary" href="/GtsSoftware/Gts/subproceso/agregarsubproceso.jsp"> <i class="icon icon-add icon-white"></i> CREAR SUBPROCESO </a> 
                           </div> -->
                        
                        
				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmCriteriosBusqueda" id="frmCriteriosBusqueda"  method="POST" action="<%= response.encodeURL("SMVSubproceso")%>">
						   <input type="hidden" name="accion" value="Buscar"/></input>
						   <input type="hidden" name="tipo" value="1"></input>
						   <input type="hidden" name="criterio" value=<%=criterio.getNombreproceso()%>/></input>
						  
						  <fieldset>
						  
						  						    
						 <% if (criterio.getNombreproceso()!=null){
                          		Integer valor=1;    }
					       	  if (criterio.getNombreproceso()==null)
         						criterio.setNombreproceso(""); 
                          	%> 
						    <div class="control-group">
						    <br>
						    <div class="control-group">
							    <label class="control-label" for="typeahead6">Nombre Proceso : </label>
							    <div class="controls">
							      <input type="text" class="span6 typeahead" id="txtProceso" name="txtProceso" data-provide="typeahead" data-items="4" value="<%=criterio.getNombreproceso()%>">
						        </div>
						      </div>
						      
						  <% if (criterio.getNombresubproceso()!=null){
                          		Integer valor=1;    }
					       	  if (criterio.getNombresubproceso()==null)
					       		criterio.setNombresubproceso(""); 
                          	%>     

						     <div class="control-group">
							    <label class="control-label" for="typeahead6">Nombre Subproceso : </label>
							    <div class="controls">
							      <input type="text" class="span6 typeahead" id="txtSubproceso" name="txtSubproceso" data-provide="typeahead" data-items="4" value="<%=criterio.getNombresubproceso()%>">
						        </div>
						      </div>
						    
							  <div class="control-group">
							    <label class="control-label" for="typeahead6">Descripción: </label>
							    <div class="controls">
							      <input type="text" class="span6 typeahead" id="txtDescripcion" name="txtDescripcion"  data-provide="typeahead" data-items="4" >
						        </div>
						      </div>
                              

						    </div>
						    <div class="form-actions">
						    <button type="submit" class="btn btn-primary">
						    <i class="icon-search icon-white"></i>
						    Buscar</button>
			              <!-- <button type="button" class="btn" onclick="location.href='../socio/buscarsocio.jsp'">Cancelar</button> -->
						    
							</div>
						  </fieldset>
					  </form>   

				  </div>
				</div><!--/span-->

			</div><!--/row-->

    
					<!-- content ends -->
			</div><!--/span-->

			
			<form id="frmAlternativo" name="frmAlternativo" method="POST" action="<%= response.encodeURL("SMVSubproceso")%>">
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
							  	  <th width="30%">Nombre Subproceso</th>
								  <th>Descripción</th>
								  <th>Orden</th>
								  <th>Estado</th>
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
							 <% if (((ResultadoSubprocesoBeanData)resultados.get(i)).getEstado()==1){
                          		((ResultadoSubprocesoBeanData)resultados.get(i)).setEstadoL("Activo");    }
					       	  if (((ResultadoSubprocesoBeanData)resultados.get(i)).getEstado()==2)
         						((ResultadoSubprocesoBeanData)resultados.get(i)).setEstadoL("Inactivo"); 
                          	%> 	
							 
							 <td class="center">
	                          				<%=
	                          					((ResultadoSubprocesoBeanData)resultados.get(i)).getNombre()
	
	                          				%>
                          	</td>
					        
					        <td class="center">
	                          				<%=
	                          					((ResultadoSubprocesoBeanData)resultados.get(i)).getDescripcion()
	
	                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoSubprocesoBeanData)resultados.get(i)).getOrden()

                          				%>
                          	</td>
                          	
                            <td class="center">
                          			<%=		                          					
                          					((ResultadoSubprocesoBeanData)resultados.get(i)).getEstadoL()
                          			%>
                          	</td>
                          	
                          	        <td class="center">
                          				<a class="btn btn-danger"
                          					href="javascript:alt_consultar(<%=((ResultadoSubprocesoBeanData)resultados.get(i)).getCodigosubproceso()%>)">
                          					<i
                          						class="icon-zoom-in icon-white">
                          					</i>
Visualizar
                          				</a>
                          				<a class="btn btn-danger"
                          					href="javascript:alt_modificar(<%=((ResultadoSubprocesoBeanData)resultados.get(i)).getCodigosubproceso()%>)">
                          					<i
                          						class="icon-pencil icon-white">
                          					</i>
 Modificar
                          				</a>
                          				
                          				 <a class="btn btn-danger"
                          					href="javascript:alt_configurar('<%=((ResultadoSubprocesoBeanData)resultados.get(i)).getCodigosubproceso()%>','<%=((ResultadoSubprocesoBeanData)resultados.get(i)).getNombre()%>','<%=((ResultadoSubprocesoBeanData)resultados.get(i)).getDescripcion()%>')">
                          					<i
                          						class="icon-wrench icon-white">
                          					</i>
 Configurar
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

			<div class="row-fluid sortable"><!--/span--><!--/span-->
			</div><!--/row-->
			
			<div class="row-fluid sortable"><!--/span--><!--/span-->
			
			</div><!--/row-->
			
			<div class="row-fluid sortable"><!--/span-->
			</div><!--/row-->
    
					<!-- content ends -->              
                         