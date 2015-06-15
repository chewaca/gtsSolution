<%@page import="java.text.SimpleDateFormat"%>
<%@page import="GtsSoftware.general.Constants"%>
<%@page import="GtsSoftware.activo.TipoActivoBeanData"%>
<%@page import="GtsSoftware.proveedor.ProveedorBeanData"%>
<%@page import="GtsSoftware.local.LocalBeanData"%>
<%@page import="GtsSoftware.activo.ResultadoActivoBeanData"%>
<%@page import="java.util.Vector"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="css/popups.css" rel="stylesheet">
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
	
	function alt_dar_de_baja(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="DarDeBaja";
		form.tipo.value="1";
		form.codigo.value=cod;
		form.submit();
	}
	
	function alt_modificar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Modificar";
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

<jsp:useBean id="ubicacion" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="estado" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="esconder" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="tipoActivosData" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultados" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosLocales" scope="session" class="java.util.Vector"></jsp:useBean>	
<jsp:useBean id="proveedoresData" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="localesData" scope="request" class="java.util.Vector"></jsp:useBean>	
<jsp:useBean id="criterio" scope="request" class="GtsSoftware.activo.CriterioActivoBeanData"></jsp:useBean>	

			<!-- content starts -->

			<div class="row-fluid sortable">
				
			<!-- content starts -->
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-search"></i> BUSCAR ACTIVO</h2>
                        <div  align="right">
                       <a class="btn btn-primary" onclick='window.open("/GtsSoftware/Gts/activo/includes/uploadDocument.jsp","name","height=570,width=530");'> <i class="icon-file icon-white"></i> Subir documento</a> 
                            <!-- <input id="fileToLoad" name="fileToLoad" type="file" class="form_1"/> -->
                               <a class="btn btn-primary" href="/GtsSoftware/Gts/activo/agregaractivo.jsp"> <i class="icon icon-add icon-white"></i> AGREGAR ACTIVO </a> 
                               <a href="#" class="btn btn-minimize btn-round" ><i class="icon icon-chevron-up"></i></a>
                         </div>             
				  </div>
				  
				  <% if(esconder.equals("ACTIVO")){%>
				  <div class="box-content" hidden="">
				  <%}else{ %>
					<div class="box-content">
				  <%} %>
						<form class="form-horizontal2" name="frmCriteriosBusqueda" id="frmCriteriosBusqueda"  method="POST" action="<%= response.encodeURL("SMVActivo")%>">
						   <input type="hidden" name="accion" value="Buscar"/></input>
						  <fieldset>
						  
						   <% if (criterio.getNombre()!=null){
                          		Integer valor=1;    }
					       	  if (criterio.getNombre()==null)
         						criterio.setNombre(""); 
                          	%>
						  
						    <div class="control-group">						    
						     <div class="control-group">
							    <label class="control-label" for="typeahead6">Nombre: </label>
							    <div class="controls">
							      <input type="text" class="span3 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" data-items="4" value="<%=criterio.getNombre()%>">
						        </div>
						      </div>
						      
						      <% if (criterio.getNumeroSerie()!=null){
                          		Integer valor=1;    }
					       	  if (criterio.getNumeroSerie()==null)
         						criterio.setNumeroSerie(""); 
                          	%>
						      
						      <div class="control-group">
							    <label class="control-label" for="typeahead6">Número Serie: </label>
							    <div class="controls">
							      <input type="text" class="span2 typeahead" id="txtNumeroSerie" name="txtNumeroSerie" data-provide="typeahead" data-items="4" value="<%=criterio.getNumeroSerie()%>">
						        </div>
						      </div>
						      
						      <div class="control-group">
								<label class="control-label" for="selectU">Ubicación :</label>
								<div class="controls">
								  <select data-rel="chosen" id="cmdUbicacion" name="cmdUbicacion">  
									<option value="0">Todos</option>
									<%if (ubicacion.equals("")){ %>
									<% for(int i=0;i<resultadosLocales.size();i++){%>
									<option value="<%=((LocalBeanData)resultadosLocales.get(i)).getCodigo() %>" ><%=((LocalBeanData)resultadosLocales.get(i)).getNombre()%></option>
									<%}
									}else{%>
									<% for(int i=0;i<resultadosLocales.size();i++){%>
									<option value="<%=((LocalBeanData)resultadosLocales.get(i)).getCodigo() %>" <%=(Integer.parseInt(ubicacion)-1==i)?"selected":""%>><%=((LocalBeanData)resultadosLocales.get(i)).getNombre()%></option>
									<%} 
									}%>			
								  </select>
								</div>
							  </div> 
						      						    
							  <div class="control-group">
								<label class="control-label" for="selectError">Estado:</label>
								<div class="controls">
								  <select id="cmdEstado" name="cmdEstado" data-rel="chosen" style="width:230px">	  
									<option value="0">Todos</option>
									<option value="<%=Constants.OPER_CALIBRADO%>" <%=estado.equals("1")?"selected":""%> >Operativo calibrado</option>
									<option value="<%=Constants.OPER_NO_CALIBRADO%>" <%=estado.equals("2")?"selected":""%> >Operativo no calibrado</option>
									<option value="<%=Constants.OPER_PAR_CALIBRADO%>" <%=estado.equals("3")?"selected":""%> >Operativo par. calibrado</option>
									<option value="<%=Constants.OPER_PAR_NO_CALIBRADO%>" <%=estado.equals("4")?"selected":""%> >Operativo par. no calibrado</option>
									<option value="<%=Constants.INOP_POR_INSUMO%>" <%=estado.equals("5")?"selected":""%> >Inoperativo por insumo</option>
									<option value="<%=Constants.INOP_POR_MANTENIMIENTO%>" <%=estado.equals("6")?"selected":""%> >Inoperativo por mantenimiento</option>
									<option value="<%=Constants.INOP_POR_REPUESTO%>" <%=estado.equals("7")?"selected":""%> >Inoperativo no repuesto</option>
									<option value="<%=Constants.DE_BAJA%>" <%=estado.equals("8")?"selected":""%> >De baja</option>						
								  </select>
								</div>
							  </div>
						    </div>
						    <div class="form-actions">
						    <button type="submit" class="btn btn-primary">
						    <i class="icon-search icon-white"></i>Buscar</button>
						    <button type="reset" class="btn btn-primary">
						    <i class="icon-search icon-white"></i>Limpiar</button>			    
							</div>
						  </fieldset>
					  </form>   
				  </div>
				</div><!--/span-->

			</div><!--/row-->

    
					<!-- content ends -->
			</div><!--/span-->
			
			
			<form id="frmAlternativo" name="frmAlternativo" method="POST" action="SMVActivo">
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
							  	  <th width="4%%">N°</th>
							  	  <th width="10%">Núm. Serie</th>
							  	  <th width="10%">Cod. Patrimonial </th>
								  <th width="15%">Nombre</th>
								  <th width="13%">Proveedor</th>
