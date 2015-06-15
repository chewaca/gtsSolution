package GtsSoftware.actividad;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionSeleccionarActividad extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		int tipo=Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==2){//buscar
			
			CriterioActividadBeanData criterioActividadData =new CriterioActividadBeanFuncion().crearCriterio(request, response);
			//idprogramacion
			Vector<ResultadoActividadBeanData> resultados=new CriterioActividadBeanFuncion().buscarPlantillaActividad(criterioActividadData);
			
			sesion.setAttribute("resultadosA", resultados);
			this.direccionar(sc, request, response, "/Gts/actividad/seleccionaractividad.jsp");

		}
		
		
	}
}
