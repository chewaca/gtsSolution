package GtsSoftware.personal;

import java.text.SimpleDateFormat;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionAgregarCapacitacion extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		
		Integer tipo = Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==2){
			CapacitacionData cursoData = new CapacitacionData();
			cursoData = new PersonalFuncion().crearCapacitacion(request, response);
			boolean result = new PersonalFuncion().agregarCapacitacion(cursoData);
			this.direccionar(sc, request, response, "/Gts/capacitacion/buscarcapacitacion.jsp");
		}
	}

}
