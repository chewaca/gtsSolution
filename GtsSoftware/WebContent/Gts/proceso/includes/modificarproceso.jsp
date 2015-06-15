			<!-- content starts -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>			
			
		<script>

		function alt_fecha(obj){
		obj.value=obj.value.slice(0,5);
	
		}
	
		function alt_submit(){
		var form= document.frmUpdate;
		//if(validaForm()) form.submit();
		form.submit();
		}
		
	</script>	

	<%! public boolean  encontrar(String a, String[] b){
		for(int i=0;i<b.length;i++){			
			if(b[i].equals(a)) return true;	
		}
	return false;
	}
	public String formatear(java.util.Date date){
		SimpleDateFormat DF= new SimpleDateFormat("dd/MM/yyyy");
		return DF.format(date);
	}
	
	public String generarCadena(String[] t){
		String a="";
		for(int i=0;i<t.length;i++)
			a= a.concat(t[i]+"/");
			if(a.length()>0) a=a.substring(0, a.length()-1);
		return a;
	}
	%>
	
	<!--The beans  -->
	<jsp:useBean id="proceso" scope="request" class="GtsSoftware.proceso.ProcesoBeanData"></jsp:useBean>					

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
						<h2>MODIFICAR  PROCESO				  </h2>
				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmUpdate" method="Post" action="<%= response.encodeURL("SMVProceso")%>">
						  <input type="hidden" name="codigo" value="<%=proceso.getCodigo()%>"></input>
			       		  <input type="hidden" name="accion" value="Modificar"></input>
					      <input type="hidden" name="tipo" value="2"></input>
					
						  
						  <fieldset>
						  	
						  	<div class="control-group">
						      <label class="control-label" for="typeahead7">Nombre: </label>
						      
						      <div class="controls">
						       <input type="text" class="span6 typeahead" id="txtNombreSocio"  data-provide="typeahead"  name="txtNombre" value="<%=proceso.getNombre()%>">
					          </div>
					        </div>
					        

							  <div class="control-group">
							  <label class="control-label" for="typeahead8">Fecha Inicio:</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="fFechaInicio" name="fFechaInicio" value="<%=formatear(new Date(proceso.getFechaInicio().getTime())) %>">
							  </div>
							</div>
							
							 <div class="control-group">
							  <label class="control-label" for="typeahead9">Fecha Fin:</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="fFechaFin" name="fFechaFin" value="<%=formatear(new Date(proceso.getFechaFin().getTime())) %>">
							  </div>
							</div>
							
							<div class="control-group">  
                                  <label class="control-label" for="typeahead10">Descripción: </label>
                                  <div class="controls">                   
                                      <textarea id="txtDescripcion" name="txtDescripcion" rows="3" cols="1000" style="resize:none; height: 74px; width: 273px"><%=proceso.getDescripcion()%></textarea>
                                  </div>
                              </div>

							<div class="control-group" >
								<label class="control-label" for="typeahead13">Estado :</label>
								<div class="controls">
								  <label class="radio">
									<input type="radio" name="rButton" id="optionsRadios1" value="Activo" <% if(proceso.getEstado()==1){ %> checked <%}%>>
									Activo
								  </label>
								  <div style="clear:both">
								  <label class="radio">
									<input type="radio" name="rButton" id="optionsRadios2" value="Inactivo" <% if(proceso.getEstado()==2){ %> checked <%}%>>
									Inactivo
								  </label>
								  
								  </div>
								</div>
							  </div>			    

						    <div class="form-actions">
						        <button  type="submit" class="btn btn-primary" onclick="javascript:alt_submit()"> 
						       <i class="icon-check icon-white"></i> 
						        Guardar </button>  
			               <button type="button" class="btn" onclick="location.href='buscarproceso.jsp'"> 
			               <i class="icon-circle-arrow-left icon-black"></i>
			               Regresar </button>  
						    							 
							</div>
						  </fieldset>
					  </form>   
		
				  </div>
				</div><!--/span-->

			</div><!--/row-->


			<div class="row-fluid sortable"><!--/span-->
			
			</div><!--/row-->
			
			<div class="row-fluid sortable"><!--/span-->

			</div><!--/row-->
    
					<!-- content ends -->
