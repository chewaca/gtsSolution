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
public class AccionProgramacionEjecucion extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		Integer estadoEjecutando=2;
		String tipo=request.getParameter("tipo");
		ProgramacionBeanFunction prograFuncion= ProgramacionBeanFunction.getInstanceS();
		Vector<ResultadoProgramacionBeanData> resultadosProgE=prograFuncion.buscarPlantillaProgramacionEjecuntado(estadoEjecutando);
		ActivoBeanFuncion activoBeanFuncion=ActivoBeanFuncion.getInstanceS();
		Vector<LocalBeanData> resultadosLocales=activoBeanFuncion.consultarLocales();
		Integer cantidadEjecutando=resultadosProgE.size();
		
		Vector<Integer> avancesData=activoBeanFuncion.verificarAvance(resultadosProgE);		
		Vector<ResultadoProgramacionBeanData> resultadosProgEX=prograFuncion.buscarPlantillaProgramacionEjecutados(3);
		Integer cantidadEjecutada=resultadosProgEX.size();
		sesion.setAttribute("cantidadEjecutando", cantidadEjecutando.toString());
		sesion.setAttribute("cantidadEjecutada", cantidadEjecutada.toString());
		sesion.setAttribute("avancesData", avancesData);
		sesion.setAttribute("estado", estadoEjecutando.toString());
		sesion.setAttribute("estadoDescripcion", "PROGRAMACIONES EN EJECUCIÓN");
		sesion.setAttribute("resultadosLocales", resultadosLocales);
		sesion.setAttribute("resultadosProg", resultadosProgE);
		request.setAttribute("tipo", tipo);
		
		this.direccionar(sc, request, response, "/Gts/general/index.jsp");
	}

}