<!-- 								  <th width="8%">Monto Compra</th>
								  <th width="7%">Tipo Moneda</th> -->
								  <th width="16%">Ubicación</th>
								  <th>Operación</th>

							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 

						  <%SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy"); 
                          			for(int i=0;
                          			i<resultados.size();i++){
                             %>
                             	
                            
							 <tr>
<%-- 					       <% if (((ResultadoActivoBeanData)resultados.get(i)).getTipoMoneda()==1){
                          		((ResultadoActivoBeanData)resultados.get(i)).setTipoMonedaLetra("Soles");    }
					       	  if (((ResultadoActivoBeanData)resultados.get(i)).getTipoMoneda()==2)
         						((ResultadoActivoBeanData)resultados.get(i)).setTipoMonedaLetra("Dólares");
					         if (((ResultadoActivoBeanData)resultados.get(i)).getTipoMoneda()==3)
         						((ResultadoActivoBeanData)resultados.get(i)).setTipoMonedaLetra("Euros"); 
                          	%> 	 --%>
                          								
							<td class="center">
                          				<%=
                          					i+1
                          				%>
                          	</td>
                          	
                          	<td class="center">
                          				<%=
                          						((ResultadoActivoBeanData)resultados.get(i)).getNumeroSerie()
                          				%>
                          	</td>
                          	
                          	<td class="center">
                          				<%=((ResultadoActivoBeanData)resultados.get(i)).getCodigoPatrimonial()%>
                          	</td>
                          	
     
                          	 <td class="center">
                          				<%= ((TipoActivoBeanData)tipoActivosData.get(i)).getNombre()%>	
                          	</td>
							
							
							<%  
							if ((((ProveedorBeanData)proveedoresData.get(i)).getRazonSocial())!=null) {%>
							
                          	<td class="center">
                          				<%=((ProveedorBeanData)proveedoresData.get(i)).getRazonSocial()%>                          				
                          	</td>
                          	<%  } 
                          	else {%>
                          	 <td class="center">
                          				<%= ""%>    				
                          	</td>
                          	
                          	<% } %>
<%--                           	 <td class="center">
                          				<%=((ResultadoActivoBeanData)resultados.get(i)).getMontoCompra()%>                   				                        				
                          	</td>
                          	
                          	 <td class="center">
                          				<%=
                          					((ResultadoActivoBeanData)resultados.get(i)).getTipoMonedaLetra()
                          				%>
                          	</td> --%>
                          	
                          	                     	
							<%  
							if ((((LocalBeanData)localesData.get(i)).getNombre())!=null) {%>

                          	 <td class="center">
                          				<%=((LocalBeanData)localesData.get(i)).getNombre()%>
                          	</td>    

                          	<%  } 
                          	else {%>
                          	
                          	
                          	 <td class="center">
                          				<%= ""%>    				
                          	</td>
                          	
                          	<% } %>

                          	
                          	        <td class="center">
                          				<button class="btn btn-primary" 
                          					onclick="javascript:alt_consultar(<%=((ResultadoActivoBeanData)resultados.get(i)).getCodigo()%>)" >
                          					<i class="icon-zoom-in icon-white"></i> Visualizar
                          				</button>
                          				
                          				<button class="btn btn-primary" 
                          					onclick="javascript:alt_modificar(<%=((ResultadoActivoBeanData)resultados.get(i)).getCodigo()%>)" >
                          					<i class="icon-zoom-in icon-white"></i> Modificar
                          				</button>
                          				
                          				<%
                          				//Si el estado =8 es porque el equipo esta deshabilitado, por eso se deshabilita el boton dar de baja
                          				Integer estadoA=((ResultadoActivoBeanData)resultados.get(i)).getEstado();
                          				%>
                          				
                          				<button class="btn btn-primary" <% if (estadoA==8) %> disabled <% %>
                          					onclick="javascript:alt_dar_de_baja(<%=((ResultadoActivoBeanData)resultados.get(i)).getCodigo()%>)">
                          					<i class="icon-trash icon-white"> </i>Dar de baja
                          				</button>

                          			</td> 
                          	
							<%}%>
					       </tbody>
					       </element>
					  </table>            
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
                </form> 
                
	
	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	
	<script src="js/dialog.js"></script>
	
<c:choose>
	<c:when test="${mensaje=='OK'}">
		<script type="text/javascript">$(function() { dlgSuccess.open(); });</script>
	</c:when>
	<c:when test="${mensaje=='Error'}">
		<script type="text/javascript">$(function() { dlgError.open(); });</script>
	</c:when>	
	<c:otherwise>
	</c:otherwise>
</c:choose>
	
<div id="dlgSuccess">
	<div class="wrapper_pop_ups">
		<div class="titular"><img align="middle" src="img/gts_solution.png"/></div>
		<div class="titular">Se agrego correctamente</div>
		<div class="caja">
			<img src="img/icon_check.png" class="icons">
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
		<div class="titular"><img align="middle" src=""/></div>
		<div class="titular"><img src="">Error al subir</div>
		<br>
		<textarea disabled="disabled" rows="4" cols="50" style="resize:none">Motivo: ${mensaje} 
		</textarea> 
		<br/><br/>			
		<div >
			<div >
				<div class="botonAction bRosado" style="margin-left: auto; margin-right: auto;" onclick="dlgError.close();">Continuar</div>
			</div>
		</div>
			
	</div>
</div>	
    
<!-- content ends -->