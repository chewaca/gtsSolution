function esValidoCorreo(valor)
{
	var reg=/(^[a-zA-Z0-9._-]{1,30})@([a-zA-Z0-9.-]{1,30}$)/;
	if(reg.test(valor)) return true;
	else return false;
}

function esCorrecto(valor,minimo, maximo){
	
	if(valor.length>maximo){ 
		return false;
	}else{
		if(valor.length<minimo){
			return false;
		}else{
			return true;	
		}

	}

}


function validaLongitudMaxima(valor, maximo){
if(valor.value.length>=maximo) return false;else return true;
}

function esFloat(numero)
{
var re = /^([0-9])*[.]?[0-9]*$/;
  if (!re.test(numero)){
	  return false;
   }else{
   return true;
   
   }
}


function esEntero(valor) {
     var error = '';
     var re = /^[0-9]*$/;
     if (!re.test(valor)) {
         return false;
     }else{
     return true;
	 }
 
}


function numerico(e) 
{ 
var key = window.event.keyCode || event.keyCode;
return ((key >= 48 && key <= 57) || (key <=13));
} 

function generaMensaje(cadena){
	var i;
	var mensaje="Los siguientes campos no han sido llenados correctamente<br>";
	for(i=0;i<cadena.length;i++){
		if(i+1<cadena.length){
			mensaje+=cadena[i]+'.<br> ';
			
		}else{
			mensaje+=cadena[i];
			
		}
		
	}
	return mensaje;
	
}


function crearAlert(cadena){
	mensaje=generaMensaje(cadena);
	$(document).ready(function() {
		apprise(mensaje, {'animate':true}, function(r) {

			if(r) { 
			
			} else { 
		
			}
		});
	});
}

function crearAlert2(cadena){
	$(document).ready(function() {
		apprise(cadena, {'animate':true}, function(r) {

			if(r) { 
			
			} else { 
		
			}
		});
	});
}

function inputRadioLleno(valor){
	var s=0;
	
		for(var i=0;i<valor.length; i++)
		{
			if(valor[i].checked ){
			return true;
				break;
			}
		}
return false;	
}


function alt_fecha(obj){
	obj.value=obj.value.slice(0,5);
	
	}
	
	
	

function validarFechaInicialFechaFinal(comparacion,fecha1,fecha2){
	var fec1=fecha1.value.split("/");
	var fec2=fecha2.value.split("/");
	var resultado=true;
	if(fec1.length==fec2.length) {
		var size=fec1.length;
		for(i=size-1;i>=0;i--){
			if(comparacion==0){
				if(fec1[i].indexOf(fec2[i])<0)  resultado= false;
				}
			if(comparacion==1){
				if(parseInt(fec1[i])<parseInt(fec2[i]))  resultado= false;
				}
			if(comparacion==-1){
				if(parseInt(fec1[i])>parseInt(fec2[i]))  resultado= false;
				}
			}
		if(resultado==false){	
				fecha1.value=fecha2.value;	
				return false;
			}else{
			return true;}
			
		} 
	else{ 
		return false;		
	}			
}


function validaFecha(fecha){
	var dtCh= "/";
	var minYear=1900;
	var maxYear=2100;
	function isInteger(s){
		var i;
		for (i = 0; i < s.length; i++){
			var c = s.charAt(i);
			if (((c < "0") || (c > "9"))) return false;
		}
		return true;
	}
	function stripCharsInBag(s, bag){
		var i;
		var returnString = "";
		for (i = 0; i < s.length; i++){
			var c = s.charAt(i);
			if (bag.indexOf(c) == -1) returnString += c;
		}
		return returnString;
	}
	function daysInFebruary (year){
		return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
	}
	function DaysArray(n) {
		for (var i = 1; i <= n; i++) {
			this[i] = 31
			if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
			if (i==2) {this[i] = 29}
		}
		return this
	}
	function isDate(dtStr){
		var daysInMonth = DaysArray(12)
		var pos1=dtStr.indexOf(dtCh)
		var pos2=dtStr.indexOf(dtCh,pos1+1)
		var strDay=dtStr.substring(0,pos1)
		var strMonth=dtStr.substring(pos1+1,pos2)
		var strYear=dtStr.substring(pos2+1)
		strYr=strYear
		if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
		if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
		for (var i = 1; i <= 3; i++) {
			if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
		}
		month=parseInt(strMonth)
		day=parseInt(strDay)
		year=parseInt(strYr)
		if (pos1==-1 || pos2==-1){
			return false
		}
		if (strMonth.length<1 || month<1 || month>12){
			return false
		}
		if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
			return false
		}
		if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
			return false
		}
		if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
			return false
		}
		return true
	}
	if(isDate(fecha)){
		return true;
	}else{
		return false;
	}
}




function alfanumerico(e) 
{ 
var key = window.event.keyCode || event.keyCode;
return ((key >= 48 && key <= 57) ||(key >= 97 && key <= 122) ||(key >= 65 && key <=90) ||(key >= 192 && key <=246)||(key <=13) ||(key ==32));
} 	

