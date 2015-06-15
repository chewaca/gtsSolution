package GtsSoftware.actividad;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionAgregarActividadMultiple extends CoAccion{
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub

			
		Integer idProgramacion=1;
		ActividadBeanFuncion actividadFuncion= ActividadBeanFuncion.getInstanceS();
		//Object resultados=sesion.getAttribute("resultados");
			
		//ActividadBeanData actividadProgramacionData=actividadFuncion.crearActividad(request, response);
		ActividadBeanData actividadProgramacionData=new ActividadBeanData();
		actividadProgramacionData.setIdProgramacion(idProgramacion);;
		actividadFuncion.agregarActividadMultiple(request, response, actividadProgramacionData);
			
		request.setAttribute("actividadprogramacion", actividadProgramacionData);
			
		this.direccionar(sc, request, response, "/Gts/actividad/buscaractividad.jsp");
	}
}
