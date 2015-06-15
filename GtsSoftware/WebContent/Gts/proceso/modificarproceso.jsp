<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/Gts/general/header.jsp" />
<link rel="shortcut icon" href="img/LogoGTS2.png">
</head>
<body>
		<jsp:include page="/Gts/general/superior.jsp" /> 
		<div class="container-fluid">
			<div class="row-fluid">
				<jsp:include page="/Gts/general/leftmenu3.jsp" />
				<jsp:include page="/Gts/general/noscript.jsp" />
				<div id="content" class="span10">
				    <!-- content starts -->
				   <jsp:include page="includes/modificarproceso.jsp" />
				    <!-- content ends -->
				</div>
			 </div>
		<hr>
			<jsp:include page="includes/modal.jsp" />
			<jsp:include page="/Gts/general/footer.jsp" />
		</div>
		<jsp:include page="/Gts/general/jsexternal.jsp" />
		<script type="text/javascript" src="js/apprise-1.5.full.js"></script>
		
		<script>
			$(document).ready(function(){
				//Examples of how to assign the Colorbox event to elements
				
				$(".iframe").colorbox({iframe:true, width:"60%", height:"80%"});
				
				//Example of preserving a JavaScript event for inline calls.
				$("#click").click(function(){ 
					$('#click').css({"background-color":"#f00", "color":"#fff", "cursor":"inherit"}).text("Open this window again and this message will still be here.");
					return false;
				});
			});
		</script>
<link rel="stylesheet" href="css/apprise.css" type="text/css" />
<script type="text/javascript" src="js/script.js"></script>
		<script>


function validaForm(){
	/*
	esValido(nombre, casilla, id, tipoValidacion, minimo,maximo)
	nombre: es el nombre de la casilla: ejemplo -> Nombre, Apellido, Fecha de Nacimiento, etc
	casilla: corresponde a la casilla en si, para esto colocamos por ejemplo form.txtNombre, donde form ya fue definido
	id: identificador de los divs para efectuar las validaciones
	tipoValidacion: es un valor numerico el cual permite identificar el tipo de validacion que se efectuara
	1: Validacion con cantidad de caracteres Minimo y maximo
	2: Validación de cantidad de caracteres de fecha
	3: validacion de llenado de radio button
	4: Validacion de alfanumerico
	5: validacion de valores Float
	6: Validacion de enteros
	7: Validacion de fechas
	9: Validacion de correo
	minimo: valor numerico que indica la menor cantidad de caracteres que como minimo debe ser llenado (Solo para tipoValidacion 1 y 2, en el resto poner 1)
	maximo: valor numerico que indica la maxima cantidad de caracteres que como maximo debe ser llenado (Solo para tipoValidacion 1 y 2, en el resto poner 1)
	
	El valor que va en cadena[i] es el nombre del campo
	
	#############################ADICIONAL#########################
	Para validar una fecha Inicial y fecha Final usar la siguiente funcion
	validarFechas(nombre[Fecha Final], casilla[Fecha Final], id[Fecha Final],nombre[Fecha Inicial],casilla[Fecha Inicial])
	OJO: no va como parametro el id de la fecha Inicial
	###############################################################
	
	*/
	
	
	var form=document.frmUpdate;

	var cadena= new Array();
	var i=0;
	var error=false;
	if(!esValido("Nombres",form.txtNombres,"Nombres",1,1,50)){cadena[i]="Nombres";i++;}
	if(!esValido("Apellido Paterno",form.txtApellidoPaterno,"ApellidoP",1,1,50)){cadena[i]="Apellido Paterno";i++;}
	//if(!verificar_fecha(-1,form.fFechaInicio,form.fFechaFin)){cadena[i]="Fecha Fin";i++;};
	if(!esValido("Apellido Materno",form.txtApellidoMaterno,"ApellidoM",1,1,50)){cadena[i]="Apellido Materno";i++;}
	if(!esValido("Direccion",form.txtDireccion,"Direccion",1,1,100)){cadena[i]="Direccion";i++;}
	if(!esValido("Numero Documento",form.txtNumeroDocumento,"NumDoc",1,1,9)){cadena[i]="Numero de documento";i++;}else{
		if(!esValido("Numero Documento",form.txtNumeroDocumento,"NumDoc",6,1,50)){cadena[i]="Numero de documento";i++;}
	}
	
	if(!esValido("Telefono Fijo",form.txtTelefonoFijo,"TelefonoFijo",1,1,7)){cadena[i]="Telefono Fijo";i++;}else{
		if(!esValido("Telefono Fijo",form.txtTelefonoFijo,"TelefonoFijo",6,1,50)){cadena[i]="Telefono Fijo";i++;}
	}
	if(!esValido("Telefono Celular",form.txtTelefonoCelular,"Celular",1,1,9)){cadena[i]="Telefono Celular";i++;}else{
		if(!esValido("Telefono Celular",form.txtTelefonoCelular,"Celular",6,1,50)){cadena[i]="Telefono Celular";i++;}
	}
	
	if(!esValido("Correo Electronico",form.txtCorreoElectronico,"CorreoE",9,1,50)){cadena[i]="Correo Electronico";i++;}
	if(!esValido("Fecha",form.fFechaNacimiento,"Fecha",2,1,10)){cadena[i]="Fecha de Nacimiento";i++;}
	if(!esValido("Tipo de Documento",form.rButton,"Tipo",3,1,100)){cadena[i]="Tipo de Documento";i++;}
	
	
	//No tocar
	if(i>0){
	crearAlert(cadena);
	return false;
	}else{
		return true;
		
	}

}


function inicializa(){
	document.getElementById("errNombres").style.display='none';
	document.getElementById("errApellidoP").style.display='none';
	document.getElementById("errApellidoM").style.display='none';
	document.getElementById("errFecha").style.display='none';
	document.getElementById("errTipo").style.display='none';
	document.getElementById("errCorreoE").style.display='none';
	document.getElementById("errNumDoc").style.display='none';
	document.getElementById("errDireccion").style.display='none';
	document.getElementById("errTelefonoFijo").style.display='none';
	document.getElementById("errCelular").style.display='none';
	
}



inicializa();

</script>
		
		
</body>
</html>


