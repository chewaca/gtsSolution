package GtsSoftware.programacion;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.proveedor.CriterioProveedorBeanData;
import GtsSoftware.proveedor.CriterioProveedorBeanFuncion;
import GtsSoftware.proveedor.ResultadoProveedorBeanData;
public class AccionSeleccionarProveedor extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		CriterioProveedorBeanData criterioProveedorData =new CriterioProveedorBeanFuncion().crearCriterio(request, response);
		Vector<ResultadoProveedorBeanData> resultadosProveedor=new CriterioProveedorBeanFuncion().buscarPlantillaPersonal(criterioProveedorData);
		
		request.setAttribute("resultadosProveedor", resultadosProveedor);

		this.direccionar(sc, request, response, "/Gts/proveedor/seleccionarproveedor.jsp");

	}

}
