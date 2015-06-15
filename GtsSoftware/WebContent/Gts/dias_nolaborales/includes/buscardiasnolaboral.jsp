<%@page import="java.text.SimpleDateFormat"%>
<%@page import="GtsSoftware.personal.diasnolaboralData"%>
<%@page import="java.util.Vector"%>

<script>

function alt_submit(){
	if(confirm("¿Seguro que desea agregar un nuevo Día no laborable?"))
	{
		var form= document.frmCriteriosBusqueda;
		form.submit();	
	}
	return 0;
}
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
		form.accion.value="AgregarDiaNoLaboral";
		form.tipo.value=2 ;
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
<jsp:useBean id="dias_nolaboral" scope="session" class="java.util.Vector"></jsp:useBean>	
<jsp:useBean id="criterio" scope="request" class="GtsSoftware.usuario.CriterioRolBeanData"></jsp:useBean>	


			<!-- content starts -->

			<div class="row-fluid sortable">
				
			<!-- content starts -->
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon icon-add icon-black"></i>    AGREGAR DÍA NO LABORAL				  </h2>						
						<div  align="right">
       							<a href="#" class="btn btn-minimize btn-round btn-default" ><i class="icon icon-chevron-down"></i></a>
                         </div>                      
				  </div>
					<div class="box-content" hidden>
						<form class="form-horizontal" name="frmCriteriosBusqueda" id="frmCriteriosBusqueda"  method="POST" action="<%= response.encodeURL("SMVPersonal")%>">
						   <input type="hidden" name="accion" value="AgregarDiaNoLaboral"/></input>
						   <input type="hidden" name="tipo" value="1"></input>
						   
						  <fieldset>
						  
						  						  
						    <div class="control-group">
						    <br>
						       
						     <div class="control-group">
							    <label class="control-label" for="typeahead6">Nombre : </label>
							    <div class="controls">
							      <input type="text" class="span3 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" data-items="4"  required >
						        </div>
						     </div>
						    <div class="control-group" id="dvFechaI">
		            			<label class="control-label" for="typeahead4">Fecha: </label>
		            		 
				            	<div class="controls">
				             		 <input type="text" class="input-small datepicker" id="fecha" name="fecha" maxlength="10" required>		           		
				            	</div>
			            	  </div>
						      <div class="control-group">  
                                  <label class="control-label" for="typeahead4">Motivo: </label>
                                  <div class="controls">                   
                                      <textarea id="txtMotivo" name="txtMotivo" rows="3" cols="1000" style="resize:none; height: 74px; width: 273px" required></textarea>
                                  </div>
                              </div>

						    </div>
						    <div class="form-actions">
						    <button type="submit" class="btn btn-primary" onclick="javascript:alt_submit()">
						    <i class="icon icon-add icon-white"></i>
						    Agregar</button>
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
			  <input type="hidden" name="codigoUsuario" value=""></input>
			 <input type="hidden" name="nombre" value=""></input>
			 <input type="hidden" name="descripcion" value=""></input>
			 <input type="hidden" name="tipo" value="1"></input>
			  <input type="hidden" name ="acc" value = "<%= response.encodeURL(request.getContextPath()+"/Gts/usuario/SMVUsuario")%>"></input>

			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2>DÍAS NO LABORALES REGISTRADOS</h2>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">

						  <thead>
							  <tr>
							  	  <th width="5%">ID</th>							  
								  <th width="10%">Nombre</th>
								  <th width="10%">Fecha</th>
								  <th width="50%">Motivo</th>
								  <th>Opciones</th>
							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 


						  <%SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy"); 
                          	for(int i=0;
                          			i<dias_nolaboral.size();i++){
                             %>
                             	
							 <tr>
							 <td class="center">
	                          				<%=
	                          					((diasnolaboralData)dias_nolaboral.get(i)).getCodigo()
	
	                          				%>
                          	</td>
					        
                          	<td class="center" >
	                          				<%=
	                          					((diasnolaboralData)dias_nolaboral.get(i)).getNombre()
	
	                          				%>
                          	</td>
                          	<td class="center">
	                          				<%=
	                          				  df.format(((diasnolaboralData)dias_nolaboral.get(i)).getFecha())
	                          			     %>
	                       	</td>   		
                          	<td class="center">
	                          				<%=
	                          					((diasnolaboralData)dias_nolaboral.get(i)).getMotivo()
	
	                          				%>
                          	</td>                          	
                   	        <td class="center">

                   				<a class="btn btn-danger"
                   					href="javascript:alt_modificar(<%=((diasnolaboralData)dias_nolaboral.get(i)).getCodigo()%>)">
                      					<i
                      						class="icon-trash icon-white">
                      					</i>
Eliminar
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
                         