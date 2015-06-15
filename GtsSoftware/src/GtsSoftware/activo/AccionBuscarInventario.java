package GtsSoftware.activo;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.local.LocalBeanData;

public class AccionBuscarInventario extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		ActivoBeanFuncion activoFuncion=ActivoBeanFuncion.getInstanceS();
		String tipo=request.getParameter("tipo");
		
		ActivoBeanData criterioActivoData =new CriterioActividadBeanFuncion().crearCriterioInventario(request, response);
		Vector<InventarioActivoBeanData> resultados=activoFuncion.consultarListaEnInventario(criterioActivoData);	
		Vector<TipoActivoBeanData> tipoActivosData=activoFuncion.buscarPlantillaTipoActivosI(resultados);
		Vector<LocalBeanData> localesData=activoFuncion.buscarPlantillaLocalesActivosI(resultados);
		
		request.setAttribute("esconder", "ACTIVO");
		request.setAttribute("tipo", tipo);
		sesion.setAttribute("localesData", localesData);
		sesion.setAttribute("tipoActivosData", tipoActivosData);
		sesion.setAttribute("resultados", resultados);

		this.direccionar(sc, request, response, "/Gts/activo/buscarinventario.jsp");
	}

}
