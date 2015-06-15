package GtsSoftware.activo;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.local.LocalBeanData;
import GtsSoftware.marca.MarcaBeanData;
import GtsSoftware.programacion.ProgramacionBeanFunction;
import GtsSoftware.proveedor.ProveedorBeanData;

public class AccionVerElementos extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		//buscar Inventario Visto Malo
		ActivoBeanFuncion activoFuncion=ActivoBeanFuncion.getInstanceS();
		ProgramacionBeanFunction programacionFuncion= ProgramacionBeanFunction.getInstanceS();
		Vector<Integer> vectorTipoActivo=new Vector<Integer>();
		Vector<Integer> vectorLocal=new Vector<Integer>();
		
		String[] valores=request.getParameterValues("valores");
		String[] activos=valores[0].split(",");
		
		for(int i=0;i<activos.length;i++){
			//los de indice par son los idTipoActivo, y los impares los de idLocal
			if(i%2==0){
				Integer idTipoActivo=Integer.parseInt(activos[i]);
				vectorTipoActivo.add(idTipoActivo);
			}
			else{
				Integer idLocal=Integer.parseInt(activos[i]);
				vectorLocal.add(idLocal);
			}				
		}
						
		Vector<ResultadoActivoBeanData> activosData=activoFuncion.consultarListaVistoMalo(vectorTipoActivo,vectorLocal);//saca los que han seleccionado con visto malo
		Vector<LocalBeanData> resultadosLocalesActivo=programacionFuncion.buscarPlantillaLocales(activosData);
		Vector<MarcaBeanData> resultadosMarcas=programacionFuncion.buscarPlantillaMarcas(activosData);
		Vector<ProveedorBeanData> resultadosProveedores=programacionFuncion.buscarPlantillaProveedores(activosData);
		Vector<TipoActivoBeanData> tipoActivosData=activoFuncion.buscarPlantillaTipoActivos(activosData);
		
		request.setAttribute("tipoActivosData", tipoActivosData);
		request.setAttribute("resultadosLocalesActivo", resultadosLocalesActivo);
		request.setAttribute("resultadosMarcas", resultadosMarcas);
		request.setAttribute("resultadosProveedores", resultadosProveedores);
		request.setAttribute("activosData", activosData);
		
		this.direccionar(sc, request, response, "/Gts/activo/ajustarinventario.jsp");
	}

}
