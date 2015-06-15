package GtsSoftware.personal;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionBuscarPersonal extends CoAccion {
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		
		Integer tipo=Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==1){
			PersonalData personalData = new PersonalFuncion().crear(request, response);
			Vector<PersonalData> resultados = new PersonalFuncion().buscarPersonal(personalData);
			String ocultar = "1";
			String codigoPersonal= request.getParameter("txtCodigo");
			String nombrePersonal= request.getParameter("txtNombre");
			String apPaterno = request.getParameter("txtApPaterno");
			String apMaterno= request.getParameter("txtApMaterno");
			String codigoArea= request.getParameter("cmbxArea");
			String estado= request.getParameter("cmbEstado");
			request.setAttribute("ocultar", ocultar);
			request.setAttribute("codigoPersonal", codigoPersonal);
			request.setAttribute("nombrePersonal", nombrePersonal);
			request.setAttribute("apPaterno", apPaterno);
			request.setAttribute("apMaterno", apMaterno);
			request.setAttribute("codigoArea", codigoArea);
			request.setAttribute("estado", estado);
			request.setAttribute("resultados", resultados);
			
			this.direccionar(sc, request, response, "/Gts/personal/buscarpersonal.jsp");
		}
		if(tipo==2){
			Integer codigo=Integer.parseInt(request.getParameter("codigo"));
			PersonalData personalData = new PersonalData();
			personalData.setCodigo(codigo);
			PersonalData resultado = new PersonalFuncion().buscarPersonalUnico(personalData);
			request.setAttribute("resultado", resultado);
			
			this.direccionar(sc, request, response, "/Gts/personal/visualizarpersonal.jsp");
		}
	}

}
