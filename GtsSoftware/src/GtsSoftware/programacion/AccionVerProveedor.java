package GtsSoftware.programacion;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.activo.ActivoBeanFuncion;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.proveedor.ProveedorBeanData;
public class AccionVerProveedor extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		String idProv=request.getParameter("idProveedor");
		Integer idProveedor=Integer.parseInt(idProv);
		
		String tipo=request.getParameter("tipo");
		
		ActivoBeanFuncion activoFuncion=ActivoBeanFuncion.getInstanceS();
		ProveedorBeanData proveedorData=activoFuncion.consultarProveedor(idProveedor);
		
		request.setAttribute("proveedorData", proveedorData);
		request.setAttribute("tipo", tipo);
		
		this.direccionar(sc, request, response, "/Gts/general/index.jsp");
	}

}
