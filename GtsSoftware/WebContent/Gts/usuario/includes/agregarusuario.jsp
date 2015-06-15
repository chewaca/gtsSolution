<%@page import="java.text.SimpleDateFormat"%>
<%@page import="GtsSoftware.usuario.ResultadoRol"%>
<%@page import="java.util.Vector"%>
<script>

function alt_submit(){
		var form= document.frmUsuario;
		valida_envia();
					
}
function valida_envia(){
   	if (document.frmUsuario.txtUsuario.value.length==0)
 	{
		alert("usuario no puede quedar en blanco")
		document.frmUsuario.txtUsuario.focus()
                document.frmUsuario.txtUsuario.value = ""
		return 0;
	}

     if (document.frmUsuario.txtContrasenha.value.length==0)
 	{
		alert("contraseña no puede quedar en blanco")
		document.frmUsuario.txtContrasenha.focus()
        document.frmUsuario.txtContrasenha.value = ""
		return 0;
	}
     
    if (document.frmUsuario.txtContrasenha2.value.length==0)
  	{
 		alert("Confirmar contraseña")
 		document.frmUsuario.txtContrasenha2.focus()
        document.frmUsuario.txtContrasenha2.value = ""
 		return 0;
 	}
    if (document.frmUsuario.txtContrasenha2.value != document.frmUsuario.txtContrasenha.value){
    	alert("No coincide contraseña")
    	document.frmUsuario.txtContrasenha2.focus()
        document.frmUsuario.txtContrasenha2.value = ""
    	return 0;
    }
   //el formulario se envia si todo esta correcto	
	document.frmUsuario.submit();

}

</script>
<!--The beans  -->
<jsp:useBean id="cmbRol"  scope="session" class="java.util.Vector"></jsp:useBean>	

			  <div class="row-fluid sortable">
			    <div class="box span12">
			      <div class="box-header well" data-original-title>
			        <h2><i class=" icon-th-large"></i> CREAR USUARIO</h2>
			        <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
					</div>
					<div class="box-content">
					
						<form class="form-horizontal" id="frmUsuario" name="frmUsuario" method="POST" action="<%= response.encodeURL("SMVUsuario")%>">
			                <input type="hidden" name="accion" value="Agregar"></input>
							<input type="hidden" name="tipo" value="2"></input>
							<input type="hidden" name="txtCodigoPersonal" value="0"></input>
						  <fieldset>                                                                              
							  
							  <div class="control-group">                        
                                  <label class="control-label" for="typeahead1">Nombre de Usuario: </label>
                                  <div class="controls">
                                  	<input type="text"  class="span3 typeahead" id="txtNombre" name="txtNombre" data-provide="typeahead" required>
                                  </div>
                              </div>
                         	 <div class="control-group">
								<label class="control-label" for="selectError">Rol:</label>
								<div class="controls">
								  <select id="cmbxRol" name="cmbxRol" data-rel="chosen" >	
								  <%for(int i=0;i<cmbRol.size();i++){
		                             %>  
									<option value= <%=((ResultadoRol)cmbRol.get(i)).getCodigo()%> >
										<%=
										((ResultadoRol)cmbRol.get(i)).getNombre()
										%>
									</option>
									<%}%>				
								  </select>
								</div>
							  </div>

                             <div class="control-group">  
                                  <label class="control-label" for="typeahead4">Contraseña: </label>
                                  <div class="controls">                   
                                      <input id="txtContrasenha" name="txtContrasenha" type="password" class="span3 typeahead" required>
                                  </div>
                              </div>
                              <div class="control-group">  
                                  <label class="control-label" for="typeahead4">Confirmar Contraseña: </label>
                                  <div class="controls">                   
                                      <input id="txtContrasenha2" name="txtContrasenha2" type="password" class="span3 typeahead" required>
                                  </div>
                              </div>						
			          
			            <div class="form-actions">
			              <button type="submit" class="btn btn-primary" onclick="javascript:alt_submit()">
			              <i class="icon-check icon-white"></i> 
			              AGREGAR</button>
			              <button type="reset" class="btn" onclick="location.href='buscarusuario.jsp'">
			              <i class="icon-circle-arrow-left icon-black"></i>
			              Regresar</button>
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

				
		<hr>

		<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">Ã—</button>
				<h3>Settings</h3>
			</div>
			<div class="modal-body">
				<p>Here settings can be configured...</p>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">Close</a>
				<a href="#" class="btn btn-primary">Save changes</a>
			</div>
		</div>

		
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
