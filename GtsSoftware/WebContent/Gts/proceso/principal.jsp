<%@page import="GtsSoftware.tipomoneda.TipoMonedaBeanData"%>
<%@page import="java.util.Vector"%>
<%@page import="GtsSoftware.subproceso.ResultadoSubprocesoBeanData"%>
<%@page import="GtsSoftware.actividad.ResultadoActividadBeanData"%>
<%@page import="GtsSoftware.activo.ResultadoActivoBeanData"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="GtsSoftware.proceso.ResultadoProcesoBeanData"%>
<%@page import="GtsSoftware.programacion.ResultadoProgramacionBeanData"%>

<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="utf-8">
	<title>GTS Solution</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="GTS Solution">
	<meta name="author" content="Los manos">
	<!--The beans  -->
	<jsp:useBean id="casosDeUso" scope="request" class="java.util.Vector"></jsp:useBean>
	<!-- The styles -->
	
	
	<link href="css/basic.css" type="text/css" rel="stylesheet" />
	<link id="bs-css" href="css/bootstrap-united.css" rel="stylesheet">
		<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
		<script type="text/javascript" src="http://filamentgroup.github.com/EnhanceJS/enhance.js"></script>
		<script type="text/javascript">
			// Run capabilities test
			enhance({
				loadScripts: [
					'https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js',
					'js/jQuery.tree.js',
 					'js/example.js' 
				],
				loadStyles: ['css/enhanced.css']
			});
			
	    </script>
	
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

