package GtsSoftware.programacion;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import GtsSoftware.activo.ActivoBeanFuncion;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.local.LocalBeanData;

public class AccionProgramacionNoEjecutada extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		Integer estadoNoEjecutado=4;
		
		String tipo=request.getParameter("tipo");
		ProgramacionBeanFunction prograFuncion= ProgramacionBeanFunction.getInstanceS();
		/*Vector<ResultadoProgramacionBeanData> resultadosProg=prograFuncion.buscarPlantillaProgramacionNoEjecutados(estadoPendiente);
		prograFuncion.modificarNoEjecutada(resultadosProg);*/
		Vector<ResultadoProgramacionBeanData> resultadosProgAux=prograFuncion.buscarPlantillaProgramacionNoEjecutados(estadoNoEjecutado);
		Integer cantidadNoEjecutado=resultadosProgAux.size();
		ActivoBeanFuncion activoBeanFuncion=ActivoBeanFuncion.getInstanceS();
		Vector<LocalBeanData> resultadosLocales=activoBeanFuncion.consultarLocales();
		
		sesion.setAttribute("cantidadNoEjecutado", cantidadNoEjecutado.toString());
		sesion.setAttribute("estado", estadoNoEjecutado.toString());
		sesion.setAttribute("estadoDescripcion", "PROGRAMACIONES NO EJECUTADAS");
		sesion.setAttribute("resultadosLocales", resultadosLocales);
		sesion.setAttribute("resultadosProg", resultadosProgAux);
		request.setAttribute("tipo", tipo);
		
		this.direccionar(sc, request, response, "/Gts/general/index.jsp");
	}

}

