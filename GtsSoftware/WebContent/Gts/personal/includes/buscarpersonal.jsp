<%@page import="java.text.SimpleDateFormat"%>
<%@page import="GtsSoftware.personal.PersonalData"%>
<%@page import="java.util.Vector"%>
<%@page import="GtsSoftware.personal.AreaData"%>
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
		form.accion.value="Buscar";
		form.tipo.value=2;
		form.codigo.value=cod;
		form.submit();
	}
	function alt_crearusuario(cod,codUsuario){
		var form=document.getElementById("frmAlternativo");
		form.action =  form.acc.value;
		if(codUsuario==0) form.accion.value="Agregar";
		if(codUsuario!=0) form.accion.value="Modificar";
		form.tipo.value=3;
		form.codigo.value=cod;
		form.codigoUsuario.value=codUsuario;
		form.submit();
	}
	function alt_modificar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Modificar";
		form.tipo.value=2;
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
<jsp:useBean id="ocultar" scope="request" class="java.lang.String"></jsp:useBean>	
<jsp:useBean id="codigoPersonal" scope="request" class="java.lang.String"></jsp:useBean>	
<jsp:useBean id="nombrePersonal" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="apPaterno" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="apMaterno" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="codigoArea" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="estado" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="criterio" scope="request" class="GtsSoftware.usuario.CriterioRolBeanData"></jsp:useBean>	
<jsp:useBean id="cmbArea" scope="session" class="java.util.Vector"></jsp:useBean>	

			<!-- content starts -->

			<div class="row-fluid sortable">
				
			<!-- content starts -->
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-search"></i>  BUSCAR PERSONAL				  </h2>						
						<div  align="right">
                               <a class="btn btn-primary" href="/GtsSoftware/Gts/personal/agregarpersonal.jsp"> <i class="icon icon-add icon-white"></i> CREAR PERSONAL </a> 
                         	   <%if(ocultar.equals("1")){ %> <a href="#" class="btn btn-minimize btn-round btn-default" ><i class="icon icon-chevron-down"></i></a> <% } 
                         	   else {%><a href="#" class="btn btn-minimize btn-round btn-default" ><i class="icon icon-chevron-up"></i></a> <%} %>
                         	   
                          </div>                      
				  </div>
					<div class="box-content" <%if(ocultar.equals("1")){ %> hidden <% } %>>
						<form class="form-horizontal" name="frmCriteriosBusqueda" id="frmCriteriosBusqueda"  method="POST" action="<%= response.encodeURL("SMVPersonal")%>">
						   <input type="hidden" name="accion" value="Buscar"/></input>
						   <input type="hidden" name="tipo" value="1"></input>
						   
						  <fieldset> 						  
						   
						   <span style="display:inline-block"> 
						    <div class="control-group">
							    <label class="control-label" for="typeahead6">ID Personal : </label>
							    <div class="controls">
							      <input type="text" class="span3 typeahead" id="txtCodigo" name="txtCodigo" data-provide="typeahead" data-items="4" value=<%=codigoPersonal%> >
						        </div>
						      </div>
						       

						     <div class="control-group">
							    <label class="control-label" for="typeahead6">Nombres : </label>
							    <div class="controls">
							      <input type="text" class="span10 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" data-items="4" value=<%=nombrePersonal%>>
						        </div>
						     </div>
						     <div class="control-group">
							    <label class="control-label" for="typeahead6">Apellido Paterno : </label>
							    <div class="controls">
							      <input type="text" class="span10 typeahead" id="txtApPaterno" name="txtApPaterno" data-provide="typeahead" data-items="4" value=<%=apPaterno%>>
						        </div>
						     </div>
						     <div class="control-group">
							    <label class="control-label" for="typeahead6">Apellido Materno : </label>
							    <div class="controls">
							      <input type="text" class="span10 typeahead" id="txtApMaterno" name="txtApMaterno" data-provide="typeahead" data-items="4" value=<%=apMaterno%>>
						        </div>
						     </div>
						     </span>
						     <%if(codigoArea.equals("")) {codigoArea="0";} 
						       if(estado.equals("")) {estado="1";} 
						     %>
						     <span style="display:inline-block"> 
						     <div class="control-group">
								<label class="control-label" for="selectError">Departamento:</label>
								<div class="controls">
								  <select id="cmbxArea" name="cmbxArea" data-rel="chosen" >	
								  <%for(int i=0;i<cmbArea.size();i++){
		                            	 %>
									<option  value= <%=((AreaData)cmbArea.get(i)).getCodigo()%>  <%if(((AreaData)cmbArea.get(i)).getCodigo()==Integer.parseInt(codigoArea)) { %> selected <%} %>>
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
									<option value="1" <%if(estado.equals("1")){ %> selected <% }%>>Activo</option>
									<option value="0" <%if(estado.equals("0")){ %> selected <% }%>>Inactivo</option>						
								  </select>
								</div>
							  </div>
						    </span>
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

		<%if(ocultar.equals("1")){ %> 	
			<form id="frmAlternativo" name="frmAlternativo" method="POST" action="<%= response.encodeURL("SMVPersonal")%>">
			 <input type="hidden" name="accion" value="Agregar"></input>
			 <input type="hidden" name="codigo" value=""></input>
			  <input type="hidden" name="codigoUsuario" value=""></input>
			 <input type="hidden" name="nombre" value=""></input>
			 <input type="hidden" name="descripcion" value=""></input>
			 <input type="hidden" name="tipo" value="1"></input>
			  <input type="hidden" name ="acc" value = "<%= response.encodeURL(request.getContextPath()+"/Gts/usuario/SMVUsuario")%>"></input>

			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2>RESULTADOS</h2>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">

						  <thead>
							  <tr>
							  	  <th width="5%">ID Personal</th>							  
								  <th width="10%">Ap. Paterno</th>
								  <th width="10%">Ap. Materno</th>
								  <th width="10%">Nombres</th>
								  <th width="10%">Departamento</th>
								  <th width="10%">Username</th>
								  
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
							 <% if (((PersonalData)resultados.get(i)).getEstado()==1){
                          		((PersonalData)resultados.get(i)).setEstado2("Activo");    }
					       	  if (((PersonalData)resultados.get(i)).getEstado()==0)
         						((PersonalData)resultados.get(i)).setEstado2("Inactivo"); 
                          	%> 	
							 <% if (((PersonalData)resultados.get(i)).getEstado()==1){
                          		((PersonalData)resultados.get(i)).setBoton("Desactivar");    }
					       	  if (((PersonalData)resultados.get(i)).getEstado()==0)
         						((PersonalData)resultados.get(i)).setBoton("Activar"); 
                          	%>  
							 <td class="center">
	                          				<%=
	                          					((PersonalData)resultados.get(i)).getCodigo()
	
	                          				%>
                          	</td>
					        
					        <td class="center"  onclick="javascript:alt_consultar(<%=((PersonalData)resultados.get(i)).getCodigo()%>)">
	                          				<%=
	                          					((PersonalData)resultados.get(i)).getApPaterno()
	
	                          				%>
                          	</td>
                          	 <td class="center" onclick="javascript:alt_consultar(<%=((PersonalData)resultados.get(i)).getCodigo()%>)">
	                          				<%=
	                          					((PersonalData)resultados.get(i)).getApMaterno()
	
	                          				%>
                          	</td>
                          	<td class="center" onclick="javascript:alt_consultar(<%=((PersonalData)resultados.get(i)).getCodigo()%>)">
	                          				<%=
	                          					((PersonalData)resultados.get(i)).getNombre()
	
	                          				%>
                          	</td>
                          	  <td class="center" onclick="javascript:alt_consultar(<%=((PersonalData)resultados.get(i)).getCodigo()%>)">
                          			<%=		                          					
                          					((PersonalData)resultados.get(i)).getNombreArea()
                          			%>
                          	</td>
                          	<td class="center" data-rel="tooltip" <%if(((PersonalData)resultados.get(i)).getCodigoUsuario()==0) 
                          	{ %> title= "Hacer click para Crear Usuario" <% } else { %>title= "Hacer click para Modificar Usuario" <%}%>
                          	style=" color:blue;text-decoration: underline;"
                          	onclick="javascript:alt_crearusuario(<%=((PersonalData)resultados.get(i)).getCodigo()%>,<%=((PersonalData)resultados.get(i)).getCodigoUsuario()%>)">
                          			<%=		                          					
                          					((PersonalData)resultados.get(i)).getUsername()
                          			%>
                          	</td>
                            <td class="center" onclick="javascript:alt_consultar(<%=((PersonalData)resultados.get(i)).getCodigo()%>)">
                          			<%=		                          					
                          					((PersonalData)resultados.get(i)).getEstado2()
                          			%>
                          	</td>
                          	
                          	        <td class="center">
                          				<a class="btn btn-danger"
                          					href="javascript:alt_consultar(<%=((PersonalData)resultados.get(i)).getCodigo()%>)">
                          					<i
                          						class="icon-zoom-in icon-white">
                          					</i>
Visualizar
                          				</a>
                          				<a class="btn btn-danger"
                          					href="javascript:alt_modificar(<%=((PersonalData)resultados.get(i)).getCodigo()%>)">
                          					<i
                          						class="icon-pencil icon-white">
                          					</i>
 Modificar
                          				</a>
                          				
                          				 <a class="btn btn-danger"
                          					href="javascript:alt_estado(<%=((PersonalData)resultados.get(i)).getCodigo()%>,<%=((PersonalData)resultados.get(i)).getEstado()%>)">
                          					<i
                          						class="icon-off icon-white">
                          					</i>
									<%=		                          					
                          					((PersonalData)resultados.get(i)).getBoton()
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
<%}%>
			<div class="row-fluid sortable"><!--/span--><!--/span-->
			</div><!--/row-->
			
			<div class="row-fluid sortable"><!--/span--><!--/span-->
			
			</div><!--/row-->
			
			<div class="row-fluid sortable"><!--/span-->
			</div><!--/row-->
    
					<!-- content ends -->              
                         