<body>

		<!-- Para HACER MODAL -->
		<jsp:include page="/Gts/general/jsexternal.jsp" />
		<script type="text/javascript" src="js/apprise-1.5.full.js"></script>
		
		
		
		
		<script>
		
			function soloNumeros(evt){
				//asignamos el valor de la tecla a keynum
				if(window.event){// IE
					keynum = evt.keyCode;
				}else{
					keynum = evt.which;
				}
				//comprobamos si se encuentra en el rango
				if(keynum>47 && keynum<58){
					return true;
				}else{
					return false;
				}
			}
		
		
			$(document).ready(function(){
				//Examples of how to assign the Colorbox event to elements
				
				$(".iframe").colorbox({iframe:true, width:"80%", height:"80%"});
				
				//Example of preserving a JavaScript event for inline calls.
				$("#click").click(function(){ 
					$('#click').css({"background-color":"#f00", "color":"#fff", "cursor":"inherit"}).text("Open this window again and this message will still be here.");
					return false;
				});
			});
			
			$("#checkbox").prop("checked", "checked");
		</script>
		<link rel="stylesheet" href="css/apprise.css" type="text/css" />
		<script type="text/javascript" src="js/script.js"></script>
		<!-- FIN HACER MODAL -->
		
		<script>

		function alt_fecha(obj){
		obj.value=obj.value.slice(0,5);
		}
		
		function alt_agregar_subproceso(){
			var form=document.getElementById("frmAlternativo");
			var k=0;
			//para cuando selecciono subproceso
			var elementos = document.getElementsByName("chboxNombre");
			var texto=new Array(elementos.length);
			for (x=0;x<elementos.length;x++){
				if (elementos[x].checked) {					
					form.nombreSubproceso.value =  elementos[x].value;
					k++;
				}
			}
			//para cuando selecciono proceso
			var elementosP = document.getElementsByName("chboxNombreP");
			var texto=new Array(elementosP.length);
			for (x=0;x<elementosP.length;x++){
				if (elementosP[x].checked) {
					form.nombreProceso.value =  elementosP[x].value;
					k++;
				}
			}
			
			if(k==1){
				form.accion.value="AgregarPrincipal";
				form.tipo.value="1";
				form.submit();				
			}
			if(k>1)
				alert("Seleccione solo una opción");
			if(k==0)
				alert("Seleccione un proceso o subproceso");
		}
		
		
		function alt_programar_proceso(){
			var form=document.getElementById("frmAlternativo");
			
			var cantSubprocesos=0;
			var elementos = document.getElementsByName("chboxNombre");
			var texto=new Array(elementos.length);
			for (x=0;x<elementos.length;x++){
				if (elementos[x].checked) {
					form.nombreSubproceso.value =  elementos[x].value;
					cantSuprocesos++;
				}
			}
			
			var cantProcesos=0;
			var elementosP = document.getElementsByName("chboxNombreP");
			var texto=new Array(elementosP.length);
			for (x=0;x<elementosP.length;x++){
				if (elementosP[x].checked) {
					form.nombreProceso.value =  elementosP[x].value;
					cantProcesos++;
				}
			}
			
			if(cantProcesos==1 && cantSubprocesos==0){			
				$.ajax({
					  type: "POST",
					  url: "/GtsSoftware/Gts/proceso/SMVProceso",
					  // el nombreProceso.val necesita un id para poder sacar su valor
					  data: "accion=Programar"+ "&tipo=3"+"&nombreProceso=" + $(nombreProceso).val(),
					  dataType: "text",
					  success: function(msg){
					  	if(msg=="1"){
					  		alert("No se puede puede programar el proceso. Debe tener por lo menos un subproceso !!!");
		        		}else{
		        			form.accion.value="Programar";
		    				form.tipo.value="2";
		        			form.submit();    
		        		}  				  								
					  },
					  error: function(){
					  	return "";
					  }
				});				
			}

			if(cantSubprocesos>0){
				alert("Debe seleccionar un proceso");
			}
		}
		
		function alt_asignar_actividad(cod){
			var form=document.getElementById("frmProgramacion");
			form.accion.value="AsignarActividad";
			form.codigo.value=cod;
			form.submit();
		}
		
		function alt_ordenar_subproceso(){
			var form=document.getElementById("frmAlternativo");
			
			var j=0;
			var elementos = document.getElementsByName("chboxNombre");
			var texto=new Array(elementos.length);
			for (x=0;x<elementos.length;x++){
				if (elementos[x].checked) {					
					form.nombreSubproceso.value =  elementos[x].value;
					j++;
				}
			}
			
			var k=0;
			var elementos = document.getElementsByName("chboxNombreP");
			var texto=new Array(elementos.length);
			for (x=0;x<elementos.length;x++){
				if (elementos[x].checked) {
					form.nombreProceso.value =  elementos[x].value;
					k++;
				}
			}
			
			if(k==1){
				alert("Ha seleccionado un proceso.Seleccione un subproceso");				
			}
			if(j==1){
				form.accion.value="OrdenarSubproceso";
				form.submit();
			}			
			if(j>1)
				alert("Seleccione solo una opción");
			if(j==0)
				alert("Seleccione un subproceso");
		}
		
		
		function alt_ver_actividades(){
			var form=document.getElementById("frmProgramacion");

			form.accion.value="VerActividades";
			
			var elementos = document.getElementsByName("chboxNombre");
			var texto=new Array(elementos.length);
			for (x=0;x<elementos.length;x++)
				if (elementos[x].checked) {
					form.nombreSubproceso.value =  elementos[x].value;
				}
			form.submit();

		}
		
		function alt_ver_activos(){
			var form=document.getElementById("frmProgramacion");

			form.accion.value="VerActivos";
			
			var elementos = document.getElementsByName("chboxNombre");
			var texto=new Array(elementos.length);
			for (x=0;x<elementos.length;x++)
				if (elementos[x].checked) {
					form.nombreSubproceso.value =  elementos[x].value;
				}
			form.submit();

		}	
		
		function alt_seleccionar(){
			var form=document.getElementById("frmSeleccionar");
			form.accion.value="Seleccionar";
			//form.tipo.value="2";
			form.submit();
		}
		
		function alt_submit(){
			var form= document.frmSubproceso;
			//if(validaForm()) form.submit();
			nombreSubproceso = document.getElementById("txtSubproceso").value;
			descripcion=document.getElementById("txtDescripcion").value;
			tiempoEstimado=document.getElementById("txtTiempo").value;
			if (nombreProceso.length != 0 && descripcion.length!=0 && tiempoEstimado.length !=0) {
				form.submit();
        	}
		}
		
		function alt_guardar_orden(){
			var form= document.frmSubproceso;
			//if(validaForm()) form.submit();
			form.submit();
		}
		
				
		function anhadir(vectorActividad){
			var form=document.getElementById("frmProgramacion");
			form.accion.value="AgregarActividad";
			form.vectorActividades.value=vectorActividad;
			form.submit();

			$.fn.colorbox.close();
		}
		
		function anhadirActivo(vectorActivo){
			var form=document.getElementById("frmProgramacion");
			form.accion.value="AgregarActivo";
			form.vectorActivos.value=vectorActivo;
			form.submit();

			$.fn.colorbox.close();
		}
		
		function anhadirRolEjecutor(cod, name){
			var form= document.frmSubproceso;
			form.idRol.value=cod;
			form.txtRol.value=name;
			$.fn.colorbox.close();
		}
		
		function anhadirRolResponsable(cod, name){
			var form= document.frmSubproceso;
			form.idRolResponsable.value=cod;
			form.txtRolResponsable.value=name;
			$.fn.colorbox.close();
		}
		
		
		function anhadirProgramacion(){
			
			$.fn.colorbox.close();
		}
		
		function alt_agregarBotones(){
			var form=document.getElementById("frmProgramacion");
			form.accion.value="CambiarBotones";
			form.tipo.value="3";
			form.submit();
			
		}
		
		function alt_codigo_activo(cod){
			var form= document.frmProgramacion;
			form.codigoActivo.value=cod;
			//form.submit();
		}

		
	</script>	



