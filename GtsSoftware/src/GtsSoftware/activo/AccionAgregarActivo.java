package GtsSoftware.activo;

import GtsSoftware.general.CoException;

import java.io.IOException;
import java.util.Vector;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.local.LocalBeanData;
import GtsSoftware.marca.MarcaBeanData;
import GtsSoftware.proveedor.ProveedorBeanData;
import GtsSoftware.tipomoneda.TipoMonedaBeanData;

public class AccionAgregarActivo extends CoAccion{
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		//esto lo saca del html
		int tipo=Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==2){//CUANDO SE AGREGA UN ACTIVO REGRESA AL BUSCAR ACTIVO
			
			//SE AGREGA EL ACTIVO, a la tabla ACTIVO
			ActivoBeanFuncion activoFuncion= ActivoBeanFuncion.getInstanceS();
			ActivoBeanData activoData=activoFuncion.crearActivo(request, response);
			
			if(activoData.getNombre()!=null){
			
			activoFuncion.agregarActivo(activoData);
						
			//SE AGREGA EL ACTIVO al Inventario
			InventarioActivoBeanData inventarioData=activoFuncion.consultarEnInventario(activoData);
			
			if(inventarioData!=null){
				//si ya existe, se aumenta la cantidad
				Integer cantidadNueva=inventarioData.getCantidad()+1;
				inventarioData.setCantidad(cantidadNueva);
				activoFuncion.modificarCantidadInventario(inventarioData);				
			}
			else{
				//si no existe, se crea el registro con la cantidad de 1
				InventarioActivoBeanData inventarioNuevoData=new InventarioActivoBeanData();
				inventarioNuevoData.setIdTipoActivo(activoData.getTipoActivo());
				inventarioNuevoData.setIdLocal(activoData.getIdLocal());
				inventarioNuevoData.setCantidad(1);				
				activoFuncion.agregarNuevoEnInventario(inventarioNuevoData);			
			}			
			
			request.setAttribute("mensaje","OK");
			request.setAttribute("activo", activoData);
			
			this.direccionar(sc, request, response, "/Gts/activo/buscaractivo.jsp");
			}
			else{
			
			request.setAttribute("mensaje","Error");
			request.setAttribute("mensajeDetalle","Falta especificar nombre del activo");
			request.setAttribute("activo", activoData);
			this.direccionar(sc, request, response, "/Gts/activo/agregaractivo.jsp");
			}
			
			
		}
		
		//se verifica si el activo nuevo tiene el mismo codigo de serie que uno existente
		if(tipo==3){
			ActivoBeanFuncion activoFuncion= ActivoBeanFuncion.getInstanceS();
			Vector<ActivoBeanData> resultados = activoFuncion.consultarActivos();
			String numeroSerie=request.getParameter("txtNumeroSerie");
			String codigoPatrimonial=request.getParameter("txtCodigoPatrimonial");
			String texto="0";
			for(int i=0;i<resultados.size();i++){
				if ( (numeroSerie.equals(resultados.get(i).getNumeroSerie()))||(codigoPatrimonial.equals(resultados.get(i).getCodigoPatrimonial())) )
					texto="1";
			}
			response.setContentType("text/plain");  
		    response.setCharacterEncoding("UTF-8");
		    try {
				response.getWriter().write(texto);
			} catch (IOException e) {				
				e.printStackTrace();
			}			
		}
		
		if(tipo==1){//DEL BUSCAR AL AGREGAR ACTIVO
			ActivoBeanFuncion activoFuncion= ActivoBeanFuncion.getInstanceS();
			Vector<TipoActivoBeanData> tiposActivos=activoFuncion.consultarTipoActivos();
			Vector<LocalBeanData> localesData=activoFuncion.consultarLocales();
			Vector<TipoMonedaBeanData> tipoMonedasData=activoFuncion.consultarTipoMonedas();
			Vector<ProveedorBeanData> proveedoresData=activoFuncion.consultarProveedores();
			Vector<MarcaBeanData> marcasData=activoFuncion.consultarMarcas();
			
			request.setAttribute("marcasData", marcasData);
			request.setAttribute("proveedoresData", proveedoresData);
			request.setAttribute("tipoMonedasData", tipoMonedasData);
			request.setAttribute("tiposActivos", tiposActivos);
			request.setAttribute("localesData", localesData);
			this.direccionar(sc, request, response, "/Gts/activo/agregaractivo.jsp");
		}
		

	}
}
