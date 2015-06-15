<%@page import="java.text.SimpleDateFormat"%>
<%@page import="GtsSoftware.personal.CursoData"%>
<%@page import="GtsSoftware.personal.AreaData"%>
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
	
	function alt_configurar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Configurar";
		form.codigo.value=cod;
		form.submit();
	}
	function alt_consultar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="ModificarRol";
		form.tipo.value=3;
		form.codigo.value=cod;
		form.submit();
	}
	function alt_modificar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="ModificarRol";
		form.codigo.value=cod;
		form.submit();
	}
	function alt_estado(cod,estado){
		var form=document.getElementById("frmAlternativo");
		if(estado==1)
		{
			if(confirm("¿Seguro que desea desactivar el rol?"))
			{
				form.accion.value="EstadoRol";
				form.codigo.value=cod;
				form.submit();
			}
		}
		else
		{
			if(confirm("¿Seguro que desea activar el rol?"))
			{
				form.accion.value="EstadoRol";
				form.codigo.value=cod;
				form.submit();
			}	
		}
		return 0;
	}
	</script>	
	
<!--The beans  -->
<jsp:useBean id="resultados" scope="request" class="java.util.Vector"></jsp:useBean>	
<jsp:useBean id="cmbArea" scope="session" class="java.util.Vector"></jsp:useBean>	
<jsp:useBean id="criterio" scope="request" class="GtsSoftware.personal.CursoData"></jsp:useBean>	


			<!-- content starts -->

			<div class="row-fluid sortable">
				
			<!-- content starts -->
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-search"></i>  BUSCAR CURSO			  </h2>						
						<div  align="right">
                               <a class="btn btn-primary" href="/GtsSoftware/Gts/curso/agregarcurso.jsp"> <i class="icon icon-add icon-white"></i> CREAR CURSO </a> 
                        <a href="#" class="btn btn-minimize btn-round btn-default" ><i class="icon icon-chevron-up"></i></a>
                          </div>                      
				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmCriteriosBusqueda" id="frmCriteriosBusqueda"  method="POST" action="<%= response.encodeURL("SMVPersonal")%>">
						   <input type="hidden" name="accion" value="BuscarCurso"/></input>
						   <input type="hidden" name="tipo" value="1"></input>
						  <fieldset>
						  
						  						  
						    <div class="control-group">
						    <br>
						    <div class="control-group">
							    <label class="control-label" for="typeahead6">ID Curso : </label>
							    <div class="controls">
							      <input type="text" class="span1 typeahead" id="txtCodigo" name="txtCodigo" data-provide="typeahead" data-items="4" >
						        </div>
						      </div>
						       

						     <div class="control-group">
							    <label class="control-label" for="typeahead6">Nombre Curso : </label>
							    <div class="controls">
							      <input type="text" class="span3 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" data-items="4" >
						        </div>
						     </div>
						     <div class="control-group">
								<label class="control-label" for="selectError">Departamento:</label>
								<div class="controls">
								  <select id="cmbxArea" name="cmbxArea" data-rel="chosen" >	
								  <%for(int i=0;i<cmbArea.size();i++){
		                            	 %>
									<option <%if(((AreaData)cmbArea.get(i)).getCodigo()==criterio.getCodigo()) {%> selected <%} %> value= <%=((AreaData)cmbArea.get(i)).getCodigo()%> >
										<%=
										((AreaData)cmbArea.get(i)).getNombre()
										%>
									</option>
									<%}%>				
								  </select>
								</div>
							  </div>
						    <div class="control-group">
								<label class="control-label" for="selectError">Estado:</label>
								<div class="controls">
								  <select id="cmbEstado" name="cmbEstado" data-rel="chosen" >	  
									<option value="1">Activo</option>
									<option value="0">Inactivo</option>						
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

			
			<form id="frmAlternativo" name="frmAlternativo" method="POST" action="<%= response.encodeURL("SMVPersonal")%>">
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
							  	  <th width="5%">ID Curso</th>
								  <th width="8%">Curso</th>
								  <th width="20%">Descripción</th>
								  <th width="10%">Departamento</th>
								  <th width="5%">Estado</th>
								  <th width="25%">Opciones</th>
							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 


						  <%SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy"); 
                          	for(int i=0;
                          			i<resultados.size();i++){
                             %>
                             	
                            
							 <tr>
							 <% if (((CursoData)resultados.get(i)).getEstado()==1){
                          		((CursoData)resultados.get(i)).setEstado2("Activo");    }
					       	  if (((CursoData)resultados.get(i)).getEstado()==0)
         						((CursoData)resultados.get(i)).setEstado2("Inactivo"); 
                          	%> 	
							 <% if (((CursoData)resultados.get(i)).getEstado()==1){
                          		((CursoData)resultados.get(i)).setBoton("Desactivar");    }
					       	  if (((CursoData)resultados.get(i)).getEstado()==0)
         						((CursoData)resultados.get(i)).setBoton("Activar"); 
                          	%>  
							 <td class="center"  onclick="javascript:alt_consultar(<%=((CursoData)resultados.get(i)).getCodigo()%>)">
	                          				<%=
	                          					((CursoData)resultados.get(i)).getCodigo()
	
	                          				%>
                          	</td>
					        
					        <td class="center"  onclick="javascript:alt_consultar(<%=((CursoData)resultados.get(i)).getCodigo()%>)">
	                          				<%=
	                          					((CursoData)resultados.get(i)).getNombre()
	
	                          				%>
                          	</td>
                          	 <td class="center"  onclick="javascript:alt_consultar(<%=((CursoData)resultados.get(i)).getCodigo()%>)">
	                          				<%=
	                          					((CursoData)resultados.get(i)).getDescripcion()
	
	                          				%>
                          	</td>
                          	 <td class="center"  onclick="javascript:alt_consultar(<%=((CursoData)resultados.get(i)).getCodigo()%>)">
	                          				<%=
	                          					((CursoData)resultados.get(i)).getNombreArea()
	
	                          				%>
                          	</td>
                            <td class="center"  onclick="javascript:alt_consultar(<%=((CursoData)resultados.get(i)).getCodigo()%>)">
                          			<%=		                          					
                          					((CursoData)resultados.get(i)).getEstado2()
                          			%>
                          	</td>
                          	
                          	        <td class="center">
                          				<a class="btn btn-danger"
                          					href="javascript:alt_consultar(<%=((CursoData)resultados.get(i)).getCodigo()%>)">
                          					<i
                          						class="icon-zoom-in icon-white">
                          					</i>
Visualizar
                          				</a>
                          				<a class="btn btn-danger"
                          					href="javascript:alt_modificar(<%=((CursoData)resultados.get(i)).getCodigo()%>)">
                          					<i
                          						class="icon-pencil icon-white">
                          					</i>
 Modificar
                          				</a>
                          				
                          				 <a class="btn btn-danger"
                          					href="javascript:alt_estado(<%=((CursoData)resultados.get(i)).getCodigo()%>,<%=((CursoData)resultados.get(i)).getEstado()%>)">
                          					<i
                          						class="icon-off icon-white">
                          					</i>
									<%=		                          					
                          					((CursoData)resultados.get(i)).getBoton()
                          			%>
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
                         