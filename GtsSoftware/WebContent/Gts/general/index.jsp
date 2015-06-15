<%@page import="java.util.Date"%>
<%@page import="GtsSoftware.proveedor.ProveedorBeanData"%>
<%@page import="GtsSoftware.marca.MarcaBeanData"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="GtsSoftware.personal.ResultadoPersonalBeanData"%>
<%@page import="GtsSoftware.local.LocalBeanData"%>
<%@page import="GtsSoftware.personal.PersonalBeanData"%>
<%@page import="GtsSoftware.programacion.ProgramacionHistoricoBeanData"%>
<%@page import="GtsSoftware.activo.ResultadoActivoBeanData"%>
<%@page import="GtsSoftware.programacion.ResultadoProgramacionBeanData"%>

<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Inicio</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="GTS Solution">
	<meta name="author" content="Los manos">
	<!--The beans  -->
	<jsp:useBean id="casosDeUso" scope="request" class="java.util.Vector"></jsp:useBean>
	<!-- The styles -->
	<link id="bs-css" href="css/bootstrap-united.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href="css/bootstrap-responsive.css" rel="stylesheet">
	<link href="css/charisma-app.css" rel="stylesheet">
	<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='css/fullcalendar.css' rel='stylesheet'>
	<link href='css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='css/chosen.css' rel='stylesheet'>
	<link href='css/uniform.default.css' rel='stylesheet'>
	<link href='css/colorbox.css' rel='stylesheet'>
	<link href='css/jquery.cleditor.css' rel='stylesheet'>
	<link href='css/jquery.noty.css' rel='stylesheet'>
	<link href='css/noty_theme_default.css' rel='stylesheet'>
	<link href='css/elfinder.min.css' rel='stylesheet'>
	<link href='css/elfinder.theme.css' rel='stylesheet'>
	<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
	
	<link href='css/uploadify.css' rel='stylesheet'>

	<!-- The GTS icon -->
	<link rel="shortcut icon" href="img/LogoGTS2.png">
	<link id="bs-css" href="css/bootstrap-united.css" rel="stylesheet">
	<link href='css/opa-icons.css' rel='stylesheet'>
</head>

<script type="text/javascript">
	
	function alt_programacion_pendiente(){
		var form=document.getElementById("frmProgramacion");
		form.accion.value="ProgramacionPendiente";
		form.tipo.value="1";
		form.submit();	
	}
	
	function alt_programacion_ejecucion(){
		var form=document.getElementById("frmProgramacion");
		form.accion.value="ProgramacionEjecucion";
		form.tipo.value="1";
		form.submit();		
	}
	
	function alt_programacion_ejecutada(){
		var form=document.getElementById("frmProgramacion");
		form.accion.value="ProgramacionEjecutada";
		form.tipo.value="1";
		form.submit();	
	}
	
	
	function alt_programacion_no_ejecutada(){
		var form=document.getElementById("frmProgramacion");
		form.accion.value="ProgramacionNoEjecutada";
		form.tipo.value="1";
		form.submit();	
	}
	
	function alt_ver_activos(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="VerActivosIndex";
		form.codigoProgramacionActivo.value=cod;
		form.tipo.value="2";
		form.submit();
	}
	
	
	function alt_ver_ejecuciones(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="VerEjecuciones";
		form.codigoProgramacionEjecutada.value=cod;
		form.tipo.value="4";
		form.submit();
	}
	
	
	function alt_aceptar_orden(){
		var form=document.getElementById("frmOrden");
		form.accion.value="AceptarOrden";
		form.tipo.value="2";
		form.submit();
	}
	
	
	function alt_proveedor(cod){
		var form=document.getElementById("frmActivo");
		form.accion.value="VerProveedor";
		form.idProveedor.value=cod;
		form.tipo.value="5";
		form.submit();
	}
	
	
	function alt_activo(cod){
		var form=document.getElementById("frmEjecutada");
		form.accion.value="VerActivo";
		form.idActivo.value=cod;
		form.tipo.value="6";
		form.submit();
	}
	
	
	function alt_codigo_activo(cod){
		var form= document.frmActivo;
		form.codigoActivo.value=cod;
	}
	
	function alt_reprogramar(cod){
		var form= document.frmAlternativo;
		form.accion.value="Reprogramar";
		form.codigoProgramacion.value=cod;
		form.submit();
	}
	
	function alt_grabar_reprogramar(cod){
		var form=document.getElementById("frmProgramacionAux");
		form.accion.value="Reprogramar";
		form.tipo.value="8";
		form.submit();
	}
	
	
	
	function alt_finalizarEjecucion(cod,nomb){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="AceptarSolicitud";
		form.codigoProgramacion.value=cod;
		form.nombreDocumento.value="FinalizarEjecucion";
		form.tipo.value="3";
		form.submit();
	}
	function alt_aceptar_solicitud(cod,nomb){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="AceptarSolicitud";
		form.codigoProgramacion.value=cod;
		form.nombreDocumento.value=nomb;
		form.tipo.value="2";
		form.submit();
	}
	
	
	function alt_orden_trabajo(cod){
		var form=document.getElementById("frmActivo");
		form.accion.value="OrdenTrabajo";
		form.codigoActivo.value=cod;
		form.tipo.value="3";
		form.submit();
	}
	
	function anhadirPersonalMantenimiento(cod, name){
		var form= document.frmOrden;
		form.idPersonalMantenimiento.value=cod;
		form.txtNombrePersonalM.value=name;
		$.fn.colorbox.close();
	} 
	
	function anhadirRepuesto(vectorRepuesto){
		var form=document.getElementById("frmActivo");
		form.accion.value="AgregarRepuesto";
		form.vectorRepuestos.value=vectorRepuesto;
		form.submit();

		$.fn.colorbox.close();
	}
	
	function anhadirPersonalAutorizo(cod, name){
		var form= document.frmOrden;
		form.idPersonalAutorizo.value=cod;
		form.txtNombrePersonalA.value=name;
		$.fn.colorbox.close();
	}
	
	function anhadirProveedor(cod, name){
		var form= document.frmOrden;
		form.idProveedor.value=cod;
		form.txtProveedor.value=name;
		$.fn.colorbox.close();
	}
	
	
