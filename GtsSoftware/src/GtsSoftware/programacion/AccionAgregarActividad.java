package GtsSoftware.programacion;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.actividad.ActividadBeanData;
import GtsSoftware.actividad.ActividadBeanFuncion;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionAgregarActividad extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub

		String tipo="2";
		
		ActividadBeanFuncion actividadFuncion= ActividadBeanFuncion.getInstanceS();

		ActividadBeanData actividadProgramacionData=new ActividadBeanData();

		actividadFuncion.agregarActividadMultiple(request, response, actividadProgramacionData);
		
		request.setAttribute("actividadprogramacion", actividadProgramacionData);
		request.setAttribute("tipo", tipo);
		
		this.direccionar(sc, request, response, "/Gts/proceso/principal.jsp");
	}

}
