package GtsSoftware.proceso;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionSeleccionarActividadActivo extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		
		String componente=((request.getParameter("cmdComponente")));
		//Integer codigoActividadActivo=Integer.parseInt(request.getParameter("codigoA"));
		
		//busco la actividades relacionadas a esa programacion
		if(componente.equals("Actividad")){
			
			
		}
	}

}
