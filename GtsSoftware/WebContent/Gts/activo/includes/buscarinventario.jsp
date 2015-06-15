<%@page import="GtsSoftware.general.Constants"%>
<%@page import="GtsSoftware.marca.MarcaBeanData"%>
<%@page import="GtsSoftware.activo.InventarioActivoBeanData"%>
<%@page import="GtsSoftware.activo.TipoActivoBeanData"%>
<%@page import="GtsSoftware.proveedor.ProveedorBeanData"%>
<%@page import="GtsSoftware.local.LocalBeanData"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="GtsSoftware.activo.ResultadoActivoBeanData"%>
<%@page import="java.util.Vector"%>

<script>
	function alt_fecha(obj){
	obj.value=obj.value.slice(0,5);
	
	}
	
	function alt_cambiar_clase_bueno(elemento){
		if (elemento.className == "btn btn-success") {
			elemento.className = "btn btn-danger";
			elemento.innerHTML=elemento.innerHTML.replace("Conforme","Disconforme");
		}
		else{
			elemento.className = "btn btn-success";
			elemento.innerHTML=elemento.innerHTML.replace("Disconforme","Conforme");			
		}
			
	}
	
	function alt_elementos(){		
		var form=document.getElementById("frmAlternativo");
		
		var elementos=document.getElementsByTagName( "a" );
		var i=0;
		for(var x=0;x<elementos.length;x++){			
			if(elementos[x].className=="btn btn-danger"){
				i++;
			}			
		}
		
		var k=0;
		var texto=new Array(i);
		for(var x=0;x<elementos.length;x++){			
			if(elementos[x].className=="btn btn-danger"){
				texto[k] =  elementos[x].getAttribute("id");
				k++;
			}
		}
		
		if(k!=0){
			form.accion.value="VerElementos";
			form.valores.value=texto;	
			form.submit();
		}
		else{
			alert("Debe haber por lo menos una disconformidad con el inventario");
			//window.location="/GtsSoftware/Gts/activo/buscarinventario.jsp";  	
		}
	}
	
		
	function alt_consultarInventario(cod,codi){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="ConsultarInventario";
		form.codigoLocal.value=cod;
		form.tipo.value="2";
		form.codigoTipoActivo.value=codi;
		form.submit();
	}
	
	
	function alt_modificar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Modificar";
		form.codigo.value=cod;
		form.submit();
	}
	
	</script>	
	
<!--The beans  -->
<jsp:useBean id="tipoActivosData" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultados" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosLocales" scope="session" class="java.util.Vector"></jsp:useBean>	

<jsp:useBean id="esconder" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="tipoActivos" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosMarcas" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosProveedores" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="activosData" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="tipo" scope="request" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="proveedoresData" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="localesData" scope="session" class="java.util.Vector"></jsp:useBean>	


