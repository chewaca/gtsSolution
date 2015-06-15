package GtsSoftware.subproceso;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.proceso.CriterioProcesoBeanData;
import GtsSoftware.proceso.ResultadoProcesoBeanData;
public class AccionBuscarSubproceso extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		CriterioSubprocesoBeanData criterioSubprocesoData =new CriterioSubprocesoBeanFuncion().crearCriterio(request, response);
		Vector<ResultadoSubprocesoBeanData> resultados=new CriterioSubprocesoBeanFuncion().buscarSubproceso(criterioSubprocesoData);
		
		request.setAttribute("resultados", resultados);
		request.setAttribute("criterio", criterioSubprocesoData);
		this.direccionar(sc, request, response, "/Gts/subproceso/buscarsubproceso.jsp");
		
	}
}
