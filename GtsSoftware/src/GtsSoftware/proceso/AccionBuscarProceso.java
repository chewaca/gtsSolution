package GtsSoftware.proceso;


import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionBuscarProceso extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		CriterioProcesoBeanData criterioProcesoData =new CriterioProcesoBeanFuncion().crearCriterio(request, response);
		Vector<ResultadoProcesoBeanData> resultados=new CriterioProcesoBeanFuncion().buscarProceso(criterioProcesoData);
		
		request.setAttribute("esconder", "ACTIVO");
		request.setAttribute("resultados", resultados);
		request.setAttribute("criterio", criterioProcesoData);
				
		this.direccionar(sc, request, response, "/Gts/proceso/buscarproceso.jsp");
	}
}

	