package GtsSoftware.programacion;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionBuscarProgramacion extends CoAccion {
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		CriterioProgramacionBeanData criterioPrograData =new CriterioProgramacionBeanFuncion().crearCriterio(request, response);
		Vector<ResultadoProgramacionBeanData> resultados=new CriterioProgramacionBeanFuncion().buscarPlantillaProgramacion(criterioPrograData);	
		
		request.setAttribute("resultados", resultados);
		this.direccionar(sc, request, response, "/Gts/programacion/buscarprogramacion.jsp");
	}
}
