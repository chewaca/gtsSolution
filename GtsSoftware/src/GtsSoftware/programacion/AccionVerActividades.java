package GtsSoftware.programacion;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.actividad.ResultadoActividadBeanData;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
public class AccionVerActividades extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		String nombreSub=request.getParameter("nombreSubproceso");
		Integer codigoProgramacion=Integer.parseInt(request.getParameter("codigoActividadActivo"));
		String tipo="4";
		
		ProgramacionBeanFunction programacionFuncion= ProgramacionBeanFunction.getInstanceS();
		Vector<ResultadoProgramacionBeanData> resultadosProg=programacionFuncion.buscarPlantillaActividadesProgramacion(codigoProgramacion);
		Vector<ResultadoActividadBeanData> resultadosActividades=programacionFuncion.buscarPlantillaActividades(resultadosProg);
		
		//Ahora para cada actividad se sacan sus datos
		
		sesion.setAttribute("resultadosActividades", resultadosActividades);
		//sesion.setAttribute("resultadosProg", resultadosProg);
		request.setAttribute("tipo", tipo);
		sesion.setAttribute("nombreSub", nombreSub);
		
		this.direccionar(sc, request, response, "/Gts/proceso/principal.jsp");
		
	}

}
