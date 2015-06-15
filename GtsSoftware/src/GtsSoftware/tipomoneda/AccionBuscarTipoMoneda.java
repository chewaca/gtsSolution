package GtsSoftware.tipomoneda;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionBuscarTipoMoneda extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		CriterioTipoMonedaBeanData criterioProcesoData =new CriterioTipoMonedaBeanFuncion().crearCriterio(request, response);
		Vector<ResultadoTipoMonedaBeanData> resultados=new CriterioTipoMonedaBeanFuncion().buscarPlantillaProceso(criterioProcesoData);	
		
		request.setAttribute("resultados", resultados);
		this.direccionar(sc, request, response, "/Gts/proceso/buscarproceso.jsp");
		
	}
}
