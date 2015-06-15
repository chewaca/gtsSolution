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
public class AccionProgramacionPendiente extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		Integer estadoPendiente=1;
		Integer estadoEjecutando=2;
		String tipo=request.getParameter("tipo");
		ProgramacionBeanFunction prograFuncion= ProgramacionBeanFunction.getInstanceS();
		Vector<ResultadoProgramacionBeanData> resultadosProgP=prograFuncion.buscarPlantillaProgramacionPendiente(estadoPendiente);
		ActivoBeanFuncion activoBeanFuncion=ActivoBeanFuncion.getInstanceS();
		Vector<LocalBeanData> resultadosLocales=activoBeanFuncion.consultarLocales();
		Integer cantidadPendiente=resultadosProgP.size();
		
		Vector<ResultadoProgramacionBeanData> resultadosProgE=prograFuncion.buscarPlantillaProgramacionEjecuntado(estadoEjecutando);
		Integer cantidadEjecutando=resultadosProgE.size();
		
		sesion.setAttribute("cantidadPendiente", cantidadPendiente.toString());
		sesion.setAttribute("cantidadEjecutando", cantidadEjecutando.toString());
		sesion.setAttribute("estado", estadoPendiente.toString());
		sesion.setAttribute("estadoDescripcion", "PROGRAMACIONES PENDIENTES");
		sesion.setAttribute("resultadosLocales", resultadosLocales);
		sesion.setAttribute("resultadosProg", resultadosProgP);
		request.setAttribute("tipo", tipo);
		
		this.direccionar(sc, request, response, "/Gts/general/index.jsp");
	}

}
