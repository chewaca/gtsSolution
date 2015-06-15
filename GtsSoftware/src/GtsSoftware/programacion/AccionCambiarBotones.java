package GtsSoftware.programacion;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionCambiarBotones extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		String tipo="3";
		String nombreSub=request.getParameter("nombreSubproceso");
		String codigoProgramacion=request.getParameter("codigoActividadActivo");
		
		request.setAttribute("tipo", tipo);
		sesion.setAttribute("nombreSub", nombreSub);
		sesion.setAttribute("codigoProgramacion", codigoProgramacion);
		
		this.direccionar(sc, request, response, "/Gts/proceso/principal.jsp");
	}

}
