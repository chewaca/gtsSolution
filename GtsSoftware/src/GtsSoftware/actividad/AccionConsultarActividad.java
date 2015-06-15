package GtsSoftware.actividad;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionConsultarActividad extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response)  throws CoException{
		
		
		Integer codigo=Integer.parseInt(request.getParameter("codigo"));
		
		ActividadBeanFuncion ProcesoFuncion=ActividadBeanFuncion.getInstanceS();

		this.direccionar(sc, request, response, "/Gts/proceso/consultarproceso.jsp");
	}
	
}
