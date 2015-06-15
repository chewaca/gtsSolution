<%@page import="GtsSoftware.personal.AreaData"%>
<%@page import="GtsSoftware.personal.CursoData"%>
<%@page import="java.util.Vector"%>
<script>

function alt_submit(){
	if(confirm("¿Seguro que desea agregar un nuevo personal?"))
	{
		var form= document.frmProceso;
		form.submit();	
	}
	return 0;
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57))
      return false;

   return true;
}
</script>
<jsp:useBean id="cmbArea" scope="session" class="java.util.Vector"></jsp:useBean>	
			  <div class="row-fluid sortable" >
			    <div class="box span12">
			      <div class="box-header well" data-original-title>
			        <h2><i class=" icon-user"></i> AGREGAR PERSONAL</h2>
					</div>
					<div class="box-content">
					
						<form class="form-horizontal" id="frmProceso" name="frmProceso" method="POST" action="<%= response.encodeURL("SMVPersonal")%>">
			                <input type="hidden" name="accion" value="Agregar"></input>
							<input type="hidden" name="tipo" value="2"></input>
							
						  <fieldset>                                                                              
							  
							 <span style="display:inline-block">     
							 	<div class="control-group">          
                                  <label class="control-label" for="typeahead1">Nombres: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span8 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" >
                                  </div>         
                                  </div>
                                  <div class="control-group">               	
                                  <label class="control-label" for="typeahead1">Ap. Paterno: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span8 typeahead" id="txtApPaterno" name="txtApPaterno" data-provide="typeahead" >
                                  </div>
                                  </div>             
                                  <div class="control-group">   
                                  <label class="control-label" for="typeahead1">Ap. Materno: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span8 typeahead" id="txtApMaterno" name="txtApMaterno" data-provide="typeahead" >
                                  </div>
                                  </div>
                              </span>
                             <span style="display:inline-block">  
                             	<div class="control-group">                          
                                  <label class="control-label" for="typeahead1">DNI: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtDNI" name="txtDNI"  data-provide="typeahead" maxlength="8" onkeypress="return isNumberKey(event)" >
                                  </div>
                            	</div>
                            	<div class="control-group">   
								<label class="control-label" for="selectError">Sexo:</label>
								<div class="controls">
								  <select id="cmbSexo" name="cmbSexo" data-rel="chosen"  style="resize:none; width: 100px" >	  
									<option value="M">Masculino</option>
									<option value="F">Femenino</option>						
								  </select>
								</div>
								</div>
								<div class="control-group">   
								<label class="control-label" for="selectError">Departamento:</label>
								<div class="controls">
								  <select id="cmbxArea" name="cmbxArea" data-rel="chosen" >	
								  <%for(int i=0;i<cmbArea.size();i++){
		                            	 %>
									<option  value= <%=((AreaData)cmbArea.get(i)).getCodigo()%> >
										<%=
										((AreaData)cmbArea.get(i)).getNombre()
										%>
									</option>
									<%}%>				
								  </select>
								</div>
								</div>
							  </span> 
                              
							  <span style="display:inline-block"> 
							  <div class="control-group">   
		            			<label class="control-label" for="typeahead4">Fecha Nacimiento: </label>
		            		 
				            	<div class="controls">
				             		 <input type="text" class="input-small datepicker" id="fcNacimiento" name="fcNacimiento" maxlength="10">		           		
				            	</div>
			            	    </div>
			            	    <div class="control-group">                    
                                  <label class="control-label" for="typeahead1">Correo: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span10 typeahead" id="txtCorreo" name="txtCorreo" data-provide="typeahead" >
                                  </div>
                                 </div>
                                 </span>
                                 <span style="display:inline-block"> 
                                 <div class="control-group">     
                                  <label class="control-label" for="typeahead1">Teléfono 1: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtTelefono1" name="txtTelefono1"  data-provide="typeahead" maxlength="12" onkeypress="return isNumberKey(event)" >
                                  </div>
                                  </div>
                                  <div class="control-group">            
                                  <label class="control-label" for="typeahead1">Teléfono 2: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span6 typeahead" id="txtTelefono2" name="txtTelefono2"  data-provide="typeahead" maxlength="12" onkeypress="return isNumberKey(event)" >
                                  </div>
                                  </div>
                              </span>
                              
                             <span style="display:inline-block">
                             <div class="control-group">   
                                  <label class="control-label" for="typeahead4">Dirección: </label>
                                  <div class="controls">                   
                                      <textarea id="txtDescripcion" name="txtDireccion" rows="2" cols="1000" style="resize:none; height: 36px; width: 273px"></textarea>
                                  </div>
                                  </div>
                              </span>				
                             	
			          
			            <div class="form-actions">
			              <button type="submit" class="btn btn-primary" onclick="javascript:alt_submit()">
			              <i class="icon-check icon-white"></i> 
			              AGREGAR</button>
			              <button type="reset" class="btn" onclick="location.href='buscarpersonal.jsp'">
			              <i class="icon-circle-arrow-left icon-black"></i>
			              REGRESAR</button>
		                </div>
						
					<div class="control-group">
                  <!--   <label class="control-label" for="typeahead2">(*)Campos Obligatorios </label> -->
                                  
                              </div>
		              </fieldset>
		            </form>
		          </div>
		        </div>
				
			    <!--/span-->
		      </div>
			  <!--/row-->
			  <div class="row-fluid sortable">
			    <!--/span-->
		      </div>
			  <!--/row-->
			  <div class="row-fluid sortable">
			    <!--/span-->
		      </div>
			  <!--/row-->

					<!-- content ends -->


		
	<!--/.fluid-container-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.min.js"></script>
	<script src="js/jquery.flot.pie.min.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="js/charisma.js"></script>
	<script>
	function loadContent() 
{ 
   $("#includedContent").load("menu.html"); 
} 


	</script>
		<script>loadContent()</script> 
</body>
</html>
