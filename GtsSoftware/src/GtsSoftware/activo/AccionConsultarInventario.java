package GtsSoftware.activo;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.marca.MarcaBeanData;
import GtsSoftware.programacion.ProgramacionBeanFunction;
import GtsSoftware.proveedor.ProveedorBeanData;

public class AccionConsultarInventario extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		Integer idLocal=Integer.parseInt(request.getParameter("codigoLocal"));
		Integer idTipoActivo=Integer.parseInt(request.getParameter("codigoTipoActivo"));
		String tipo=request.getParameter("tipo");
		ActivoBeanData activoData=new ActivoBeanData();
		activoData.setIdLocal(idLocal);
		activoData.setTipoActivo(idTipoActivo);
		ProgramacionBeanFunction programacionFuncion=ProgramacionBeanFunction.getInstanceS();
		ActivoBeanFuncion activoFuncion= ActivoBeanFuncion.getInstanceS();
		Vector<ResultadoActivoBeanData> activosData=activoFuncion.consultarListaActivosInventario(activoData);
		Vector<MarcaBeanData> resultadosMarcas=programacionFuncion.buscarPlantillaMarcas(activosData);
		Vector<ProveedorBeanData> resultadosProveedores=programacionFuncion.buscarPlantillaProveedores(activosData);
		Vector<TipoActivoBeanData> tipoActivos=activoFuncion.buscarPlantillaTipoActivos(activosData);
		
		request.setAttribute("tipoActivos", tipoActivos);
		request.setAttribute("resultadosProveedores", resultadosProveedores);
		request.setAttribute("resultadosMarcas", resultadosMarcas);
		request.setAttribute("tipo", tipo);
		request.setAttribute("activosData", activosData);
		
		this.direccionar(sc, request, response, "/Gts/activo/buscarinventario.jsp");
	}

}
