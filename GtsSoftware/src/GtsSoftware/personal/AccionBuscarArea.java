package GtsSoftware.personal;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionBuscarArea extends CoAccion {
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		
		AreaData areaData = new PersonalFuncion().crearAreaBuscar(request, response);
		Vector<AreaData> resultados = new PersonalFuncion().buscarArea(areaData);
		
		
		request.setAttribute("resultados", resultados);
		
		this.direccionar(sc, request, response, "/Gts/area/buscararea.jsp");
	}

}
