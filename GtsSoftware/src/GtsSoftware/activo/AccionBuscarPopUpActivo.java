package GtsSoftware.activo;

import java.util.Vector;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionBuscarPopUpActivo extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		ActivoBeanFuncion activoFuncion=ActivoBeanFuncion.getInstanceS();
		CriterioActivoBeanData criterioActivoData =new CriterioActividadBeanFuncion().crearCriterio(request, response);
		Vector<ResultadoActivoBeanData> resultados=new CriterioActividadBeanFuncion().buscarPlantillaActivo(criterioActivoData);
		Vector<ResultadoActivoBeanData> resultadosEquipos=activoFuncion.buscarPlantillaEquipos(resultados);
		
		request.setAttribute("resultadosActivo", resultadosEquipos);
		this.direccionar(sc, request, response, "/Gts/activo/seleccionaractivo.jsp");

	}
}