<jsp:useBean id="maximoOrden" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="resultadosActivos" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosActividades" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="codigoProgramacion" scope="session" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="nombreProceso" scope="session" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="nombreSub" scope="session" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="resultadosProg" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="proceso" scope="session" class="GtsSoftware.proceso.ProcesoBeanData"></jsp:useBean>
<jsp:useBean id="subproceso" scope="session" class="GtsSoftware.subproceso.SubprocesoBeanData"></jsp:useBean>
<jsp:useBean id="tipo" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="resultadosNivelDos" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="procesoData" scope="session" class="GtsSoftware.proceso.ProcesoBeanData"></jsp:useBean>
<jsp:useBean id="matrizSubprocesos" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="tamanho" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="tamanhoAcumulado" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="indicepadre" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="suspadres" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="nivel2" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="nivel3" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="nivel4" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="nivel5" scope="session" class="java.util.Vector"></jsp:useBean>


<jsp:include page="/Gts/general/superior.jsp" />
		
		
<form class="form-horizontal" id="frmAlternativo" name="frmAlternativo" method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/proceso/SMVProceso")%>">
<input type="hidden" name="accion" value=""></input>
<input type="hidden" name="tipo" value="0"></input>
<input type="hidden" name="nombreSubproceso" value=""></input>
<input type="hidden" id="nombreProceso" name="nombreProceso" value=""></input>
<input type="hidden" name="nombre" value=""></input>	
<div class="container-fluid">
					
			<div>
				<ul class="breadcrumb">
					<li>
					   <a class="btn btn-primary" href="javascript:alt_agregar_subproceso()"><i class="icon-plus icon-white"></i> Agregar Subproceso</a>&nbsp;&nbsp;&nbsp;
                       <a class="btn btn-primary" href="javascript:alt_ordenar_subproceso()"><i class="icon-move icon-white"></i> Ordenar Subproceso</a>&nbsp;&nbsp;&nbsp;
                       <a class="btn btn-primary" href="javascript:alt_programar_proceso()"><i class="icon-calendar icon-white"></i> Programar Calendario</a>&nbsp;&nbsp;&nbsp;
                       <!-- <a class="btn btn-primary" href="javascript:alt_ver_actividades()"><i class="icon-list icon-white"></i> Ver Actividades</a>&nbsp;&nbsp;&nbsp; -->
                       <a class="btn btn-primary" href="javascript:alt_ver_activos()"><i class="icon-list icon-white"></i> Ver Activos</a>&nbsp;&nbsp;&nbsp;
                        	
                       <button type="reset" class="btn" onclick="location.href='../proceso/buscarproceso.jsp'"><i class="icon-circle-arrow-left icon-black"></i> Regresar</button>	
					</li>				
				</ul>
			</div>		
			
