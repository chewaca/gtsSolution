package GtsSoftware.activo;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.local.LocalBeanData;
import GtsSoftware.programacion.ProgramacionBeanFunction;
import GtsSoftware.proveedor.ProveedorBeanData;

public class AccionBuscarActivo extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		ActivoBeanFuncion activoFuncion=ActivoBeanFuncion.getInstanceS();
		ProgramacionBeanFunction prograFuncion= ProgramacionBeanFunction.getInstanceS();
		CriterioActivoBeanData criterioActivoData =new CriterioActividadBeanFuncion().crearCriterioGeneral(request, response);
		Vector<ResultadoActivoBeanData> resultados=new CriterioActividadBeanFuncion().buscarPlantillaActivoGeneral(criterioActivoData);	
		Vector<TipoActivoBeanData> tipoActivosData=activoFuncion.buscarPlantillaTipoActivos(resultados);
		Vector<LocalBeanData> localesData=activoFuncion.buscarPlantillaLocalesActivos(resultados);
		Vector<ProveedorBeanData> proveedoresData=prograFuncion.buscarPlantillaProveedores(resultados);
		
		request.setAttribute("nombreActivo", request.getParameter("txtNombre"));
		request.setAttribute("numeroSerie", request.getParameter("txtNumeroSerie"));
		request.setAttribute("ubicacion", request.getParameter("cmdUbicacion"));
		request.setAttribute("estado", request.getParameter("cmdEstado"));
		request.setAttribute("criterio", criterioActivoData);
		request.setAttribute("tipoActivosData", tipoActivosData);
		request.setAttribute("proveedoresData", proveedoresData);
		request.setAttribute("localesData", localesData);
		request.setAttribute("resultados", resultados);
		request.setAttribute("mensaje","");
		request.setAttribute("esconder", "ACTIVO");
		
		this.direccionar(sc, request, response, "/Gts/activo/buscaractivo.jsp");
		
	}
}
