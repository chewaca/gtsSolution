<!-- content starts -->
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
			
	<script>
	function alt_fecha(obj){
	obj.value=obj.value.slice(0,5);
	
	}
	
	function alt_submit(){
		var form= document.frmDelete;
		var r=confirm("¿Esta seguro que desea borrar este socio?");
		if(r==true){form.submit();}
	}
	</script>	
	
	<%! public boolean  encontrar(String a, String[] b){
		for(int i=0;i<b.length;i++){			
			if(b[i].equals(a)) return true;	
		}
	return false;
	}
	public String formatear(java.util.Date date){
		SimpleDateFormat DF= new SimpleDateFormat("dd/MM");
		return DF.format(date);
	}
	%>					

<!-- content starts -->
<%-- <jsp:useBean id="socio" scope="request"class="IngSoft.venta.bean.SocioBeanData"></jsp:useBean> --%>

<!-- content starts -->
<%-- <jsp:useBean id="persona" scope="request" class="IngSoft.venta.bean.PersonaMiniBeanData"></jsp:useBean> --%>

			<div>
				<ul class="breadcrumb">
					<li><a href="/Conan3000V2/IngSoft/general/index.jsp">Home / </a>
					<a href="/Conan3000V2/IngSoft/ventas/socio/buscarsocio.jsp">Gestión de Subprocesos / </a>Eliminar Subproceso
			           
			              </li>
				</ul>
			</div>
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2>ELIMINAR SUBPROCESO				  </h2>
				  </div>
					<div class="box-content">
						<form class="form-horizontal" name="frmDelete"  action="<%= response.encodeURL("SMVSubproceso")%>" method="post">
<%-- 						 <input type="hidden" name="codigo" value="<%=socio.getCodigo()%>" ></input> --%>
						<input type="hidden" name="accion" value="Eliminar"></input>
						<input type="hidden" name="tipo" value="2"></input>
						 
						  <fieldset>
						    
						      <div class="control-group">
						        <label class="control-label" for="disabledInput">Nombres:</label>
						        <div class="controls">
<%-- 						          <input class="input-xlarge disabled" value=<%=persona.getNombres() %> id="disabledInput" type="text" placeholder="Disabled input here" disabled=""> --%>
					            </div>
					          </div>
					          
						      <div class="control-group">
						        <label class="control-label" for="disabledInput">Apellido Paterno:</label>
						        <div class="controls">
						          <%-- <input class="input-xlarge disabled" value=<%=persona.getApellidoPaterno() %> id="disabledInput" type="text" placeholder="Disabled input here" disabled=""> --%>
					            </div>
					          </div>
						    
							    <div class="control-group">
							      <label class="control-label" for="disabledInput">Apellido Materno:</label>
							      <div class="controls">
							        <%-- <input class="input-xlarge disabled" value=<%=persona.getApellidoMaterno() %> id="disabledInput" type="text" placeholder="Disabled input here" disabled=""> --%>
						          </div>
						        </div>
						        
						        <div class="control-group">
			              		<label class="control-label" for="typeahead1">Fecha Nacimiento(*): </label>
			              		<div class="controls">
			               		<%--  <input type="text" class="input-xlarge datepicker" id="date020" value=<%=formatear(new Date(persona.getFechaNacimiento().getTime())) %> disabled=""> --%>
			             		</div>
		                		</div>
						        
							   <div class="control-group">
								<label class="control-label" for="typeahead2">Tipo de Documento(*):</label>
								<div class="controls">
								  <label class="radio">
									<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="" disabled="">
									DNI
								  </label>
								  <div style="clear:both"></div>
								  <label class="radio">
									<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2" disabled="">
									Carnet de Extranjeria
								  </label>
								   </div>
								</div>
							  
                              <div class="control-group">
			                          <label class="control-label" for="typeahead3">N&uacute;mero de Documento(*): </label>
			                          <div class="controls">
			                           <%--  <input type="text" class="span6 typeahead" id="typeahead3" value=<%=persona.getNumeroDocumento() %>  data-provide="typeahead" data-items="4" disabled=""> --%>
		                              </div>
                              </div>                            
                             						      
							  <div class="control-group">
							    <div class="control-group">
							      <div class="control-group">
							        <label class="control-label" for="typeahead4">Correo Electronico: </label>
							        <div class="controls">
									   <%--  <input class="input-xlarge disabled" value=<%=socio.getCorreoElectronico() %> id="disabledInput" type="text" placeholder="Disabled input here" disabled=""> --%>
						            </div>
						          </div>
							      <div class="control-group">
							        <label class="control-label" for="disabledInput2">Direcci&oacute;n:</label>
							        <div class="controls">
							         <%--  <input class="input-xlarge disabled" value=<%=socio.getDireccion() %> id="disabledInput2" type="text" placeholder="Disabled input here" disabled=""> --%>
						            </div>
						          </div>
						          
						          
						           <div class="control-group">
						          <label class="control-label" for="typeahead5">Tel&eacute;fono Fijo: </label>
			                        <div class="controls">
			                          <%-- <input type="text" class="span6 typeahead" id="typeahead5"  value=<%=socio.getTelefonoFijo() %> data-provide="typeahead" data-items="4" disabled=""> --%>
		                            </div>
		                            </div>
		                            
		                             <div class="control-group">
		                             <label class="control-label" for="typeahead6">Tel&eacute;fono Celular: </label>
			                        <div class="controls">
			                        <%--   <input type="text" class="span6 typeahead" id="typeahead6"  value=<%=socio.getTelefonoCelular() %> data-provide="typeahead" data-items="4" disabled=""> --%>
		                            </div>
		                            </div>
							    
						        </div>
						    </div>
						    <div class="form-actions">
							  <button type="submit" class="btn btn-primary"  onclick="javascript:alt_submit()">Eliminar</button> 
			               	  <button  type="submit" class="btn" onclick="location.href='buscarsocio.jsp'">Cancelar</button>  
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