</script>

<jsp:useBean id="localData" scope="request" class="GtsSoftware.local.LocalBeanData"></jsp:useBean>
<jsp:useBean id="activo" scope="request" class="GtsSoftware.activo.ActivoBeanData"></jsp:useBean>
<jsp:useBean id="tipoMoneda" scope="request" class="GtsSoftware.tipomoneda.TipoMonedaBeanData"></jsp:useBean>
<jsp:useBean id="proveedor" scope="request" class="GtsSoftware.proveedor.ProveedorBeanData"></jsp:useBean>
<jsp:useBean id="tipoActivo" scope="request" class="GtsSoftware.activo.TipoActivoBeanData"></jsp:useBean>
<jsp:useBean id="proveedorData" scope="request" class="GtsSoftware.proveedor.ProveedorBeanData"></jsp:useBean>
<jsp:useBean id="subprocesoData" scope="request" class="GtsSoftware.subproceso.SubprocesoBeanData"></jsp:useBean>
<jsp:useBean id="programacion" scope="session" class="GtsSoftware.programacion.ProgramacionBeanData"></jsp:useBean>

<jsp:useBean id="resultadosLocalesActivo" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="avancesData" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosHistorico" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosMarcas" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosProveedores" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="programacionData" scope="session" class="GtsSoftware.programacion.ProgramacionBeanData"></jsp:useBean>
<jsp:useBean id="resultadosLocales" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosPersonalResponsable" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosPersonalEjecutor" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosEjecutado" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosActivos" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosProg" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="tipo" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="codigoProgra" scope="session" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="codigoActi" scope="session" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="estado" scope="session" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="estadoDescripcion" scope="session" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="cantidadNoEjecutado" scope="session" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="cantidadEjecutada" scope="session" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="cantidadPendiente" scope="session" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="cantidadEjecutando" scope="session" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="user" scope="session" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="esconder" scope="request" class="java.lang.String"></jsp:useBean>

<%!
	
	public String formatear(java.util.Date date){
		SimpleDateFormat DF= new SimpleDateFormat("dd/MM/yyyy");
		return DF.format(date);
	}
%>


