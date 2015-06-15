package GtsSoftware.activo;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.local.LocalBeanData;
import GtsSoftware.proveedor.ProveedorBeanData;
import GtsSoftware.tipomoneda.TipoMonedaBeanData;

public class AccionDarDeBaja extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		Integer tipo=Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==1){
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
			
			this.direccionar(sc, request, response, "/Gts/activo/dardebajaactivo.jsp");
		}
		if(tipo==2){//DAR DE BAJA
			
			//se cambia de estado el activo
			Integer codigo=Integer.parseInt(request.getParameter("codigo"));
			ActivoBeanFuncion activoFuncion=ActivoBeanFuncion.getInstanceS();
			ActivoBeanData activoData=activoFuncion.crearActivoModificar(request, response);
			activoData.setCodigo(codigo);
			activoFuncion.modificarActivo(activoData);
			
			//NO SE DECREMENTA en el inventario de ese activo
//			ActivoBeanData activoDataAux=activoFuncion.consultarActivo(codigo);
//			InventarioActivoBeanData inventarioData=activoFuncion.consultarEnInventario(activoDataAux);
//			Integer cantidadNueva=inventarioData.getCantidad()-1;
//			inventarioData.setCantidad(cantidadNueva);
			
			//activoFuncion.modificarCantidadInventario(inventarioData);
						
			this.direccionar(sc, request, response, "/Gts/activo/buscaractivo.jsp");
		}	
	}

}
