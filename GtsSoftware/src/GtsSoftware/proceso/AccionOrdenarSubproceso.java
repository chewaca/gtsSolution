package GtsSoftware.proceso;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.subproceso.SubprocesoBeanData;
import GtsSoftware.subproceso.SubprocesoBeanFuncion;

public class AccionOrdenarSubproceso extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		
		HttpSession sesion= request.getSession(true);
		String tipo="6";
		SubprocesoBeanFuncion subprocesoFuncion= SubprocesoBeanFuncion.getInstanceS();
		
		//Ordenar para un segundo nivel(proceso-subproceso)
		String[] valoresSubproceso = request.getParameterValues("chboxNombre");
		String nombreSubproceso=valoresSubproceso[0];
		SubprocesoBeanData subprocesoData=subprocesoFuncion.consultarSubprocesoNombre(nombreSubproceso);
		//Vector<ResultadoSubprocesoBeanData> resulNivelDos= subprocesoFuncion.buscarSubprocesosNivelDos(subprocesoData.getCodigoproceso());
		Integer maximoOrden=subprocesoFuncion.consultarMaximoOrdenNivelDos(subprocesoData.getCodigoproceso());
		
		String maxOrden=maximoOrden.toString();
		
		//Ordenar para un nivel mayor a 2(subproceso-subproceso)
		
		request.setAttribute("tipo", tipo);
		sesion.setAttribute("subproceso", subprocesoData);
		request.setAttribute("maximoOrden", maxOrden);

		this.direccionar(sc, request, response, "/Gts/proceso/principal.jsp");
	}

}
