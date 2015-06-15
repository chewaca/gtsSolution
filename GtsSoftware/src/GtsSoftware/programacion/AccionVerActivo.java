package GtsSoftware.programacion;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.activo.ActivoBeanData;
import GtsSoftware.activo.ActivoBeanFuncion;
import GtsSoftware.activo.TipoActivoBeanData;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.local.LocalBeanData;
import GtsSoftware.proveedor.ProveedorBeanData;
import GtsSoftware.tipomoneda.TipoMonedaBeanData;

public class AccionVerActivo extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		String tipo=request.getParameter("tipo");
		Integer codigo=Integer.parseInt(request.getParameter("idActivo"));
		ActivoBeanFuncion activoFuncion=ActivoBeanFuncion.getInstanceS();
		ActivoBeanData activoData=activoFuncion.consultarActivo(codigo);
		TipoMonedaBeanData tipoMonedaData=activoFuncion.consultarTipoMoneda(activoData.getTipoMoneda());
		ProveedorBeanData proveedorData=activoFuncion.consultarProveedor(activoData.getProveedor());
		TipoActivoBeanData tipoActivoData=activoFuncion.consultarTipoActivo(activoData.getTipoActivo());
		LocalBeanData localData=activoFuncion.consultarLocal(activoData.getIdLocal());
		
		request.setAttribute("localData", localData);
		request.setAttribute("activo", activoData);
		request.setAttribute("tipoMoneda", tipoMonedaData);
		request.setAttribute("proveedor", proveedorData);
		request.setAttribute("tipoActivo", tipoActivoData);
		request.setAttribute("tipo", tipo);
		
		this.direccionar(sc, request, response, "/Gts/general/index.jsp");		
	}

}
