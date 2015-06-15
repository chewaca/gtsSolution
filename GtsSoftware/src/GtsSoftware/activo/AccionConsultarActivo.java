package GtsSoftware.activo;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.local.LocalBeanData;
import GtsSoftware.proveedor.ProveedorBeanData;
import GtsSoftware.tipomoneda.TipoMonedaBeanData;

public class AccionConsultarActivo extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		Integer codigo=Integer.parseInt(request.getParameter("codigo"));
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

		this.direccionar(sc, request, response, "/Gts/activo/consultaractivo.jsp");

	}

}