<%SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy");  %>
			<!-- content starts -->

			<div class="row-fluid sortable">
				
			<!-- content starts -->
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-search"></i> BUSCAR INVENTARIO ACTIVO</h2>
						<div  align="right">
                        	<a href="#" class="btn btn-minimize btn-round" ><i class="icon icon-chevron-up"></i></a>	
                    	</div>             
				  	</div>
				  
				  <% if(esconder.equals("ACTIVO")){%>
					<div class="box-content" hidden="">
				  <%}else{ %>
					<div class="box-content">
				  <%} %>
						<form class="form-horizontal" name="frmCriteriosBusqueda" id="frmCriteriosBusqueda"  method="POST" action="<%= response.encodeURL("SMVActivo")%>">
						   <input type="hidden" name="accion" value="BuscarInventario"/></input>
						   <input type="hidden" name="tipo" value="1"></input>
						  <fieldset>
						    <div class="control-group">						    
						      
						      <div class="control-group"><br>
								<label class="control-label" for="selectU">Ubicación :</label>
								<div class="controls">
								  <select data-rel="chosen" id="cmdUbicacion" name="cmdUbicacion">	  
									<option selected value="0">Todos</option>
									<% for(int i=0;i<resultadosLocales.size();i++){%>
									<option value="<%=((LocalBeanData)resultadosLocales.get(i)).getCodigo() %>" <%=i==0?"selected":""%>><%=((LocalBeanData)resultadosLocales.get(i)).getNombre()%></option>
									<%} %>			
								  </select>
								</div>
							  </div> 

						    </div>
						    <div class="form-actions">
						    	<button type="submit" class="btn btn-primary">
						    		<i class="icon-search icon-white"></i> Buscar</button>			    
							</div>
						  </fieldset>
					  </form>   
				  </div>
				</div><!--/span-->

			</div><!--/row-->

    
					<!-- content ends -->
			</div><!--/span-->
			
			
			<% if(tipo.equals("2")||tipo.equals("1")){%>
			<form id="frmAlternativo" name="frmAlternativo" method="POST" action="SMVActivo">
			<input type="hidden" name="accion" value=""></input>
			<input type="hidden" name="valores" value=""></input>
			 <input type="hidden" name="codigoLocal" value=""></input>
			 <input type="hidden" name="codigoTipoActivo" value=""></input>
			 <input type="hidden" name="tipo" value="1"></input>
			  

			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-align-justify"></i> RESULTADOS</h2>
						<div  align="right">
                               <a class="btn btn-primary" onclick="javascript:alt_elementos()"> <i class="icon icon-add icon-white"></i> Modificar</a> 
                        </div>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">

						  <thead>
							  <tr>
							  	  <th width="4%%">N°</th>
								  <th width="25%">Nombre</th>
								  <th width="18%">Ubicación</th>
								  <th width="4%">Cantidad</th>
								  <th>Operación</th>								   
							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 

						  <%   for(int i=0;i<resultados.size();i++){ %>                             	
                            
							 <tr> 							
								<td class="center"><%=i+1%></td>
                          	
                          		<td class="center"><%=((TipoActivoBeanData)tipoActivosData.get(i)).getNombre()%></td>
                          	
                          	 	<td class="center"><%= ((LocalBeanData)localesData.get(i)).getNombre()%></td>
                          	
                          		<td class="center"><%=((InventarioActivoBeanData)resultados.get(i)).getCantidad()%></td>                         	  
   	
                          	        <td class="center">
                          				<a class="btn btn-primary" 
                          					onclick="javascript:alt_consultarInventario('<%=((InventarioActivoBeanData)resultados.get(i)).getIdLocal()%>' , '<%=((InventarioActivoBeanData)resultados.get(i)).getIdTipoActivo()%>')" >
                          					<i class="icon-zoom-in icon-white"></i> Detalle
                          				</a>&nbsp;
                           				<a class="btn btn-success" id="<%=((InventarioActivoBeanData)resultados.get(i)).getIdTipoActivo()%>,<%=((InventarioActivoBeanData)resultados.get(i)).getIdLocal()%>"
                          				 onclick="javascript:alt_cambiar_clase_bueno(this)"> Conforme
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
             <%} %>   
                
                
                
            <!-- PARA VER A LOS ACTIVOS RELACIONADOS -->
			<% if(tipo.equals("2")){%> 
			
      		<form id="frmActivo" name="frmActivo" method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/programacion/SMVProgramacion")%>">
			 <input type="hidden" name="accion" value="Agregar"></input>
			 <input type="hidden" name="idProveedor" value=""></input>			 		 
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
							  	  <th width="10%">Núm. Serie</th>
								  <th width="15%">Nombre</th>
								  <th width="12%">Marca</th>
								  <th width="13%">Proveedor</th>
								  <th width="9%">Vencim. Garantía</th>
								  <th width="9%">Estado</th> 
								  <!-- <th>Operación</th> -->
							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 

						  <%for(int i=0;i<activosData.size();i++){
                          				
                          		Integer estado=((ResultadoActivoBeanData)activosData.get(i)).getEstado();
              					String nombreEstado=null;
              					if(estado==Constants.OPER_CALIBRADO)
              						nombreEstado="Oper. Calibrado";
              					if(estado==Constants.OPER_NO_CALIBRADO)
              						nombreEstado="Oper. No Calibrado";
              					if(estado==Constants.OPER_PAR_CALIBRADO)
              						nombreEstado="Oper. Parc. Calibrado";
              					if(estado==Constants.OPER_PAR_NO_CALIBRADO)
              						nombreEstado="Oper. Parc. No Calibrado";
              					if(estado==Constants.INOP_POR_INSUMO)
              						nombreEstado="Inop. por Insumo";
              					if(estado==Constants.INOP_POR_MANTENIMIENTO)
              						nombreEstado="Inop. por Mantenimiento";
              					if(estado==Constants.INOP_POR_REPUESTO)
              						nombreEstado="Inop. por Repuesto";
              					if(estado==Constants.DE_BAJA)
              						nombreEstado="De Baja";                         				
                          				
                             %>
                       
							 <tr>
					        
							<td class="center"><%=i+1%></td>
                          	
                          	<td class="center"><%=((ResultadoActivoBeanData)activosData.get(i)).getNumeroSerie()%></td>
                          	
                          	 <td class="center"><%=((TipoActivoBeanData)tipoActivos.get(i)).getNombre()%></td>
                          	
                          	 <td class="center"><%=((MarcaBeanData)resultadosMarcas.get(i)).getNombre()%></td>    
                          	
                          	<td class="center"><%=((ProveedorBeanData)resultadosProveedores.get(i)).getRazonSocial()%></td> 
                          	                          	                                                   	
                          	<td class="center"><%=df.format(((ResultadoActivoBeanData)activosData.get(i)).getFechaVencimientoGarantia())%></td> 
                          	
                          	<td class="center"><%=nombreEstado%></td>
  <%} %>                        				
		
					       </tbody>
					       </element>
					  </table>            
					</div>
				</div><!--/span-->
		
			</div><!--/row-->
          </form> 

			<%} %>
                
<!-- content ends -->