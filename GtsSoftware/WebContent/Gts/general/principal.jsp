
<%@page import="java.util.Vector"%>
<%@page import="GtsSoftware.subproceso.ResultadoSubprocesoBeanData"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="GtsSoftware.proceso.ResultadoProcesoBeanData"%>

	    		<script>

		function alt_fecha(obj){
		obj.value=obj.value.slice(0,5);
		}
		
		function alt_agregar(){
			var form=document.getElementById("frmAlternativo");
			form.accion.value="Agregar";
			form.submit();
		}
		function alt_programar(){
			var form=document.getElementById("frmAlternativo");
			form.accion.value="Programar";
			form.submit();
		}
		
		function alt_seleccionar(){
			var form=document.getElementById("frmSeleccionar");
			form.accion.value="Seleccionar";
			//form.tipo.value="2";
			form.submit();
		}
		
		function alt_submit(){
		var form= document.frmAlternativo;
		//if(validaForm()) form.submit();
		form.submit();
		}
		
	</script>	
<jsp:useBean id="resultadosNivelDos" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="resultados" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="matrizSubprocesos" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="tamanho" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="tamanhoAcumulado" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="indicepadre" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="suspadres" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="nivel2" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="nivel3" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="nivel4" scope="session" class="java.util.Vector"></jsp:useBean>
<jsp:useBean id="nivel5" scope="session" class="java.util.Vector"></jsp:useBean>

<%-- <jsp:useBean id="resultadosNivelInferior" scope="session" class="java.util.Vector"></jsp:useBean> --%>
<div class="span2 main-menu-span">
<form class="form-horizontal" name="frmAlternativo" id="frmAlternativo" method="Post" action="<%= response.encodeURL("SMVProceso")%>">
<ul id="files">

    <% %>
	<li><a href=#><input type="checkbox"><%=((ResultadoProcesoBeanData)resultados.get(0)).getNombre()%></a>
		
		<%-- <%}%> --%>
		
		<ul>
		
				<% 
				    
					for(int i=0;i<indicepadre.size();i++){
					if(i<resultadosNivelDos.size()){ %>
			<li><a href="#"><input type="checkbox"><%=((ResultadoSubprocesoBeanData)resultadosNivelDos.get(i)).getNombre()%></a>	
				
					<%} %>
				<ul>
				

				<%  	if(i<nivel2.size()){
						for(int j=i;j<nivel2.size();j++){
							Integer tamano=0;
							Integer tamanoAcum=0;
							if (((ResultadoSubprocesoBeanData)nivel2.get(j)).getCodigosubproceso()==((ResultadoSubprocesoBeanData)indicepadre.get(i)).getCodigosubproceso()){
								Integer valorj=j;
								tamano=(Integer)tamanho.get(valorj);
								tamanoAcum=(Integer)tamanhoAcumulado.get(valorj);
						
						
							for(int l=tamanoAcum;l<tamano+tamanoAcum;l++){
							
						
				%>
				
				
				 
						<li><a href="#"><input type="checkbox"><%=((ResultadoSubprocesoBeanData)matrizSubprocesos.get(l)).getNombre()%></a>
								  
					
					<%		}%>
					
					<ul>
 					<% 
								for(int k=0;k<nivel3.size();k++){
									Integer tamanho2=nivel2.size();
									if (suspadres.get(tamanho2+k)==((ResultadoSubprocesoBeanData)nivel2.get(j)).getCodigosubproceso() && ((ResultadoSubprocesoBeanData)nivel3.get(k)).getCodigosubproceso()==((ResultadoSubprocesoBeanData)indicepadre.get(tamanho2+k)).getCodigosubproceso()){
									Integer valork=tamanho2+k;
									tamano=(Integer)tamanho.get(valork);
									tamanoAcum=(Integer)tamanhoAcumulado.get(valork);
							
									for(int l=tamanoAcum;l<tamano+tamanoAcum;l++){
					%> 
							<li><a href="#"><input type="checkbox"><%=((ResultadoSubprocesoBeanData)matrizSubprocesos.get(l)).getNombre()%> </a>	
				<%				}
						
									}
								}
					%>
					</ul>

					
					
					<% 		 }
						 }
						 }%>
				</ul>
			
				
				<%				
							
						
					
					}%>	 
				
		</ul>
	</li>

</ul>
</form>
</div>


</body>
</html>

	
