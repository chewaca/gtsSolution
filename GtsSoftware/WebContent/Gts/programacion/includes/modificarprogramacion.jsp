<%@page import="java.text.SimpleDateFormat"%>
<%-- <%@page import="GtsSoftware.proceso.ResultadoProcesoBeanData"%>--%>
<%@page import="java.util.Vector"%>

<script type="text/javascript">
<!-- Zona de Java Script //-->
function alt_fecha(obj){
	obj.value=obj.value.slice(0,5);
	
}

function alt_submit(){
	var form= document.frmProgramacion;
	//if(validaForm()) form.submit();
	parent.location.reload(true);
	form.submit();
	
	parent.anhadirProgramacion();
}

function alt_cancelar(){
	var form= document.frmCrearProgramacion;
	//if(validaForm()) form.submit();
	form.tipo.value="3";
	form.submit();	
}

</script>
<!--The beans  -->
<jsp:useBean id="resultados" scope="request" class="java.util.Vector"></jsp:useBean>	
<jsp:useBean id="subproceso" scope="session" class="GtsSoftware.subproceso.SubprocesoBeanData"></jsp:useBean>

<div class="row-fluid sortable">
	<!-- Cabecera de formulario -->
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-calendar"></i> RE PROGRAMACIÓN</h2>
           	<div class="box-icon">							
			<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
			</div>                
  		</div>
	
	<!-- Formulario -->
	<div class="box-content">
		<form  name="frmProgramacion" id="frmProgramacion"  method="POST" action="<%= response.encodeURL("SMVProgramacion")%>">
		<input type="hidden" name="accion" value="Agregar"/></input>
		<input type="hidden" name="codigo" value="<%=subproceso.getCodigosubproceso()%>"></input>
		<input type="hidden" name="nombre" value="<%=subproceso.getNombre()%>"></input>
		<input type="hidden" name="tipo" value="2"></input>
		
		 <fieldset>
		 	  <div class="control-group">                        
                 <label class="control-label" for="typeahead6">Nombre Subproceso:</label>
                 <div class="controls">
                      <input type="text"  class="span4 typeahead" id="txtNombreSubproceso" name="txtNombreSubproceso" data-provide="typeahead" disabled value="<%=subproceso.getNombre()%>">
                  </div>
              </div>
		 	 <div class="control-group">
				 <label class="control-label" for="typeahead6">Nombre de Programación: </label>
				 <div class="controls">
				 <input type="text" class="span4 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" maxlength="50" data-items="4" >
				 </div>
			 </div>	

			 
			 <fieldset>
			 <legend>Hora de Ejecución</legend>
			<table>
				<tr>
					<td width="150" align="left" valign="top">
						<label class="control-label" for="typeahead6">Se ejecuta a las (*):  </label>
					</td>
					<td width="100" align="left" valign="top">
						<input class="span16" type="time" name="hora">
					</td>
					<td valign="top">
						<label class="control-label" for="typeahead1">(--:-- 24 hrs) </label>
					</td>
				</tr>
			</table>
				

			 </fieldset>
			 
			 <fieldset>
			 <legend>Duración</legend>
			 <table>
			 	<tr>
			 		<td width="150" align="left" valign="top">
					 	<div class="control-group" id="dvFechaI">
		            	<label class="control-label" for="typeahead4">Fecha de Re Programación (*): </label>
		            	</div>
		            </td>
		            <td width="100" align="left" valign="top">
		            	<div class="controls">
		             		 <input type="text" class="input-small datepicker" id="fcCreacion" name="fcCreacion"  maxlength="10">		           		
		            	</div>
		            </td>
		            <td width="50">
		            </td>
		            <td width="50">
		            </td>
		            <!--  
		            <td width="100" align="left" valign="top">
		           		<div class="control-group" id="dvFechaF">
		          		<label class="control-label" for="typeahead4">Fecha Fin: </label>
		          		</div>
		          	</td>
		            <td width="100" align="left" valign="top">
		          		<div class="controls">
		           		 <input type="text" class="input-small datepicker" id="fcFin" name="fcFin" readonly="readonly" maxlength="10">	
		         		</div>
		         	</td>
		         	-->
	         	</tr>
         	</table>
			</fieldset>
			 <!-- Botones -->
			 <div class="form-actions">
               <button  type="button"  class="btn btn-primary" onclick="javascript:alt_submit()">
                <i class="icon-check icon-white"></i>
                AGREGAR</button>      

             </div>
		 </fieldset>
		</form>
	</div>
		</div>
</div> <!--Fin de formulario-->


