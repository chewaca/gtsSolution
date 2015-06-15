package GtsSoftware.programacion;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionVerEjecuciones extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		
		Integer codigoProgramacion=Integer.parseInt(request.getParameter("codigoProgramacionEjecutada"));
		String tipo="7";
		ProgramacionBeanFunction programacionFuncion= ProgramacionBeanFunction.getInstanceS();
		Vector<ProgramacionHistoricoBeanData> resultadosEjecutado=programacionFuncion.buscarPlantillaProgramacionesHistoricas(codigoProgramacion);		
		Vector<ResultadoProgramacionBeanData> resultadosProgE=programacionFuncion.buscarPlantillaProgramacionEjecutadosID(codigoProgramacion);
		//Vector<ResultadoPersonalBeanData> resultadosPersonalEjecutor=programacionFuncion.buscarPlantillaPersonalEjecutor(resultadosEjecutado);
		//Vector<ResultadoPersonalBeanData> resultadosPersonalResponsable=programacionFuncion.buscarPlantillaPersonalResponsable(resultadosEjecutado);
		//Vector<ResultadoActivoBeanData> resultadosActivos=programacionFuncion.buscarPlantillaActivoHistorico(resultadosEjecutado);
		
		//sesion.setAttribute("resultadosActivos", resultadosActivos);
		//sesion.setAttribute("resultadosPersonalResponsable", resultadosPersonalResponsable);
		//sesion.setAttribute("resultadosPersonalEjecutor", resultadosPersonalEjecutor);
		sesion.setAttribute("resultadosEjecutado", resultadosEjecutado);
		request.setAttribute("tipo", tipo);
		sesion.setAttribute("resultadosProg", resultadosProgE);
		this.direccionar(sc, request, response, "/Gts/general/index.jsp");
	}

}
