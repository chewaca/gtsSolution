function alfanumerico(e) 
{ 
var key = window.event.keyCode || event.keyCode;
return ((key >= 48 && key <= 57) ||(key >= 97 && key <= 122) ||(key >= 65 && key <=90) ||(key >= 192 && key <=246)||(key <=13) ||(key ==32));
} 

function alfabetico(e) 
{ 
var key = window.event.keyCode || event.keyCode;
return ((key >= 97 && key <= 122) ||(key >= 65 && key <=90) ||(key >= 192 && key <=246)||(key <=13) ||(key ==32));
} 

function numerico(e) 
{ 
var key = window.event.keyCode || event.keyCode;
return ((key >= 48 && key <= 57) || (key <=13));
} 

function filtrar(mod,obj,num){
	var temp=obj.val();
	var a=temp.length;					
	var b="";
	for(i=0;i<a;i++){
		if(mod.indexOf(temp.charAt(i))>=0 ) b=b.concat(temp.charAt(i));									
	}
	if(b.length>num) b= b.substring(0,num);
	obj.val(b);
	
}