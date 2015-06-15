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
	
	function alt_modificar(cod){
		var form=document.getElementById("frmAlternativo");
		form.accion.value="Modificar";
		form.codigo.value=cod;
		form.submit();
	}
	
	
	function alt_guardar_ajustes(){
		var form=document.getElementById("frmActivo");		
		
		var elementos = document.getElementsByName("chboxNombre");
		var k=0;
		
		for (x=0;x<elementos.length;x++){
			if (elementos[x].checked) {
				 k++;
			}
		}
		
		var texto=new Array(k);
		k=0;
		for (x=0;x<elementos.length;x++){
			if (elementos[x].checked) {
				 texto[k]=  elementos[x].value;
				 k++;
			}
		}
		
		if(k!=0){
			form.accion.value="GuardarAjustes";
			form.activoAjuste.value=texto;
			form.submit();
		}
		else
			alert("No se ha seleccionado ningun activo");
	}
	
	</script>	
	
<!--The beans  -->

<jsp:useBean id="tipoActivosData" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="activosData" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosLocalesActivo" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosMarcas" scope="request" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultadosProveedores" scope="request" class="java.util.Vector"></jsp:useBean>


<%SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy");  %>
			<!-- content starts -->

      		<form id="frmActivo" name="frmActivo" method="POST" action="<%= response.encodeURL(request.getContextPath()+"/Gts/activo/SMVActivo")%>">
			 <input type="hidden" name="accion" value="Agregar"></input>
			 <input type="hidden" name="idProveedor" value=""></input>
			 <input type="hidden" name="activoAjuste" value=""></input>	
			 <input type="hidden" name="motivo" value=""></input>			 		 
			 <input type="hidden" name="tipo" value="1"></input>

			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-align-justify"></i> RESULTADOS ACTIVOS</h2>
						<div  align="right">
							   <button type="reset" class="btn" onclick="location.href='buscarinventario.jsp'">
			              			<i class="icon-circle-arrow-left icon-black"></i> Regresar</button>
                               <a class="btn btn-primary" onclick="javascript:alt_guardar_ajustes()"> <i class="icon icon-add icon-white"></i> Guardar</a> 
                        </div>
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
								  <th width="9%">Estado</th> 
								  <th width="25%">Selección/Motivo</th>

							  </tr>
						  </thead>  
						  
						  <element>
					      <tbody id="resultadobusqueda"> 

						  <% for(int i=0;i<activosData.size();i++){
                          				
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
                          	
                          	 <td class="center"><%=((TipoActivoBeanData)tipoActivosData.get(i)).getNombre()%></td>
                          	
                          	 <td class="center"><%=((MarcaBeanData)resultadosMarcas.get(i)).getNombre()%></td>    
                          	
                          	<td class="center"><%=((ProveedorBeanData)resultadosProveedores.get(i)).getRazonSocial()%></td> 
							
							<td class="center"><%=nombreEstado%></td>

                          	<td colspan=2 width="100" align="left" valign="top" >
                          			<input class="checkbox-inline" type="checkbox" name="chboxNombre" id="chboxNombre"  value="<%=((ResultadoActivoBeanData)activosData.get(i)).getCodigo()%>">                          				
                          			&nbsp;<input type="text"  class="text-inline" id="txtMotivo" name="txtMotivo" data-provide="typeahead" >                         	
                          	</td>
  <%} %>                        				


							
					       </tbody>
					       </element>
					  </table>            
					</div>
				</div><!--/span-->
		
			</div><!--/row-->

             </form> 
<!-- content ends -->