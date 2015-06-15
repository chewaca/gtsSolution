<%@page import="java.text.SimpleDateFormat"%>
<%-- <%@page import="GtsSoftware.proceso.ResultadoProcesoBeanData"%>--%>
<%@page import="java.util.Vector"%>

<script type="text/javascript">
<!-- Zona de Java Script //-->
function alt_fecha(obj){
	obj.value=obj.value.slice(0,5);
	
}
function alt_submit(){
	var form= document.frmCrearProgramacion;
	//if(validaForm()) form.submit();
	form.submit();	
}

</script>
<!--The beans  -->
<jsp:useBean id="resultados" scope="request" class="java.util.Vector"></jsp:useBean>	

<div class="row-fluid sortable">
	<!-- Cabecera de formulario -->
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-calendar"></i> CREAR PROGRAMACIÓN</h2>
           	<div class="box-icon">							
			<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
			</div>                
  		</div>
	
	<!-- Formulario -->
	<div class="box-content">
		<form  name="frmCrearProgramacion" id="frmCrearProgramacion"  method="POST" action="<%= response.encodeURL("SMVProgramacion")%>">
		<input type="hidden" name="accion" value="Agregar"/></input>
		<input type="hidden" name="tipo" value="2"></input>
		 <fieldset>
		 	 <div class="control-group">
				 <label class="control-label" for="typeahead6">Nombre: </label>
				 <div class="controls">
				 <input type="text" class="span4 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" maxlength="50" data-items="4" >
				 </div>
			 </div>	
			 <fieldset>
			 <legend>Frecuencia</legend>
			 	<table>
			 		<tr > 
			 			<td width="100" align="left" valign="top">
			 				<label class="control-label" for="typeahead6">Ocurrencia: </label>
						</td>
			 			<td width="100" align="left" valign="top">
							<div class="controls">
						  		<select class="span24" data-placeholder="Seleccione" name="cmbOcurrencia" id="cmbOcurrencia" name="cmbOcurrencia"  data-rel="chosen">
									<option value=""></option>
									<option Value="1">Anual</option>
									<option Value="2">Mensual</option>
									<option Value="3">Semanal</option>
								</select>
						 	</div>
			 			</td>
			 		</tr>
			 		<tr>
			 			<td width="100" align="left" valign="top">
							<label class="control-label" for="typeahead6">Se repite cada:  </label>
						</td>
			 			<td width="100" align="left" valign="top">
				            	<input class="span6" type="number" name="txtNroOcurr" id="txtNroOcurr" min="1" max="20" step="1" value="1" >
			 			</td>
			 		</tr>
			 	</table>
				<table>
					<tr>
						<td width="100" align="left" valign="top">
			 				<label class="checkbox-inline"> <input type="checkbox" id="chboxFecha" name="chboxFecha" value="1">Lunes</label>
			 			</td>
			 			<td width="100" align="left" valign="top">
			 				<label class="checkbox-inline" > <input type="checkbox" id="chboxFecha" name="chboxFecha" value="2" >Martes</label>
			 			</td>
			 			<td width="100" align="left" valign="top">
			 				<label class="checkbox-inline"> <input type="checkbox" id="chboxFecha" name="chboxFecha" value="3">Miércoles</label>
			 			</td>
			 			<td width="100" align="left" valign="top">
			 				<label class="checkbox-inline"> <input type="checkbox" id="chboxFecha" name="chboxFecha" value="4">Jueves</label>
			 			</td>
			 		</tr>
			 		<tr>
			 			<td width="100" align="left" valign="top">
			 			<label class="checkbox-inline"> <input type="checkbox" id="chboxFecha" name="chboxFecha" value="5">Viernes</label>
			 			</td>
			 			<td width="100" align="left" valign="top">
			 			<label class="checkbox-inline"> <input type="checkbox" id="chboxFecha" name="chboxFecha" value="6">Sábado</label>
			 			</td>
			 			<td width="100" align="left" valign="top">
			 			<label class="checkbox-inline"> <input type="checkbox" id="chboxFecha" name="chboxFecha" value="7">Domingo</label>
			 			</td>			 		
			 		</tr>
				</table>
			 </fieldset>
			 
			 <fieldset>
			 <legend>Hora de Ejecución</legend>
			<table>
				<tr>
					<td width="100" align="left" valign="top">
						<label class="control-label" for="typeahead6">Se ejecuta a las:  </label>
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
		            	<label class="control-label" for="typeahead4">Fecha Creación(*): </label>
		            	</div>
		            </td>
		            <td width="100" align="left" valign="top">
		            	<div class="controls">
		             		 <input type="text" class="input-small datepicker" id="fcCreacion" name="fcCreacion" readonly="readonly" maxlength="10">		           		
		            	</div>
		            </td>
		            <td width="50">
		            </td>
		            <td>
		            	<label class="radio-inline">
		                    <input type="radio" name="inlineRadioOptions2" id="inlineRadio3" value="option1"> Tiene fin
		                </label>
		                <label class="radio-inline">
		                    <input type="radio" name="inlineRadioOptions2" id="inlineRadio4" value="option2"> No tiene fin
		                </label>
		            </td>
		            <td width="50">
		            </td>
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
	         	</tr>
         	</table>
			</fieldset>
			 <!-- Botones -->
			 <div class="form-actions">
               <button  type="button"  class="btn btn-primary" onclick="javascript:alt_submit()">Agregar</button>      
        	   <button  type="button"  class="btn" onclick="location.href='../programacion/buscarprogramacion.jsp'">Cancelar</button>  
             </div>
		 </fieldset>
		</form>
	</div>
		</div>
</div> <!--Fin de formulario-->


