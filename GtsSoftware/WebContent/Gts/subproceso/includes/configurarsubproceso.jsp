			<!-- content starts -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>			
			
		<script>

		function alt_fecha(obj){
		obj.value=obj.value.slice(0,5);
		}
		
		function alt_agregar(){
			var form=document.getElementById("frmAlternativo");
			form.accion.value="Agregar";
			form.submit();
		}
		function alt_programar(){
			var form=document.getElementById("frmAlternativo");
			form.accion.value="Programar";
			form.submit();
		}
		
		function alt_seleccionar(){
			var form=document.getElementById("frmSeleccionar");
			form.accion.value="Seleccionar";
			//form.tipo.value="2";
			form.submit();
		}
		
		function alt_submit(){
		var form= document.frmAlternativo;
		//if(validaForm()) form.submit();
		form.submit();
		}
		
	</script>	
	
	<!--The beans  -->
	<jsp:useBean id="subproceso" scope="session" class="GtsSoftware.subproceso.SubprocesoBeanData"></jsp:useBean>
	<jsp:useBean id="programacion" scope="request" class="GtsSoftware.programacion.ProgramacionBeanData"></jsp:useBean>					

<!-- 			<div>
				<ul class="breadcrumb">
					<li><a href="/Conan3000V2/IngSoft/general/index.jsp">Home / </a>
					<a href="/Conan3000V2/IngSoft/ventas/socio/buscarsocio.jsp">Gestión de Procesos  / </a>Modificar Proceso
			           
			              </li>
				</ul>
			</div> -->
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-wrench"> </i>&nbsp;CONFIGURAR SUBPROCESO				  </h2>
				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmAlternativo" id="frmAlternativo" method="Post" action="<%= response.encodeURL("SMVSubproceso")%>">
						  <input type="hidden" name="codigo" value="<%=subproceso.getCodigosubprocesopadre()%>"></input>
						  <input type="hidden" name="nombre" value="<%=subproceso.getNombre()%>"></input>
						  <input type="hidden" name="descripcion" value="<%=subproceso.getDescripcion()%>"></input>
			       		  <input type="hidden" name="accion" value="Agregar"></input>
			       		  <input type="hidden" name="programacion" value="<%=programacion.getCodigo()%>"></input>
					      <input type="hidden" name="tipo" value="1"></input>
											  
						  <fieldset>
						  	
						  	<div class="control-group">
						  	<br>
						      <label class="control-label" for="typeahead7">Nombre : </label>
						      
						      <div class="controls">
						       <input type="text" class="span6 typeahead" id="txtNombreSocio"  data-provide="typeahead"  name="txtNombre" value="<%=subproceso.getNombre()%>" disabled>
					          </div>
					        </div>
					       
					        <div class="control-group">
						  
						      <label class="control-label" for="typeahead7">Descripción : </label>
						      
						      <div class="controls">
						      <textarea id="txtDescripcion" name="txtDescripcion" rows="3" cols="1000" style="resize:none; height: 74px; width: 273px" disabled><%=subproceso.getNombre()%></textarea>
					          </div>
					        </div>			    

						    <div class="form-actions">						        

<!-- 			            <p>
							<button class="btn btn-danger" onclick="location.href='agregarsubproceso.jsp'">
							<i class="icon-plus icon-white"></i>
							Asignar Subproceso</button> &nbsp; &nbsp; &nbsp; &nbsp;
							
							<button class="btn btn-danger">
							<i class="icon-calendar icon-white"></i>
							Programar Calendario</button> &nbsp; &nbsp; &nbsp; &nbsp;
							
							<button type="reset" class="btn" onclick="location.href='buscarsubproceso.jsp'">
			              	<i class="icon-circle-arrow-left icon-black"></i>
			              	Regresar</button>
						</p> -->
						
						  
					  

						
						<td class="center">
                          				<a class="btn btn-danger"
                          					href="javascript:alt_agregar()">
                          					<i class="icon-plus icon-white"></i>
											Asignar Subproceso
                          				</a>
                          				&nbsp;&nbsp;&nbsp;&nbsp;
                          				<a class="btn btn-danger"
                          					href="javascript:alt_programar()">
                          					<i class="icon-calendar icon-white"></i>
											Programar Calendario
                          				</a>
                          				&nbsp;&nbsp;&nbsp;&nbsp;
                          				<a class="btn btn-danger iframe"
                          					href="../actividad/seleccionaractividad.jsp">
                          					<i class="icon-list icon-white"></i>
											Asignar Actividades
                          				</a>
                          				&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn" onclick="location.href='buscarsubproceso.jsp'">
			              	<i class="icon-circle-arrow-left icon-black"></i>
			              	Regresar</button>
 
                          			</td>
						    							 
							</div>
						 </fieldset>
					  </form>
		
				  </div>
				</div><!--/span-->

    
			<!-- content ends -->
