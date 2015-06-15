package GtsSoftware.personal;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionModificarPersonal extends CoAccion {
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
			
		Integer tipo=Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==2){
			Integer codigo=Integer.parseInt(request.getParameter("codigo"));
			PersonalData personalData = new PersonalData();
			personalData.setCodigo(codigo);
			PersonalData resultado = new PersonalFuncion().buscarPersonalUnico(personalData);
			request.setAttribute("resultado", resultado);
			
			this.direccionar(sc, request, response, "/Gts/personal/modificarpersonal.jsp");
		}
		if(tipo==1){
			Integer codigo=Integer.parseInt(request.getParameter("txtCodigo"));
			PersonalData personalData = new PersonalData();
			personalData = new PersonalFuncion().crearPersonal(request, response);
			personalData.setCodigo(codigo);
			boolean result = new PersonalFuncion().actualizarPersonal(personalData);
			this.direccionar(sc, request, response, "/Gts/personal/buscarpersonal.jsp");
			
		}
	}

}
