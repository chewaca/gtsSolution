
<div id="toppanel">
	<div id="panel">
		<div class="content clearfix">
			<div class="left">
				<h1>Bienvenido a GTS ******</h1>
<!--			<h2>Sliding login panel Demo with jQuery</h2>		-->
<!--				<p class="grey">You can put anything you want in this sliding panel: videos, audio, images, forms... The only limit is your imagination!</p>
				<h2>Download</h2>-->
		   <!-- <p class="grey">To download this script go back to <a href="http://web-kreation.com/index.php/tutorials/nice-clean-sliding-login-panel-built-with-jquery" title="Download">article &raquo;</a></p> -->
			</div>
			<div class="left right">
				<!-- Login Form -->
				<form class="clearfix" action="<%= response.encodeURL(request.getContextPath()+"/IngSoft/general/GENLogin")%>" method="post">
				<input type="hidden" name="accion" value="Login"></input>
					<h1>Login </h1>
					<label class="grey" for="log">Usuario:</label>
					<input class="field" type="text" name="username" id="username" value="" size="23" />
					<label class="grey" for="pwd">Contrase&ntilde;a:</label>
					<input class="field" type="password" name="password" id="password" size="23" />	           
        			<div class="clear"></div>
					<input type="submit" name="submit" value="Ingresar" class="bt_login" />
				</form>
			</div>
		 	<div class="left right">			
				<!--Login para empresas-->
				<form class="clearfix" action="#" method="post">
					<h1>Login Corporativo</h1>
					<label class="grey" for="log">Usuario:</label>
					<input class="field" type="text" name="log" id="log" value="" size="23" />
					<label class="grey" for="pwd">Contrase&ntilde;a:</label>
					<input class="field" type="password" name="pwd" id="pwd" size="23" />	            	
        			<div class="clear"></div>
					<input type="submit" name="submit" value="Ingresar" class="bt_login" />					
				</form>
			</div>
		</div>
</div> <!-- /login -->	

	<!-- The tab on top -->	
	<div class="tab">
		<ul class="login">
			<li class="left">&nbsp;</li>
			<li>Hola No !</li>
			<li class="sep">|</li>
			<li id="toggle">
				<a id="open" class="open" href="#" style="font-size:90%">Log In| Registrarse</a>
				<a id="close" style="display: none;" class="close" href="#">Cerrar Panel</a>			
			</li>
			<li class="right">&nbsp;</li>
		</ul> 
	</div> <!-- / top -->
	
</div> <!--panel -->