<body>	
		<jsp:include page="/Gts/general/jsexternal.jsp" />
		<script type="text/javascript" src="js/apprise-1.5.full.js"></script>
		<script>
			$(document).ready(function(){
				//Examples of how to assign the Colorbox event to elements
				
				$(".iframe").colorbox({iframe:true, width:"80%", height:"80%"});
				
				//Example of preserving a JavaScript event for inline calls.
				$("#click").click(function(){ 
					$('#click').css({"background-color":"#f00", "color":"#fff", "cursor":"inherit"}).text("Open this window again and this message will still be here.");
					return false;
				});
			});
		</script>
		<link rel="stylesheet" href="css/apprise.css" type="text/css" />
		<script type="text/javascript" src="js/script.js"></script>
		
		<jsp:include page="superior.jsp" />
			
		<div class="container-fluid">
		<div class="row-fluid">
				
			<!-- left menu starts -->
			<jsp:include page="leftmenu3.jsp" >
				<jsp:param name="casosDeUso" value="<%=casosDeUso %>" />
			</jsp:include>
						<!-- left menu ends -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">¡Advertencia!</h4>
					<p>Necesitas tener <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> activado para usar este sitio.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">
			<!-- content starts -->			

			<div>
				<ul class="breadcrumb">
					<li>
						<a href="#">Principal</a>
					</li>				
				</ul>
			</div>
			
			<form class="form-horizontal" name="frmProgramacion" id="frmProgramacion"  method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/programacion/SMVProgramacion")%>">
			<input type="hidden" name="accion" value=""/></input>
			<input type="hidden" name="tipo" value=""/></input>
			
			<div class="sortable row-fluid">
				<a data-rel="tooltip" title="Programaciones pendientes" class="well span3 top-block" href="javascript:alt_programacion_pendiente()">
					<span class="icon32 icon-blue icon-calendar"></span>
					<div>Pendientes</div>
					<div><%=cantidadPendiente%></div>
					<span class="notification blue"><%=cantidadPendiente%></span>
				</a>

				<a data-rel="tooltip" title="Programaciones en ejecución" class="well span3 top-block" href="javascript:alt_programacion_ejecucion()">
					<span class="icon32 icon-orange icon-globe"></span>
					<div>En ejecución</div>
					<div><%=cantidadEjecutando%></div>
					<span class="notification yellow"><%=cantidadEjecutando%></span>
				</a>

				<a data-rel="tooltip" title="Programaciones ejecutadas" class="well span3 top-block" href="javascript:alt_programacion_ejecutada()">
					<span class="icon32 icon-color icon-check"></span>
					<div>Ejecutados</div>
					<div><%=cantidadEjecutada%></div>
					<span class="notification green"><%=cantidadEjecutada%></span>
				</a>
				
				<a data-rel="tooltip" title="Programaciones pendientes de ejecución" class="well span3 top-block" href="javascript:alt_programacion_no_ejecutada()">
					<span class="icon32 icon-red icon-envelope-closed"></span>
					<div>No Ejecutados</div>
					<div><%=cantidadNoEjecutado%></div>
					<span class="notification red"><%=cantidadNoEjecutado%></span>
				</a>
			</div>
			</form>
			
		 	<% if(tipo.equals("1")||tipo.equals("2")||tipo.equals("3")||tipo.equals("5")||tipo.equals("7")||tipo.equals("6")||tipo.equals("8")){%> 

      		<form id="frmAlternativo" name="frmAlternativo" method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/programacion/SMVProgramacion")%>">
			 <input type="hidden" name="accion" value="Agregar"></input>
			 <input type="hidden" name="codigoProgramacionActivo" value=""></input>
			 <input type="hidden" name="codigoProgramacionEjecutada" value=""></input>
			 <input type="hidden" name="codigoProgramacion" value=""></input>
			 <input type="hidden" name="nombreDocumento" value=""></input>
			 <input type="hidden" name="tipo" value=""></input>
			  
			<%String nombreDocumento=null; %>
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-align-justify"></i> <%=estadoDescripcion%></h2>
						<div  align="right"> 
                                <a href="#" class="btn btn-minimize btn-round" ><i class="icon icon-chevron-up"></i></a>
                           </div>
					</div>
					
					
	<% if(esconder.equals("ACTIVO")){%>
	<div class="box-content" hidden="">

	<%}else{ %>
	<div class="box-content">
	<%} %>
						<table class="table table-striped table-bordered bootstrap-datatable datatable">

						  <thead>
							  <tr>
							  	  <th width="4%%">ID</th>
								  <th width="16%">Nombre Programación</th>
								  <th width="4%%">ID Proceso</th>
								  <th width="16%">Nombre Proceso</th>
								  <th width="4%%">Orden</th>
								  <th width="16%">Nombre Subproceso</th>
								  <th width="8%">Ocurrencia</th>
								  <!--  <%if(estado.equals("1") || estado.equals("4") ){ %>
								  <th width="11%">Fecha Inicio</th>
								  <th width="11%">Fecha Fin</th>
								  <%} %>-->
								  <%if(estado.equals("3")){ %>
								  <th width="11%">Fecha Inicio Ejecución</th>
								  <th width="11%">Fecha Fin Ejecución</th>
								  <%} %>
								  <%if(estado.equals("4")){ %>
								  <th width="11%">Fecha que debío ejecutarse</th> 
								  <%} else if(estado.equals("1")) {%>
								  <th width="11%">Próx. Fecha Ejecución</th>
								  <%} else if(estado.equals("2")){%>
								  <th width="11%">Fecha Inicio Ejecución</th>
								  <%} %>
								  <%if(estado.equals("4")){ %>
								  <th width="4%">Días retrasados</th> 
								  <%} else if(estado.equals("1")) {%>
								  <th width="4%" >Días restantes</th>
								  <%} else if(estado.equals("2")||estado.equals("4")){ %>
								  <th width="4%" >Días pasados</th>
								  <%} else {%>
								  <th width="4%" >Duración (días)</th>
								  <%} %>
								  <%if(estado.equals("2")){ %>
								  <th width="4%">Tiempo Estimado</th> 
								  <th width="4%">Rol Ejecutor</th> 
								  <%} %>
								  <%if(estado.equals("1")||estado.equals("4")){ %>
								  <th width="8%">Rol Responsable</th> 
								  <%} %>
								  <%if(estado.equals("3")){ %>
								  <th width="10%">Usuario Ejecutor</th> 
								  <%} %>
								  <th width="20%">Operación</th>
				  				  <%if(estado.equals("2")){ %>
								  <th width="25%">Avance</th> 
								  <%} %>
							  </tr>
						  </thead>  
				  
						  <element>
					      <tbody id="resultadobusqueda"> 


						  <%SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy");
                          	for(int i=0;i<resultadosProg.size();i++){
                             %>
                       
							 <tr>
					       <% if (((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==1){
                          		((ResultadoProgramacionBeanData)resultadosProg.get(i)).setEstado2("Pendiente");
                          		nombreDocumento="Ejecutar";}
					       	  if (((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==2){
         						((ResultadoProgramacionBeanData)resultadosProg.get(i)).setEstado2("En Ejecución");
         						nombreDocumento="Aceptar Orden";};
					       	 if (((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==3){
	         						((ResultadoProgramacionBeanData)resultadosProg.get(i)).setEstado2("Ejecutado");}
					       	  if (((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==4){
                          		((ResultadoProgramacionBeanData)resultadosProg.get(i)).setEstado2("Pendiente");
                          		nombreDocumento="Ejecutar";}
                          	%> 	
                          	
                          	 <% if (((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdOcurrencia()==1){
                          		((ResultadoProgramacionBeanData)resultadosProg.get(i)).setIdOcurrencia2("Anual");    }
					       	  if (((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdOcurrencia()==2)
         						((ResultadoProgramacionBeanData)resultadosProg.get(i)).setIdOcurrencia2("Mensual");
					       	if (((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdOcurrencia()==3)
         						((ResultadoProgramacionBeanData)resultadosProg.get(i)).setIdOcurrencia2("Semanal");
					    	if (((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdOcurrencia()==4)
         						((ResultadoProgramacionBeanData)resultadosProg.get(i)).setIdOcurrencia2("Única Vez");
                          	%> 
					        
							<td class="center">
                          				<%=((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdProgramacion()%>
                          	</td>
                          	
                          	 <td class="center">
                          	 	<a class="" href="javascript:alt_agregarBotones()">
                          	 	<input type="hidden" name="codigoActividadActivo" value="<%=((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdProgramacion()%>"></input>
                          				<%=
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getDescripcion()

                          				%>
                          				
                          		</a>
                          	</td>
                          	 <td class="center">
                          				<%=
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdProceso()
                          				%>
                          	</td>  
                          	 <td class="center">
                          	 <a class="" href="../proceso/gantt.jsp">
                          				<%=
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getNombProceso()
                          				%>
                          				</a>
                          	</td>  
                          	 <td class="center">
                          				<%=
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getOrden()
                          				%>
                          	</td>  
                          	 <td class="center" >
                          				<%=
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getNombSubproceso()
                          				%>
                          	</td>  
                          	 <td class="center">
                          				<%=
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdOcurrencia2()
                          				%>
                          	</td>   
                          	<%if(estado.equals("3")){ %>  
                          	 <td class="center">
                          				<%=
                          						df.format(((ResultadoProgramacionBeanData)resultadosProg.get(i)).getFechaInicio())
                          				%>
                          	</td> 
                          	 <td class="center">
                          				<%=
                          						df.format(((ResultadoProgramacionBeanData)resultadosProg.get(i)).getFechaFin())
                          				%>
                          	</td>  
                          	<%} %>
                          	<%if(!estado.equals("3")){ %>  
                          	 <td class="center"  style="color:blue;">
                          				<%=
                          						df.format(((ResultadoProgramacionBeanData)resultadosProg.get(i)).getFechaEjecucion())
                          				%>
                          	</td>            
                          	<%} %>               	                      	
                            <td class="center">
                          				<%=
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getDiasRestante()
                          				%>
                          	</td>    
                          	<%if(estado.equals("2")){ %>  
                          	<td class="center">
                          				<%=
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getTiempoEstimado()
                          				%>
                          	</td>   
           					<td class="center">
                          				<%=
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getNombreRolEjecutor()
                          				%>
                          	</td>
                          	<%} %>  
                          	<%if(estado.equals("1")||estado.equals("4")){ %>  
                          	<td class="center">
                          				<%=
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getNombreRolEjecutor()
                          				%>
                          	</td>   
           
                          	<%} %> 
                          	<%if(estado.equals("3")){ %>  
                          	<td class="center">
                          				<%=
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getUsuarioEjecutor()
                          				%>
                          	</td>          
                          	<%} %>       	
                          	        <td class="center">
                          	       <% if(((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()!=3){%> 
                            			<a class="btn btn-primary" title="Ver Activos" data-rel="tooltip"
                          					href="javascript:alt_ver_activos(<%= ((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdProgramacion()%>)">
                          					<i class="icon-zoom-in icon-white"></i>
 Activos
                          				</a>
                          			<%}%>                        	        
                          	        <% //Estado 1 es pendiente, por eso no se muestra Solicitud OTM ni OTM 
                          	        if(((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==1||((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==4){%>
                          				<a class="btn btn-primary" title="<%=nombreDocumento%>" data-rel="tooltip"
                          					href="javascript:alt_aceptar_solicitud('<%=((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdProgramacion()%>' , '<%=nombreDocumento%>')">
                          				
										<i class="icon-ok icon-white"></i>
<%=nombreDocumento%>
                          				</a>
                          			<%}%>
                          			
                          			<% //Estado 2 esta en ejecución, por eso no se muestra Solicitud OTM ni OTM 
                          	        if(((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==2){%>
                          				<a class="btn btn-primary" title="Terminar Ejecución" data-rel="tooltip"
                          					href="javascript:alt_finalizarEjecucion('<%=((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdProgramacion()%>' , '<%=nombreDocumento%>')">
                          				
										<i class="icon-ok icon-white"></i>
Terminar Ejecución
                          				</a>
                          			<%}%>
                          			
                          			<% //Estado 4 es No Ejecutado, por eso se tiene la opción de reprogramar
                          	        if(((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==4){%>
                          				                          					
                          				<a class="btn btn-primary" onclick="javascript:alt_reprogramar('<%=((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdProgramacion()%>')" title="Realizar reprogramación" data-rel="tooltip">
										<i class="icon-calendar icon-white"></i>
Reprogramar
                          				</a>
                          			<%}%>

<% //SOLO CUANDO SE HAYA TERMINADO DE EJECUTAR UNA PROGRAMACIÓN, SE MOSTRARÁ SUS EJECUCIONES
	if(((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==3){%>
                          				<a class="btn btn-primary"
                          					href="javascript:alt_ver_ejecuciones(<%= ((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdProgramacion()%>)">
                          					<i class="icon-pencil icon-white"></i>
Ver Detalle
                          				</a>	

<%}%>
                          		</td>
                          		
                          		<% //Estado 2 es En ejecución, por eso se tiene la opción de reprogramar
                          	        if(((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==2){%>
                          		 <td class="center">
                          		 
                          				<div class="progress progress-warning progress-striped active" style="margin-bottom: 9px;">
											<div class="bar" style="width: <%=avancesData.get(i)%>%"><%=avancesData.get(i)%>%</div>
										</div>
										
                          		</td> 
                     			<%}%>                      		
                         		
                          		
                          		</tr>
							<%}%>
				       </tbody>
					       </element>
					  </table>            
					
					</div>
				</div><!--/span-->
		
			</div><!--/row-->
</div>
                </form> 

			
			<% }%>
			
			
			
			<!-- PARA VER A LOS ACTIVOS RELACIONADOS -->
			<% if(tipo.equals("2") || tipo.equals("3")|| tipo.equals("5")){%> 
			
      		<form class="form-horizontal" id="frmActivo" name="frmActivo" method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/programacion/SMVProgramacion")%>">
			 <input type="hidden" name="accion" value="Agregar"></input>
			 <input type="hidden" name="vectorActividades" value=""></input>
			 <input type="hidden" name="vectorActivos" value=""></input>
			 <input type="hidden" name="vectorRepuestos" value=""></input>
			 <input type="hidden" name="idProgramacion" value=<%=codigoProgra%>></input>
			 <input type="hidden" name="idProveedor" value=""></input>			 
			 <input type="hidden" name="codigoActivo" value=<%=codigoActi%>></input>			 
			 <input type="hidden" name="tipo" value="1"></input>

			<div class="row-fluid sortable">		
				<div class="box span12" style="width: 1087px;margin-left: 224px;">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-align-justify"></i> RESULTADOS ACTIVOS</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">

						  <thead>
							  <tr>
							  	  <th width="4%%">N°</th>
							  	  <th width="10%">Núm. Serie</th>
								  <th width="20%">Nombre</th>
								  <th width="12%">Marca</th>
								  <th width="13%">Proveedor</th>
								  <th width="10%">Lugar</th>
								  <th width="9%">Vencim. Garantía</th> 
								  <th>Operación</th>

							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 

						  <%
						  Calendar fechaVencimiento = new GregorianCalendar();
						  GregorianCalendar fechaActual=new GregorianCalendar();
						  
						  SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
                          			for(int i=0;
                          			i<resultadosActivos.size();i++){
                             %>
                       
							 <tr>
					        
							<td class="center">
                          				<%=
                          						((ResultadoActivoBeanData)resultadosActivos.get(i)).getCodigo()
                          				%>
                          	</td>
                          	
                          	<td class="center">
                          				<%=
                          						((ResultadoActivoBeanData)resultadosActivos.get(i)).getNumeroSerie()
                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoActivoBeanData)resultadosActivos.get(i)).getNombre()

                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          						((ResultadoActivoBeanData)resultadosActivos.get(i)).getMarca()
                          						
                          				%>
                          	</td>    
                          	
                          	<td class="center">
                          		<a class="" href="javascript:alt_proveedor(<%=((ResultadoActivoBeanData)resultadosActivos.get(i)).getIdProveedor()%>)" title="Ver Proveedor" data-rel="tooltip">
                          				<%=
                          						((ResultadoActivoBeanData)resultadosActivos.get(i)).getRazonSocial()
                          						
                          				%>
                          		</a>
                          	</td> 
                          	                          	                         	
                          	<td class="center">
                          				<%=
                          						((ResultadoActivoBeanData)resultadosActivos.get(i)).getLocal()
                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          		
                          						df.format(((ResultadoActivoBeanData)resultadosActivos.get(i)).getFechaVencimientoGarantia())
                          				%>
                          	</td> 
                          	

                          	
                          	        <td class="center">

                          				 
 <% 
 //SOLO si tiene la programacion con estado=2, es decir en ejecución se podra asignarle repuestos hasta que se genere la OTM
 //SOLO si tiene la programacion con estado=2, es decir en ejecución se podrá generar una OTM
 if(programacionData.getEstado()==2){
	 
	 //SI ESE ACTIVO YA ESTA EN HISTORICO, va estar disabled
	 if(((ResultadoActivoBeanData)resultadosActivos.get(i)).getEstado()!=1){%>                         				
                          				<button class="btn btn-primary iframe" onclick="javascript:alt_codigo_activo(<%=((ResultadoActivoBeanData)resultadosActivos.get(i)).getCodigo()%>)"
                          					href="../activo/seleccionarrepuesto.jsp" disabled>
                          					<i class="icon-wrench icon-white"></i>
	Asignar Repuestos
                          				</button>

                          				<button class="btn btn-primary" 
                          					href="javascript:alt_orden_trabajo('<%=((ResultadoActivoBeanData)resultadosActivos.get(i)).getCodigo()%>')" disabled>
                          				
										<i class="icon-ok icon-white"></i>
	Aceptar Orden
                          				</button>
     <%} 
	 else{%>
     									<a class="btn btn-primary iframe" onclick="javascript:alt_codigo_activo(<%=((ResultadoActivoBeanData)resultadosActivos.get(i)).getCodigo()%>)"
                          					href="../activo/seleccionarrepuesto.jsp" title="Asignar Repuestos" data-rel="tooltip">
                          					<i class="icon-wrench icon-white"></i>
	Repuestos
                          				</a>

                          				<a class="btn btn-primary" title="Aceptar Orden" data-rel="tooltip"
                          					href="javascript:alt_orden_trabajo('<%=((ResultadoActivoBeanData)resultadosActivos.get(i)).getCodigo()%>')">
                          				
										<i class="icon-ok icon-white"></i>
	Aceptar Orden
                          				</a>
     <%}%>  
            				
<%}%>


 <% 
 if(programacionData.getEstado()==1){%>
										<a class="btn btn-primary" 
                          					href="javascript:alt_orden_trabajo('<%=((ResultadoActivoBeanData)resultadosActivos.get(i)).getCodigo()%>')">
                          				
										<i class="icon-trash icon-white"></i>
	Quitar
                          				</a>
  <%}%>
                          			</td>
<% }%>


							
					       </tbody>
					       </element>
					  </table>            
					</div>
				</div><!--/span-->
		
			</div><!--/row-->

                </form> 

			
			<% } %>
			
			
			<!-- PARA MOSTRAR Y RELLENAR UNA ORDEN DE TRABAJO -->
			<% if(tipo.equals("3")){%> 
			<div class="row-fluid sortable">
			    <div class="box span12" style="width: 1087px;margin-left: 224px;">
			      <div class="box-header well" data-original-title>
			        <h2><i class="icon-list-alt"></i> ACEPTAR ORDEN DE TRABAJO</h2>
					</div>
					<div class="box-content">
					
						<form class="form-horizontal" id="frmOrden" name="frmOrden" method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/programacion/SMVProgramacion")%>">
			                <input type="hidden" name="accion" value="AceptarOrden"></input>
			                <input type="hidden" name="nombre" value=""></input>
							<input type="hidden" name="tipo" value="2"></input>
							<input type="hidden" name="idProgramacion" value=<%=codigoProgra%>></input>
							<input type="hidden" name="idPersonalMantenimiento" value=""></input>
							<input type="hidden" name="idPersonalAutorizo" value=""></input>
							<input type="hidden" name="idProveedor" value=""></input>
							<input type="hidden" name="codigoActivo" value=<%=codigoActi%>></input>
						
							
						  <fieldset>        
						        
						       <div class="control-group">                        
                                  <label class="control-label" for="typeahead1">Nombre Personal Autorizó:</label>
                                  <div class="controls">

                                  	<input type="text"  class="span6 typeahead" id="txtNombrePersonalA" name="txtNombrePersonalA" data-provide="typeahead">
                                  	<div  align="left"> <a class="btn btn-primary iframe" href="../personal/seleccionarpersonalopcional.jsp"> <i class="icon icon-search icon-white"></i> Buscar</a> </div>
                                  </div>
                              </div>
						        
						       <div class="control-group">                        
                                  <label class="control-label" for="typeahead1">Proveedor :</label>
                                  <div class="controls">

                                  	<input type="text"  class="span6 typeahead" id="txtProveedor" name="txtProveedor" data-provide="typeahead">
                                  			                
		                     		<div  align="left"> <a class="btn btn-primary iframe" href="../proveedor/seleccionarproveedor.jsp"> <i class="icon icon-search icon-white"></i> Buscar</a> </div>

                                  </div>
                              </div>   
						         
						                                                                        
							  <div class="control-group">                        
                                  <label class="control-label" for="typeahead1">Nombre Personal Mantenimiento:</label>
                                  <div class="controls">

                                  	<input type="text"  class="span6 typeahead" id="txtNombrePersonalM" name="txtNombrePersonalM" data-provide="typeahead">
                                  			                
		                     		<div  align="left"> <a class="btn btn-primary iframe" href="../personal/seleccionarpersonal.jsp"> <i class="icon icon-search icon-white"></i> Buscar</a> </div>

                                  </div>
                              </div>
                                                  
                             <div class="control-group">                        
                                  <label class="control-label" for="typeahead1">Horas Hombre:</label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtHorasHombre" name="txtHorasHombre" data-provide="typeahead" >
                                  </div>
                              </div>
                              					
			                  <div class="control-group">  
                                  <label class="control-label" for="typeahead4">Condiciones del equipo: </label>
                                  <div class="controls">                   
                                      <textarea id="txtCondicionesEquipo" name="txtCondicionesEquipo" rows="3" cols="1000" style="resize:none; height: 74px; width: 400px"></textarea>
                                  </div>
                              </div>   
                              
			            <div class="form-actions">
			              <button type="submit" class="btn btn-primary" onclick="javascript:alt_aceptar_orden()">
			              <i class="icon-check icon-white"></i> 
			              ACEPTAR</button>

		                </div>

		              </fieldset>
		            </form>
		            </table>
	          </div> 
		        </div>
				
			    <!--/span-->
		      </div>
		      
			<% }%>
			
			
			<!-- PARA MOSTRAR LAS PROGRAMACIONES EJECUTADAS PARA CADA PROGRAMACIÓN-->	
			<% if(tipo.equals("4")||tipo.equals("6")||tipo.equals("7")){%> 
			
			<form id="frmEjecutada" name="frmEjecutada" method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/programacion/SMVProgramacion")%>">
			 <input type="hidden" name="accion" value="Agregar"></input>
			 <input type="hidden" name="vectorActividades" value=""></input>
			 <input type="hidden" name="vectorActivos" value=""></input>
			 <input type="hidden" name="idActivo" value=""></input>
			 <input type="hidden" name="tipo" value="1"></input>

			<div class="row-fluid sortable">		
				<div class="box span12" style="width: 1087px;margin-left: 224px;">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-align-justify"></i> ORDENES DE TRABAJO GENERADAS</h2>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">

						  <thead>
							  <tr>
							  	  <th width="4%%">N°</th>
								  <th width="20%">Personal Responsable</th>
								  <th width="20%">Personal Ejecutor</th>
								  <th width="13%">N° Serie Activo</th>
								  <th width="8%">Fecha Ejecución</th>
								  <th width="23%">Comentarios</th>
								  <th width="20%">Operación</th>

							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 

						  <%SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy"); 
                          			for(int i=0;
                          			i<resultadosEjecutado.size();i++){
                             %>
                       
							 <tr>
					        
							<td class="center">
                          				<%=
                          						((ProgramacionHistoricoBeanData)resultadosEjecutado.get(i)).getIdHistoricoProgramacion()
                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          						((ProgramacionHistoricoBeanData)resultadosEjecutado.get(i)).getPersonalResponsable()
                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          						((ProgramacionHistoricoBeanData)resultadosEjecutado.get(i)).getPersonalEjecutor()
                          				%>
                          	</td>    
                          	
                          	<td class="center">
                          		<a class="" href="javascript:alt_activo(<%=((ProgramacionHistoricoBeanData)resultadosEjecutado.get(i)).getIdActivo()%>)">
                          				<%=
                          						((ProgramacionHistoricoBeanData)resultadosEjecutado.get(i)).getNumeroActivo()
                          				%>
                          		</a>                          				
                          	</td>
                          	
                          	<td class="center">
                          				<%=
                          						df.format(((ProgramacionHistoricoBeanData)resultadosEjecutado.get(i)).getFechaRegistro())
                          				%>
                          	</td>
                          	
                          	<td class="center">
                          				<%=
                          						((ProgramacionHistoricoBeanData)resultadosEjecutado.get(i)).getCondicionesEquipo()
                          				%>
                          	</td>

                          	
                          	        <td class="center">
                          				<a class="btn btn-primary" title="Terminar Ejecución" data-rel="tooltip"
                          					href="javascript:alt_activo(<%=((ProgramacionHistoricoBeanData)resultadosEjecutado.get(i)).getIdActivo()%>)">
										<i class="icon-ok icon-white"></i>
Visualizar
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
			<% }%>
			
			
						
			<!-- PARA VER INFORMACIÓN DEL PROVEEDOR -->
			<% if(tipo.equals("5")){%> 
			<div class="row-fluid sortable">
			    <div class="box span12">
			      <div class="box-header well" data-original-title>
			        <h2><i class="icon-briefcase"></i> VER PROVEEDOR</h2>
			        <div class="box-icon">
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
					</div>
					</div>
					<div class="box-content">
					
						<form class="form-horizontal" id="frmProveedor" name="frmProveedor" method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/programacion/SMVProgramacion")%>">
			                <input type="hidden" name="accion" value="AceptarOrden"></input>
			                <input type="hidden" name="nombre" value=""></input>
							<input type="hidden" name="tipo" value="2"></input>
							<input type="hidden" name="idProgramacion" value=<%=codigoProgra%>></input>
							<input type="hidden" name="idProveedor" value=""></input>
												
						  <fieldset>        
						        
						       <div class="control-group">                        
                                  <label class="control-label" for="typeahead1">Razón Social :</label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtRazonSocial" name="txtRazonSocial" data-provide="typeahead" value="<%=proveedorData.getRazonSocial()%>" disabled>
                                  </div>
                              </div>
						        
						       <div class="control-group">                        
                                  <label class="control-label" for="typeahead1">RUC :</label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtRUC" name="txtRUC" data-provide="typeahead" value="<%=proveedorData.getRuc()%>" disabled>		                     		
                                  </div>
                              </div>   
						         
						                                                                        
							  <div class="control-group">                        
                                  <label class="control-label" for="typeahead1">Teléfono 1:</label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtTelefono1" name="txtTelefono1" data-provide="typeahead" value="<%=proveedorData.getTelefono1()%>" disabled>
                                  </div>
                              </div>
                                                       
							  <div class="control-group">                        
                                  <label class="control-label" for="typeahead1">Teléfono 2:</label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtTelefono2" name="txtTelefono2" data-provide="typeahead" value="<%=proveedorData.getTelefono2()%>" disabled>
                                  </div>
                              </div> 
                           </fieldset>
		            </form>
		            </table>
	          </div> 
		        </div>
				
			    <!--/span-->
		      </div>
		      
			<% }%>
			
			
			<% if(tipo.equals("6")){%> 
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
					  <h2><i class="icon-zoom-in"></i> VER ACTIVO</h2>
				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmData" method="POST" action="<%= response.encodeURL("SMVActivo")%>">
						<input type="hidden" name="accion" value="Consultar"></input>
						<input type="hidden" name="tipo" value="2"></input>
						
						  <fieldset>
						    <div class="control-group">    
							  <br>                    
                                  <label class="control-label" for="typeahead1">Número Serie: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtNumeroSerie" name="txtNumeroSerie" data-provide="typeahead" value="<%=activo.getNumeroSerie()%>" disabled>
                                  </div>
                              </div>
			                
			                <div class="control-group">                      
                                  <label class="control-label" for="typeahead1">Nombre: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" value="<%=activo.getNombre()%>" disabled>
                                  </div>
                              </div>
                              
                              <div class="control-group">
                          	<label class="control-label" for="selectS1">Tipo Activo:</label>
                          	<div class="controls">
								  <select data-rel="chosen" id="cmbTipoActivo" name="cmbTipoActivo" disabled>			
								  	
										<option value="<%= tipoActivo.getCodigo()%>" ><%= tipoActivo.getNombre()%></option>
								
								  </select>
                          	</div>
                        	</div>
                        	
                        <div class="control-group">
                          <label class="control-label" for="selectP">Ubicación :</label>
                          <div class="controls">
								  <select data-rel="chosen" id="cmbLocal" name="cmbLocal" disabled>			
		
										<option value="<%= localData.getCodigo()%>" ><%= localData.getNombre()%></option>

								  </select>
                          </div>
                        </div>
                              
                              <div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Registro: </label>
				              <div class="controls">
				                <input type="text"  class="input-xlarge datepicker" id="fFechaRegistro" name="fFechaRegistro" value="<%=formatear(new Date(activo.getFechaRegistro().getTime()))%>" disabled>
			                  </div>
			                </div>	
                              
                              
                              <div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Compra: </label>
				              <div class="controls">
				                <input type="text"  class="input-xlarge datepicker" id="fFechaCompra" name="fFechaCompra" value="<%=formatear(new Date(activo.getFechaCompra().getTime()))%>" disabled>
			                  </div>
			                </div>	
			                
                              <div class="control-group">                    
                                  <label class="control-label" for="typeahead1">Monto Compra: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtMontoCompra" name="txtMontoCompra" data-provide="typeahead" value="<%=activo.getMontoCompra()%>" disabled>
                                  </div>
                              </div>
                              
                    	<div class="control-group">
                          <label class="control-label" for="selectT">Tipo Moneda:</label>
                          <div class="controls">
								  <select data-rel="chosen" id="cmbTipoMoneda" name="cmbTipoMoneda" disabled>			
										<option value="<%= tipoMoneda.getCodigo()%>" disabled><%= tipoMoneda.getNombre()%></option>
								  </select>
                          </div>
                        </div>
                              
                          <div class="control-group">
                          <label class="control-label" for="selectP">Proveedor:</label>
                          <div class="controls">
								  <select data-rel="chosen" id="cmbProveedor" name="cmbProveedor" disabled>			
									<option value="<%= proveedor.getCodigo()%>" disabled><%= proveedor.getRazonSocial()%></option>
								  </select>
                          </div>
                        </div>
                              
                              <div class="control-group">  
                                  <label class="control-label" for="typeahead4">Descripción: </label>
                                  <div class="controls">                   
                                      <textarea id="txtDescripcion" name="txtDescripcion" rows="3" cols="1000" style="resize:none; height: 74px; width: 320px" disabled><%=activo.getDescripcion() %></textarea>
                                  </div>
                              </div>
                              
                              <% 
								//SI el activo esta de baja estado 4, se muestra la fecha de Baja y el motivo de baja                              
                              if(activo.getEstado()==4){ %>
							
							<div class="control-group">
				              <label class="control-label" for="typeahead3">Fecha Baja: </label>
				              <div class="controls">
				                <input type="text"  class="input-xlarge datepicker" id="fFechaBaja" name="fFechaBaja" value="<%=formatear(new Date(activo.getFechaBaja().getTime()))%>" disabled>
			                  </div>
			                </div>
								
							<div class="control-group">  
                                  <label class="control-label" for="typeahead4">Motivo Baja: </label>
                                  <div class="controls">                   
                                      <textarea id="txtMotivoBaja" name="txtMotivoBaja" rows="3" cols="1000" style="resize:none; height: 74px; width: 300px" disabled><%=activo.getMotivoBaja() %></textarea>
                                  </div>
                              </div>
							
							
							<%} %>
							
						  </fieldset>
					  </form>   
					
				  </div>
				</div><!--/span-->

			</div><!--/row-->
			<% }%>
			
			
			
			<% if(tipo.equals("8")){%> 
	<div class="row-fluid sortable">

	<div class="box span12" style="width: 1087px;margin-left: 224px;">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-calendar"></i> RE PROGRAMACIÓN</h2>
           	<div class="box-icon">							
			<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
			</div>                
  		</div>
	
	<!-- Formulario -->

	<div class="box-content">

		<form  name="frmProgramacionAux" id="frmProgramacionAux"  method="POST" action="<%= response.encodeURL("SMVProgramacion")%>">
		<input type="hidden" name="accion" value="Agregar"/></input>
		<input type="hidden" name="codigoProgramacion" value="<%=programacion.getCodigo()%>"></input>
		<input type="hidden" name="nombre" value=""></input>
		<input type="hidden" name="tipo" value="2"></input>
		
		 <fieldset>
		 	  <div class="control-group">                        
                 <label class="control-label" for="typeahead1">Nombre Subproceso:</label>
                 <div class="controls">
                      <input type="text"  class="span4 typeahead" id="txtNombreSubproceso" name="txtNombreSubproceso" data-provide="typeahead" disabled value="<%=subprocesoData.getNombre()%>">
                  </div>
              </div>
		 	 <div class="control-group">
				 <label class="control-label" for="typeahead2">Nombre de Programación: </label>
				 <div class="controls">
				 <input type="text" class="span4 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" maxlength="50" data-items="4" disabled value="<%=programacion.getDescripcion()%>" >
				 </div>
			 </div>	

			 
			 <fieldset>
			 <legend>Hora de Ejecución</legend>
			<table>
				<tr>
					<td width="150" align="left" valign="top">
						<label class="control-label" for="typeahead3">Se ejecuta a las (*):  </label>
					</td>
					<td width="100" align="left" valign="top">
						<input class="span16" type="time" name="hora" id="hora">
					</td>
					<td valign="top">
						<label class="control-label" for="typeahead4">(--:-- 24 hrs) </label>
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
		            	<label class="control-label" for="typeahead5">Fecha de Re Programación (*): </label>
		            	</div>
		            </td>
		            <td width="100" align="left" valign="top">
		            	<div class="controls">
		             		 <input type="text" class="input-small datepicker" id="fcReProgramacion" name="fcReProgramacion"  maxlength="10">		           		
		            	</div>
		            </td>
		            <td width="50">
		            </td>
		            <td width="50">
		            </td>
	         	</tr>
         	</table>
			</fieldset>
			
			<div class="control-group">
			<br>
				 <label class="control-label" for="typeahead2">Motivo Re Programación: </label>
				 <div class="controls">
				 <textarea id="txtMotivo" name="txtMotivo" rows="3" cols="1000" style="resize:none; height: 74px; width: 320px"></textarea>
				 </div>
			 </div>
			 <!-- Botones -->
			 <div class="form-actions">
               <a class="btn btn-primary" href="javascript:alt_grabar_reprogramar()">
                <i class="icon-check icon-white"></i>
                GUARDAR</a>      

             </div>
		 </fieldset>
		</form>
	</div>
		</div>
</div> <!--Fin de formulario-->

			</div><!--/row-->  
       <%}%>
       
       
       </div>
					<!-- content ends -->
			</div><!--/#content.span10-->

				
		<hr>

		<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">X?</button>
				<h3>Opciones</h3>
			</div>
			<div class="modal-body">
				<p>Aqu&iacute; las opciones pueden ser configuradas...</p>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">Close</a>
				<a href="#" class="btn btn-primary">Save changes</a>
			</div>
		</div>

		<footer>
		  <p class="pull-left"><a href="#">GTS</a> &copy;  2014</p>
          <p class="pull-right">Powered by: <a href="#">PUCP</a></p>
		</footer>
		
	
</body>
</html>
