package GtsSoftware.programacion;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.activo.ResultadoActivoBeanData;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
public class AccionVerActivos extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		Integer codigoProgramacion=Integer.parseInt(request.getParameter("codigoActividadActivo"));
		String tipo="5";
		
		ProgramacionBeanFunction programacionFuncion= ProgramacionBeanFunction.getInstanceS();
		Vector<ResultadoActivoBeanData> resultadosActivos=programacionFuncion.buscarPlantillaActivos(codigoProgramacion);
		//Ahora para cada actividad se sacan sus datos
		
		sesion.setAttribute("resultadosActivos", resultadosActivos);
		request.setAttribute("tipo", tipo);
		//sesion.setAttribute("nombreSub", nombreSub);
		
		this.direccionar(sc, request, response, "/Gts/proceso/principal.jsp");
	}

}
