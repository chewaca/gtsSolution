package GtsSoftware.programacion;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.actividad.CriterioActividadBeanData;
import GtsSoftware.actividad.CriterioActividadBeanFuncion;
import GtsSoftware.actividad.ResultadoActividadBeanData;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionBuscarPopUpActividad extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub

		CriterioActividadBeanData criterioActividadData =new CriterioActividadBeanFuncion().crearCriterio(request, response);
		Vector<ResultadoActividadBeanData> resultados=new CriterioActividadBeanFuncion().buscarPlantillaActividad(criterioActividadData);

		request.setAttribute("resultados", resultados);
		this.direccionar(sc, request, response, "/Gts/actividad/seleccionaractividad.jsp");
		
	}

}
