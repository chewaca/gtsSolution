var dlgSuccess = {
		open : function() { $("#dlgSuccess").dialog('open'); },
		close : function() { $("#dlgSuccess").dialog('close'); }
	};

	var dlgError = {
			open : function() { $("#dlgError").dialog('open'); },
			close : function() { $("#dlgError").dialog('close'); }
		};

	$(document).ready(function(){
		
		$("#dlgSuccess").dialog({
			width : 480,
			heigth : 300,
			modal : true,
			autoOpen : false,
			resizable : false,
			open : function() {$(".ui-dialog-titlebar").css('display', 'none'); },
			close : function() {$(".ui-dialog-titlebar").css('display', '');}
		});
		
		$("#dlgError").dialog({
			width : 480,
			heigth : 300,
			modal : true,
			autoOpen : false,
			resizable : false,
			open : function() {$(".ui-dialog-titlebar").css('display', 'none'); },
			close : function() {$(".ui-dialog-titlebar").css('display', '');}
		});
			
	});