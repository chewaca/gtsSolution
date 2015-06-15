package GtsSoftware.activo;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.local.LocalBeanData;
import GtsSoftware.marca.MarcaBeanData;
import GtsSoftware.proveedor.ProveedorBeanData;
import GtsSoftware.tipomoneda.TipoMonedaBeanData;

public class AccionModificarActivo extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		ActivoBeanFuncion activoFuncion= ActivoBeanFuncion.getInstanceS();
		int tipo=Integer.parseInt(request.getParameter("tipo"));
		Integer codigo=Integer.parseInt(request.getParameter("codigo"));
		
		if(tipo==1){//DEL BUSCAR --> AL MODIFICAR, se visualizan los campos para poder modificar
			
			ActivoBeanData activoData=activoFuncion.consultarActivo(codigo);
			TipoMonedaBeanData tipoMonedaData=activoFuncion.consultarTipoMoneda(activoData.getTipoMoneda());
			ProveedorBeanData proveedorData=activoFuncion.consultarProveedor(activoData.getProveedor());
			TipoActivoBeanData tipoActivoData=activoFuncion.consultarTipoActivo(activoData.getTipoActivo());
			LocalBeanData localData=activoFuncion.consultarLocal(activoData.getIdLocal());
			MarcaBeanData marcaData=activoFuncion.consultarMarca(activoData.getIdMarca());
			Vector<TipoMonedaBeanData> tipoMonedasData=activoFuncion.consultarTipoMonedas();
			Vector<LocalBeanData> resultadosLocales=activoFuncion.consultarLocales();
			Vector<ProveedorBeanData> proveedoresData=activoFuncion.consultarProveedores();
			Vector<TipoActivoBeanData> tiposActivos=activoFuncion.consultarTipoActivos();
			Vector<MarcaBeanData> marcasData=activoFuncion.consultarMarcas();
			
			request.setAttribute("localesData", resultadosLocales);
			request.setAttribute("localData", localData);
			request.setAttribute("activo", activoData);
			request.setAttribute("tipoMonedasData", tipoMonedasData);
			request.setAttribute("tipoMoneda", tipoMonedaData);
			request.setAttribute("proveedoresData", proveedoresData);
			request.setAttribute("proveedor", proveedorData);
			request.setAttribute("tiposActivos", tiposActivos);
			request.setAttribute("tipoActivo", tipoActivoData);
			request.setAttribute("marcaData", marcaData);
			request.setAttribute("marcasData", marcasData);
	
			this.direccionar(sc, request, response, "/Gts/activo/modificaractivo.jsp");
		}
		if(tipo==2){//DEL MODIFICAR AL BUSCAR, se guarda la modificacion
			ActivoBeanData activoData=activoFuncion.crearActivoModificarGeneral(request, response);			
			activoData.setCodigo(codigo);			
			activoFuncion.modificarActivoGeneral(activoData);
			
			this.direccionar(sc, request, response, "/Gts/activo/buscaractivo.jsp");
		}
	}

}
