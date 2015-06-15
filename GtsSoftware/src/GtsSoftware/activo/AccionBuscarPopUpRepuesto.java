package GtsSoftware.activo;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionBuscarPopUpRepuesto extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		ActivoBeanFuncion activoFuncion=ActivoBeanFuncion.getInstanceS();
		CriterioActivoBeanData criterioActivoData =new CriterioActividadBeanFuncion().crearCriterioRepuesto(request, response);
		Vector<ResultadoActivoBeanData> resultados=new CriterioActividadBeanFuncion().buscarPlantillaRepuesto(criterioActivoData);
		Vector<ResultadoActivoBeanData> resultadosRepuestos=activoFuncion.buscarPlantillaRepuestos(resultados);
		
		request.setAttribute("resultadosActivo", resultadosRepuestos);
		this.direccionar(sc, request, response, "/Gts/activo/seleccionarrepuesto.jsp");
		
	}

}