function isAlfaNum(campo) { 
	var patron=/^w+$/;
	if(!patron.test(campo.value)) false; else true;
}



function MostrarErrorDiv(id){
	document.getElementById(id).style.display='block';	
}
function OcultarErrorDiv(id){
	document.getElementById(id).style.display='none';	
}

function MostrarErrorDivInput(id){
	document.getElementById(id).setAttribute("class", "control-group error");	
}
function MostrarOkDivInput(id){
	document.getElementById("dv"+id).setAttribute("class", "control-group success");
	OcultarErrorDiv("err"+id);
}
function MostrarErrorDivInnerHtml(id,valor){
	document.getElementById(id).innerHTML=valor;	
}
function validarxId(id,mensaje){
	MostrarErrorDivInput("dv"+id);
	MostrarErrorDiv("err"+id);
	MostrarErrorDivInnerHtml("err"+id,mensaje);
}


function validarFechas(nombreFinal, casillaFinal, idFinal,nombreInicial, casillaInicial){
		status=validarFechaInicialFechaFinal(-1,casillaInicial,casillaFinal);
		mensaje="Error al comparar fechas. La Fecha Final debe ser como minimo igual a la Fecha Inicial";
	if(!status){
		validarxId(idFinal,mensaje);
		return 0;
	}else{
		MostrarOkDivInput(idFinal);
		return 1;
	}

}

function esValido(nombre, casilla, id, tipoValidacion, minimo,maximo){
	
	var status;
	switch(tipoValidacion){
		case 1:
			if (minimo==maximo){
				status=esCorrecto(casilla.value,minimo,maximo);
				mensaje="La casilla "+nombre+" debe tener "+minimo+" caracteres";
				break;
			}
			else {
				status=esCorrecto(casilla.value,minimo,maximo);
				mensaje="La casilla "+nombre+" debe tener entre "+minimo+" a "+maximo+" caracteres";
				break;
			}
		case 2:	
			status=esCorrecto(casilla.value,minimo,maximo);
			mensaje="La casilla "+nombre+" no ha sido llenado correctamente";
			break;
		case 3: 
			status=inputRadioLleno(casilla);
			mensaje="La casilla "+nombre+" no ha sido seleccionado";
			break;
		case 4:
			status=isAlfaNum(casilla.value);
			mensaje="La casilla "+nombre+" debe contener solo caracteres alfanumericos";
			break;
		case 5:
			status=esFloat(casilla.value);
			mensaje="La casilla "+nombre+" debe tener un valor entero o decimal";
			break;
		case 6:
			status=esEntero(casilla.value);
			mensaje="La casilla "+nombre+" debe tener un valor entero";
			break;
		case 7:
			status=validaFecha(casilla.value);
			mensaje="La casilla "+nombre+" no tiene una fecha valida o no tiene el formato dia/mes/año";
			break;
		case 8:
			status=validarFechaInicialFechaFinal(-1,minimo.value,maximo.value);// esto esta mezclado, no hacer caso a los nombres
			mensaje="Error al comparar fechas. La Fecha Final debe ser como minimo igual a la Fecha Inicial";
			break;
		case 9:
			status=esValidoCorreo(casilla.value);
			mensaje="Correo Electronico Invalido";
	}
	
	if(!status){
		validarxId(id,mensaje);
		return 0;
	}else{
		MostrarOkDivInput(id);
		return 1;
	}
				
}


function limita(area_texto,max)
{
if(area_texto.value.length>=max){area_texto.value=area_texto.value.substring(0,max);}
}


(function () {
    var onload = window.onload;

    window.onload = function () {
        if (typeof onload == "function") {
            onload.apply(this, arguments);
        }

        var fields = [];
        var inputs = document.getElementsByTagName("input");
        var textareas = document.getElementsByTagName("textarea");

        for (var i = 0; i < inputs.length; i++) {
            fields.push(inputs[i]);
        }

        for (var i = 0; i < textareas.length; i++) {
            fields.push(textareas[i]);
        }

        for (var i = 0; i < fields.length; i++) {
            var field = fields[i];

            if (typeof field.onpaste != "function" && !!field.getAttribute("onpaste")) {
                field.onpaste = eval("(function () { " + field.getAttribute("onpaste") + " })");
            }

            if (typeof field.onpaste == "function") {
                var oninput = field.oninput;

                field.oninput = function () {
                    if (typeof oninput == "function") {
                        oninput.apply(this, arguments);
                    }

                    if (typeof this.previousValue == "undefined") {
                        this.previousValue = this.value;
                    }

                    var pasted = (Math.abs(this.previousValue.length - this.value.length) > 1 && this.value != "");

                    if (pasted && !this.onpaste.apply(this, arguments)) {
                        this.value = this.previousValue;
                    }

                    this.previousValue = this.value;
                };

                if (field.addEventListener) {
                    field.addEventListener("input", field.oninput, false);
                } else if (field.attachEvent) {
                    field.attachEvent("oninput", field.oninput);
                }
            }
        }
    }
})();
