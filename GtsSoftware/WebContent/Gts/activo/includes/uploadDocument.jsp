
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<link href="<sp:url value="/resources/css/popups.css?version=E.1.21"/>">

<link href="<sp:url value="/resources/css/e-popup.css?version=E.1.21"/>">
<script type="text/javascript" src="<sp:url value="/resources/js/jquery/ui/i18n/jquery.ui.datepicker-es.js?version=E.1.21"/>"></script>
<script type="text/javascript" src="<sp:url value="/resources/js/jquery.validate.js?version=E.1.21"/>"></script>

<script type="text/javascript" src="<sp:url value="/resources/js/UploadDocument/control.js?version=E.1.21"/>"></script>
<link href="css/popups.css" rel="stylesheet">

<div class="pop_up">

	<div class="wrapper_2">
		
		<hr color="#D4145A" width="470"/>
		
		<br>
		<div class="header">
			<span class=tRedBold16>Recepción de Documentos </span>
		</div><br>
		<div class="content">
			
			<form action="uploadDocuments.html" enctype="multipart/form-data" target="_self" method="POST">
			
			<div class="reception">
				<div class="transfer"><p>Facilitamos el ingreso de activo.
					Se tendrà la posibilidad de visualizar los
					activos a través del portal mediante esta
					herramienta de recepción de activos.</p>
				</div>
			</div>
			
			<div class="box_2">
				<div class="row_1">
					<!-- <div class="column_a">
						<p>Tipo de Doc.</p>
					</div> -->
					<div class="column_b">
						<!-- <select name="documents"  class="form_1"> -->
<%--   							<option value="<%=Constants.INVOICE_NUMBER%>">Factura</option>
  							<option value="<%=Constants.BOLETA_NUMBER%>">Boleta</option>
  							<option value="<%=Constants.CREDIT_NOTE_NUMBER%>">Nota crédito</option>
  							<option value="<%=Constants.DEBIT_NOTE_NUMBER%>">Nota débito</option> --%>
						<!-- </select> -->
					</div>
				</div>
			</div>
			<div class="box_2">
				<div class="row_1">
					<div class="column_a">
						<p>Carga de archivos</p>
					</div>
					<div class="column_b">
						<input id="fileToLoad" name="fileToLoad" type="file" class="form_1"/><br>
						<span class="stick_2">Solo subir texto plano</span>	
					</div>					
				</div>				
			</div>
			
			<div class="boton_2">
				<input id="btnLoad" type="submit" class="input_2" value="Subir"/>
			</div>

			</form>
		</div>
	</div>
</div>

<c:choose>
	<c:when test="${label=='OK'}">
		<script type="text/javascript">$(document).ready(function(){ dlgSuccess.open(); });</script>
	</c:when>
	<c:when test="${label=='El Documento fue ingresado anteriormente'}">
		<script type="text/javascript">$(document).ready(function(){ dlgError.open(); });</script>
	</c:when>
	<c:when test="${label=='Seleccione un documento'}">
		<script type="text/javascript">$(document).ready(function(){ dlgError.open(); });</script>
	</c:when>
	<c:when test="${label=='Error en el formato del documento'}">
		<script type="text/javascript">$(document).ready(function(){ dlgError.open(); });</script>
	</c:when>	
	<c:otherwise>
	</c:otherwise>
</c:choose>

<div id="dlgSuccess">
	<div class="wrapper_pop_ups">
		<div class="titular"><img align="middle" src="resources/images/landing/efact_logo.png"/></div>
		<div class="titular">Se ha subido correctamente</div>
		<div class="caja">
			<img src="resources/images/popup/icon_check.png" class="icon">
			Haz click en continuar para cerrar la ventana
		</div>
		<div class="caja_boton">
			<div class="boton3">
				<div class="botonAction bRosado" style="margin-left: auto; margin-right: auto;" onclick="dlgSuccess.close();">Continuar</div>
			</div>
		</div>			
	</div>
</div>

<div id="dlgError">
	<div class="wrapper_pop_ups">
		<br>
		<div class="titular"><img align="middle" src="resources/images/landing/efact_logo.png"/></div>
		<div class="titular"><img src="resources/images/popup/icon_error.png" class="icon">Error al subir el documento</div>
		<br>
		<textarea disabled="disabled" rows="4" cols="50" style="resize:none">Motivo: ${label} 
		</textarea> 
		<br/><br/>			
		<div class="caja_boton">
			<div class="boton3">
				<div class="botonAction bRosado" style="margin-left: auto; margin-right: auto;" onclick="dlgError.close();">Continuar</div>
			</div>
		</div>
			
	</div>
</div>

<div class="lastBoder"></div>