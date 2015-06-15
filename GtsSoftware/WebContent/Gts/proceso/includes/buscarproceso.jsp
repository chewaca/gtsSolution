<%@page import="java.text.SimpleDateFormat"%>
<%@page import="GtsSoftware.proceso.ResultadoProcesoBeanData"%>
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
<jsp:useBean id="esconder" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="resultados" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="criterio" scope="request" class="GtsSoftware.proceso.CriterioProcesoBeanData"></jsp:useBean>	
				
			<!-- content starts -->
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-search"></i> BUSCAR PROCESO</h2>
                        <div  align="right">
                           <a class="btn btn-primary" href="/GtsSoftware/Gts/proceso/agregarproceso.jsp"> <i class="icon icon-add icon-white"></i> AGREGAR PROCESO </a> 
                        	<a href="#" class="btn btn-minimize btn-round" ><i class="icon icon-chevron-up"></i></a>	
                        </div>             
				  </div>
				  
				  <% if(esconder.equals("ACTIVO")){%>
					<div class="box-content" hidden="">
				  <%}else{ %>
				  <div class="box-content">
				  <%} %>
						<form class="form-horizontal2" name="frmCriteriosBusqueda" id="frmCriteriosBusqueda"  method="POST" action="<%= response.encodeURL("SMVProceso")%>">
						   <input type="hidden" name="accion" value="Buscar"/></input>
						  <fieldset>
						  
						  <% if (criterio.getNombreextra()!=null){
                          		Integer valor=1;    }
					       	  if (criterio.getNombreextra()==null)
         						criterio.setNombreextra(""); 
                          	%>
						  
						    <div class="control-group">						    
						     <div class="control-group">
							    <label class="control-label" for="typeahead6">Nombre: </label>
							    <div class="controls">
							      <input type="text" class="span4 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" data-items="4" value="<%=criterio.getNombreextra()%>">
						        </div>
						      </div>
						      
						      <% if (criterio.getDescripcionextra()!=null){
                          		Integer valor=1;    }
					       	  if (criterio.getDescripcionextra()==null)
					       		criterio.setDescripcionextra(""); 
                          	%>
						      						    
							  <div class="control-group">
							    <label class="control-label" for="typeahead6">Descripción: </label>
							    <div class="controls">
							      <input type="text" class="span4 typeahead" id="txtDescripcion" name="txtDescripcion"  data-provide="typeahead" data-items="4" value="<%=criterio.getDescripcionextra()%>">
						        </div>
						      </div>
						      
							  <div class="control-group">
								<label class="control-label" for="selectError" >Estado:</label>
								<div class="controls">
								  <select id="cmdEstado" name="cmdEstado" data-rel="chosen" style="width: 100px;">	  
									<option value="0">Todos</option>
									<option value="1">Activo</option>
									<option value="2">Inactivo</option>						
								  </select>
								</div>
							  </div>
						    </div>
						    
						    <div class="form-actions">
						    <button type="submit" class="btn btn-primary">
						    <i class="icon-search icon-white"></i>Buscar</button>
			             
							</div>
						  </fieldset>
					  </form>   
				  </div>
				</div><!--/span-->
			</div><!--/span-->
			
			<form id="frmAlternativo" name="frmAlternativo" method="POST" action="SMVProceso">
			 <input type="hidden" name="accion" value="Agregar"></input>
			 <input type="hidden" name="codigo" value=""></input>
			 <input type="hidden" name="tipo" value="1"></input>
			  

			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-align-justify"></i> RESULTADOS</h2>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">

						  <thead>
							  <tr>
							  	  <th width="5%">N°</th>
								  <th width="25%">Nombre</th>
								  <th width="33%">Descripción</th>
								  <th width="8%">Estado</th>
								  <th>Operación</th>
							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 


						  <% for(int i=0;i<resultados.size();i++){
                             %>                             	
                            
							 <tr>
					       <% if (((ResultadoProcesoBeanData)resultados.get(i)).getEstado()==1){
                          		((ResultadoProcesoBeanData)resultados.get(i)).setEstado2("Activo");    }
					       	  if (((ResultadoProcesoBeanData)resultados.get(i)).getEstado()==2)
         						((ResultadoProcesoBeanData)resultados.get(i)).setEstado2("Inactivo"); 
                          	%> 	
					        
					        <td class="center">
	                          				<%=i+1%>
                          	</td>
					        
					        <td class="center">
	                          				<%=((ResultadoProcesoBeanData)resultados.get(i)).getNombre()%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%= ((ResultadoProcesoBeanData)resultados.get(i)).getDescripcion()%>
                          	</td>
                          	
                            <td class="center">
                          			<%= ((ResultadoProcesoBeanData)resultados.get(i)).getEstado2()%>
                          	</td>
                          	
                        	        <td class="center">
<%--                         				<a class="btn btn-danger"
                        					href="javascript:alt_consultar(<%=((ResultadoProcesoBeanData)resultados.get(i)).getCodigo()%>)">
                        					<i class="icon-zoom-in icon-white"></i>Visualizar
                        				</a> --%>
                        				<a class="btn btn-primary"
                        					href="javascript:alt_modificar(<%=((ResultadoProcesoBeanData)resultados.get(i)).getCodigo()%>)">
                        					<i class="icon-pencil icon-white"></i> Configurar
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
               
                
         