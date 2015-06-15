package GtsSoftware.programacion;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionProgramacionEjecutada extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		String tipo="1";
		
		//Vector<ProgramacionHistoricoBeanData> resultadosProgHistorica=new Vector<ProgramacionHistoricoBeanData>();
		ProgramacionBeanFunction programacionFuncion= ProgramacionBeanFunction.getInstanceS();
		Vector<ResultadoProgramacionBeanData> resultadosProgE=programacionFuncion.buscarPlantillaProgramacionEjecutados(3);
		//Vector<ResultadoPersonalBeanData> resultadosPersonalEjecutor=programacionFuncion.buscarPlantillaPersonalEjecutor(resultadosProgHistorica);
		//Vector<ResultadoPersonalBeanData> resultadosPersonalResponsable=programacionFuncion.buscarPlantillaPersonalResponsable(resultadosProgHistorica);
	//	Vector<ResultadoActivoBeanData> resultadosActivos=programacionFuncion.buscarPlantillaActivoHistorico(resultadosProgHistorica);
		Integer cantidadEjecutada=resultadosProgE.size();
		sesion.setAttribute("estado", "3");
		/*sesion.setAttribute("resultadosActivos", resultadosActivos);*/
		/*sesion.setAttribute("resultadosPersonalResponsable", resultadosPersonalResponsable);*/
		/*sesion.setAttribute("resultadosPersonalEjecutor", resultadosPersonalEjecutor);*/
		/*sesion.setAttribute("resultadosEjecutado", resultadosProgHistorica);*/
		sesion.setAttribute("estadoDescripcion", "PROGRAMACIONES EJECUTADAS");
		sesion.setAttribute("cantidadEjecutada", cantidadEjecutada.toString());
		sesion.setAttribute("resultadosProg", resultadosProgE);
		request.setAttribute("tipo", tipo);
		
		this.direccionar(sc, request, response, "/Gts/general/index.jsp");
	}

}