<div class="row-fluid">
				
			<!-- left menu starts -->


<div class="span2 main-menu-span">

<ul id="files">

	<input type="checkbox" name="chboxNombreP" id="chboxNombreP"  value="<%=procesoData.getNombre()%>"><i class=" icon-th-large"></i><%=procesoData.getNombre()%>
		
		<ul>
				<% 
					for(int i=0;i<indicepadre.size();i++){
					if(i<resultadosNivelDos.size()){ %>
					<%if(((ResultadoSubprocesoBeanData)resultadosNivelDos.get(i)).getNombre().equals(nombreSub)){%>
			<input type="checkbox" name="chboxNombre" id="chboxNombre"  value="<%=((ResultadoSubprocesoBeanData)resultadosNivelDos.get(i)).getNombre()%>" checked><i class="icon-th"></i><%=((ResultadoSubprocesoBeanData)resultadosNivelDos.get(i)).getNombre()%>	
				<%}else{%>
				<input type="checkbox" name="chboxNombre" id="chboxNombre"  value="<%=((ResultadoSubprocesoBeanData)resultadosNivelDos.get(i)).getNombre()%>"><i class="icon-th"></i><%=((ResultadoSubprocesoBeanData)resultadosNivelDos.get(i)).getNombre()%>	
					<%}} %>
				<ul>
			
				<%  	if(i<nivel2.size()){
						for(int j=i;j<nivel2.size();j++){
							Integer tamano=0;
							Integer tamanoAcum=0;
							if (((ResultadoSubprocesoBeanData)nivel2.get(j)).getCodigosubproceso()==((ResultadoSubprocesoBeanData)indicepadre.get(i)).getCodigosubproceso()){
								Integer valorj=j;
								tamano=(Integer)tamanho.get(valorj);
								tamanoAcum=(Integer)tamanhoAcumulado.get(valorj);
						
						
							for(int l=tamanoAcum;l<tamano+tamanoAcum;l++){
					
				%>
						<%if(((ResultadoSubprocesoBeanData)matrizSubprocesos.get(l)).getNombre().equals(nombreSub)){%> 
						<input type="checkbox" name="chboxNombre" id="chboxNombre"  value="<%=((ResultadoSubprocesoBeanData)matrizSubprocesos.get(l)).getNombre()%>" checked><i class="icon-th"></i><%=((ResultadoSubprocesoBeanData)matrizSubprocesos.get(l)).getNombre()%><br>
						<%}else{%>
						<input type="checkbox" name="chboxNombre" id="chboxNombre"  value="<%=((ResultadoSubprocesoBeanData)matrizSubprocesos.get(l)).getNombre()%>"><i class="icon-th"></i><%=((ResultadoSubprocesoBeanData)matrizSubprocesos.get(l)).getNombre()%><br>
							
							
					<%	  }
							}%>
					
					<ul>
 					<% 
								for(int k=0;k<nivel3.size();k++){
									tamano=0;
									tamanoAcum=0;
									Integer esta=0;
									Integer valork=0;
									
									for(int m=0;m<indicepadre.size();m++){
										if ( (nivel3.get(k)==indicepadre.get(m)) && ((ResultadoSubprocesoBeanData)nivel3.get(k)).getCodigosubprocesopadre()==((ResultadoSubprocesoBeanData)nivel2.get(j)).getCodigosubproceso()) {
											esta=1;
											valork=m;
										}
									}

										if (esta==1){									
										tamano=(Integer)tamanho.get(valork);
										tamanoAcum=(Integer)tamanhoAcumulado.get(valork);
							
									for(int l=tamanoAcum;l<tamano+tamanoAcum;l++){
					%> 
					<%if(((ResultadoSubprocesoBeanData)matrizSubprocesos.get(l)).getNombre().equals(nombreSub)){%> 
							<input type="checkbox" name="chboxNombre" id="chboxNombre"  value="<%=((ResultadoSubprocesoBeanData)matrizSubprocesos.get(l)).getNombre()%>" checked><i class="icon-th"></i><%=((ResultadoSubprocesoBeanData)matrizSubprocesos.get(l)).getNombre()%><br>
					<%}else{%>
							<input type="checkbox" name="chboxNombre" id="chboxNombre"  value="<%=((ResultadoSubprocesoBeanData)matrizSubprocesos.get(l)).getNombre()%>"><i class="icon-th"></i><%=((ResultadoSubprocesoBeanData)matrizSubprocesos.get(l)).getNombre()%><br>
								
				<%			}
									}
										}
									}
							
					%>
					</ul>

					<% 		 }
						 }
						 }%>
				</ul>
			
				<%				
					}%>	 
		</ul>


</ul>


</div>
</form>		
						<!-- left menu ends -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">¡Advertencia!</h4>
					<p>Necesitas tener <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> activado para usar este sitio.</p>
				</div>
			</noscript>
			

			<div id="content" class="span10">
			<!-- content starts -->			
			<%if(tipo.equals("1")) {%>

			  <!-- content starts -->

			  <div class="row-fluid sortable">
			    <div class="box span12">
			      <div class="box-header well" data-original-title>
			        <h2><i class="icon-th"></i> AGREGAR SUBPROCESO</h2>
					</div>
					<div class="box-content">
					
						<form class="form-horizontal" id="frmSubproceso" name="frmSubproceso" method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/subproceso/SMVSubproceso")%>">
			                <input type="hidden" name="accion" value="Agregar"></input>
			                
			                <input type="hidden" name="codigo" value="<%=subproceso.getCodigosubproceso()%>"></input>
			                <input type="hidden" name="codigoProceso" value="<%=proceso.getCodigo()%>"></input>
			                <input type="hidden" name="nombre" value="<%=subproceso.getNombre()%>"></input>
			                <input type="hidden" name="descripcion" value="<%=subproceso.getDescripcion()%>"></input>
							<input type="hidden" name="tipo" value="2"></input>
							<input type="hidden" name="idRol" value=""></input>
							<input type="hidden" name="idRolResponsable" value=""></input>
							
						    <fieldset>        
						                                                                        
							  <div class="control-group">                        
                                  <label class="control-label" for="typeahead1">Proceso :</label>
                                  <div class="controls">
                                  	<% String nombre;
                                  	if (subproceso.getNombre()!=null){  nombre=subproceso.getNombre();
                                  	}
                                  	else
                                  	nombre=proceso.getNombre();
                                  	%>
                                  	<input type="text"  class="span6 typeahead" id="txtSubprocesoPadre" name="txtSubprocesoPadre" data-provide="typeahead" disabled value="<%=nombre%>" title="Nombre Subproceso">
                                  
                                  </div>
                              </div>
                              
							  <div class="control-group">                        
                                  <label class="control-label" for="typeahead2">Subproceso (*):</label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtSubproceso" name="txtSubproceso" data-provide="typeahead" required title="Se necesita el nombre del subproceso">
                                  </div>
                              </div>      					
                        					
			                   <div class="control-group">  
                                  <label class="control-label" for="typeahead3">Descripción (*): </label>
                                  <div class="controls">                   
                                      <textarea id="txtDescripcion" name="txtDescripcion" rows="3" cols="1000" style="resize:none; height: 74px; width: 320px" required title="Se necesita una breve descripción"></textarea>
                                  </div>
                              </div>
                              
                              <div class="control-group">
								<label class="control-label" for="appendedInputButton">Rol Ejecutor :</label>
								<div class="controls">
								  <div class="input-append">
									<input id="txtRol" name="txtRol" class="span8 typeahead" type="text" disabled><a class="btn btn-primary iframe" href="../rol/seleccionarrol.jsp"><i class="icon icon-search icon-white"></i> Buscar</a>
								  </div>
								</div>
							  </div> 
							  
							  <div class="control-group">
								<label class="control-label" for="appendedInputButton">Rol Responsable :</label>
								<div class="controls">
								  <div class="input-append">
									<input id="txtRolResponsable" name="txtRolResponsable" class="span8 typeahead" type="text" disabled><a class="btn btn-primary iframe" href="../rol/seleccionarrolresponsable.jsp"><i class="icon icon-search icon-white"></i> Busccar</a>
								  </div>
								</div>
							  </div>
                              
                              <div class="control-group">                        
                                  <label class="control-label" for="typeahead4">Tiempo Estimado(días) (*):</label>
                                  <div class="controls">
                                  	<input type="text"  class="span1 typeahead" id="txtTiempo" name="txtTiempo" data-provide="typeahead" required title="Se necesita un tiempo estimado" onkeypress="return soloNumeros(event)">
                                  </div>
                              </div>

			            <div class="form-actions">
			              <button type="submit" class="btn btn-primary" onclick="javascript:alt_submit()">
			              <i class="icon-check icon-white"></i> Agregar</button>
		                </div>

		              </fieldset>
		            </form>
		            </table>
	          </div> 
		        </div>
				
			    <!--/span-->
		      </div>


      		<% }%>
      		
      		<%if(tipo.equals("2") || tipo.equals("3") ){ %>
      		
      		
      		<form id="frmProgramacion" name="frmProgramacion" method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/programacion/SMVProgramacion")%>">
			 <input type="hidden" name="accion" value="Agregar"></input>
			 <input type="hidden" name="vectorActividades" value=""></input>
			 <input type="hidden" name="vectorActivos" value=""></input>
			 <input type="hidden" name="codigoActivo" value=""></input>
			 <input type="hidden" name="tipo" value="1"></input>
			  

			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-align-justify"></i> RESULTADOS PROGRAMACIÓN</h2>
						<div  align="right">
                               <a class="btn btn-primary iframe" href="../programacion/crearprogramacionSub.jsp">  
                               <input type="hidden" name="codigoSubproceso" value="<%=proceso.getCodigo()%>"></input>
                               <i class="icon icon-add icon-white"></i> AGREGAR PROGRAMACIÓN </a> 
                        </div>  
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">

						  <thead>
							  <tr>
							  	  <th width="4%%">N°</th>
								  <th width="20%">Nombre</th>
								  <th width="9%">Ocurrencia</th>
								  <th width="4%">Cada</th>
								  <th width="11%">Fecha Inicio</th>
								  <th width="11%">Fecha Fin</th>
								  <th width="7%">Estado</th>
								  <th>Operación</th>

							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 


						  <%SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy"); 
                          			for(int i=0;
                          			i<resultadosProg.size();i++){
                             %>
                       
							 <tr>
					       <% if (((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==1)
                          		((ResultadoProgramacionBeanData)resultadosProg.get(i)).setEstado2("Pendiente");
					       	  if (((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==2)
         						((ResultadoProgramacionBeanData)resultadosProg.get(i)).setEstado2("En Ejecución");
					       	 if (((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==3)
	         						((ResultadoProgramacionBeanData)resultadosProg.get(i)).setEstado2("Ejecutado");
					       	if (((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado()==4)
         						((ResultadoProgramacionBeanData)resultadosProg.get(i)).setEstado2("No Ejecutado");
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
                          				<%=
                          					i+1
                          				%>
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
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdOcurrencia2()
                          				%>
                          	</td>    
                          	 <td class="center">
                          				<%=
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getOcurrencia()
                          				%>
                          	</td>    
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
                            <td class="center">
                          			<%=		                          					
                          					((ResultadoProgramacionBeanData)resultadosProg.get(i)).getEstado2()
                          			%>
                          	</td>
                          	
                          	        <td class="center">
                          				<a class="btn btn-primary iframe" 
                          					href="../actividad/seleccionaractividad.jsp">
                          					<input type="hidden" name="codigoA" value="<%=((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdProgramacion()%>"></input>
										<i class="icon-list icon-white"></i>
Asignar Actividades
                          				</a>
                          				 
                          				<a class="btn btn-primary iframe" onclick="javascript:alt_codigo_activo(<%=((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdProgramacion()%>)"
                          					href="../activo/seleccionaractivo.jsp">
                          					<%-- <input type="hidden" name="codigoAct" value="<%=((ResultadoProgramacionBeanData)resultadosProg.get(i)).getIdProgramacion()%>"></input> --%>
                          					<i class="icon-wrench icon-white"></i>
 Asignar Activos
                          				</a>

                          		</td>
                          		</tr>
							<%}%>
				       </tbody>
					       </element>
					  </table>            
					</div>
				</div><!--/span-->
		
			</div><!--/row-->

                </form> 

			<%} %>	
			
						
			<!-- PARA VISUALIZAR ACTIVIDADES QUE TIENE UNA PROGRAMACION -->				
			<%if(tipo.equals("4")){ %>

      		<form id="frmProgramacion" name="frmProgramacion" method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/programacion/SMVProgramacion")%>">
			 <input type="hidden" name="accion" value="Agregar"></input>
			 <input type="hidden" name="vectorActividades" value=""></input>
			 <input type="hidden" name="vectorActivos" value=""></input>
			 <input type="hidden" name="tipo" value="1"></input>
			  

			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-align-justify"></i> RESULTADOS ACTIVIDADES</h2>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">

						  <thead>
							  <tr>
							  	  <th width="4%%">N°</th>
								  <th width="20%">Nombre</th>
								  <th width="20%">Descripcion</th>
								  <th>Operación</th>

							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 


						  <%
                          			for(int i=0;
                          			i<resultadosActividades.size();i++){
                             %>
                       
							 <tr>
					        
							<td class="center">
                          				<%=
                          					i+1
                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoActividadBeanData)resultadosActividades.get(i)).getNombre()

                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          						((ResultadoActividadBeanData)resultadosActividades.get(i)).getDescripcion()
                          				%>
                          	</td>    

                          	
                          	        <td class="center">
                          				<a class="btn btn-primary iframe" 
                          					href="../actividad/seleccionaractividad.jsp">
                          					<input type="hidden" name="codigoA" value="<%=((ResultadoActividadBeanData)resultadosActividades.get(i)).getCodigo()%>"></input>
										<i class="icon-list icon-white"></i>
Visualizar
                          				</a>
                          				 
                          				<a class="btn btn-primary iframe"
                          					href="../activo/seleccionaractivo.jsp">
                          					<input type="hidden" name="codigoActivo" value="<%=((ResultadoActividadBeanData)resultadosActividades.get(i)).getCodigo()%>"></input>
                          					<i class="icon-ok icon-white"></i>
Dar Check
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
                          	
                          	
                          	
          <!-- PARA VISUALIZAR LOS ACTIVOS RELACIONADOS A UNA PROGRAMACION -->
          <%if(tipo.equals("5")){ %>

      		<form id="frmProgramacion" name="frmProgramacion" method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/programacion/SMVProgramacion")%>">
			 <input type="hidden" name="accion" value="Agregar"></input>
			 <input type="hidden" name="vectorActividades" value=""></input>
			 <input type="hidden" name="vectorActivos" value=""></input>
			 <input type="hidden" name="tipo" value="1"></input>

			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-align-justify"></i> RESULTADOS ACTIVOS</h2>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">

						  <thead>
							  <tr>
							  	  <th width="4%%">N°</th>
								  <th width="20%">Nombre</th>
								  <th width="20%">Descripcion</th>
								  <th width="10%">Número Serie</th>
								  <th>Operación</th>

							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 

						  <%
                          			for(int i=0;
                          			i<resultadosActivos.size();i++){
                             %>
                       
							 <tr>
					        
							<td class="center">
                          				<%=
                          					i+1
                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoActivoBeanData)resultadosActivos.get(i)).getNombre()

                          				%>
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          						((ResultadoActivoBeanData)resultadosActivos.get(i)).getDescripcion()
                          				%>
                          	</td>    
                          	
                          	<td class="center">
                          				<%=
                          						((ResultadoActivoBeanData)resultadosActivos.get(i)).getNumeroSerie()
                          				%>
                          	</td>  

                          	
                          	        <td class="center">
                          				<a class="btn btn-primary iframe" 
                          					href="../actividad/seleccionaractividad.jsp">
                          					<input type="hidden" name="codigoA" value="<%=((ResultadoActivoBeanData)resultadosActivos.get(i)).getCodigo()%>"></input>
										<i class="icon-list icon-white"></i>
Visualizar
                          				</a>
                          				 
                          				<a class="btn btn-primary iframe"
                          					href="../activo/seleccionaractivo.jsp">
                          					<input type="hidden" name="codigoActivo" value="<%=((ResultadoActivoBeanData)resultadosActivos.get(i)).getCodigo()%>"></input>
                          					<i class="icon-pencil icon-white"></i>
Dar Check
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
                          	
                          	
                          	
                          	
               <!-- ORDENAR LOS SUBPROCESOS -->
               <%if(tipo.equals("6")){ %>      
               

			  <div class="row-fluid sortable">
			    <div class="box span12">
			      <div class="box-header well" data-original-title>
			        <h2><i class="icon-move"></i> ORDENAR SUBPROCESO</h2>
					</div>
					<div class="box-content">
					
						<form class="form-horizontal" id="frmSubproceso" name="frmSubproceso" method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/subproceso/SMVSubproceso")%>">
			                <input type="hidden" name="accion" value="GuardarOrden"></input>
			                
			                <input type="hidden" name="codigo" value="<%=subproceso.getCodigosubproceso()%>"></input>
			                <input type="hidden" name="nombre" value="<%=subproceso.getNombre()%>"></input>
			                <input type="hidden" name="descripcion" value="<%=subproceso.getDescripcion()%>"></input>
			                <input type="hidden" name="maximoOrden" value="<%=maximoOrden%>"></input>
							<input type="hidden" name="tipo" value="6"></input>
							
						  <fieldset>        
						                                                                        
							  <div class="control-group">                        
                                  <label class="control-label" for="typeahead1">Nombre Subproceso:</label>
                                  <div class="controls">

                                  	<input type="text"  class="span6 typeahead" id="txtSubproceso" name="txtSubproceso" data-provide="typeahead" disabled value="<%=subproceso.getNombre()%>">
                                  
                                  </div>
                              </div>                              					
                        
                        
                        <div class="control-group">
							<label class="control-label" for="typeahead6">Nuevo Orden: </label>
						<div class="controls">			 			
				            	<input class="span1" type="number" name="txtNroOrden" id="txtNroOrden" min="1" max=<%=maximoOrden %> step="1" value="<%=subproceso.getOrden()%>" >
			 			</div>
			 			<br>
                        </div> 
                              
			            <div class="form-actions">
			              <button type="submit" class="btn btn-primary" onclick="javascript:alt_guardar_orden()">
			              <i class="icon-check icon-white"></i> Guardar</button>

		                </div>

		              </fieldset>
		            </form>
		          </div>
		        </div>
				
			    <!--/span-->
		      </div>


	
				<%} %>          	
      		


			</div><!--/#content.span10-->

		<hr>

		<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">X—</button>
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





</body>
</html>
