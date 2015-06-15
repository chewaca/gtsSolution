package GtsSoftware.subproceso;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.proceso.*;
public class AccionModificarSubproceso extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException{
		// TODO Auto-generated method stub
		SubprocesoBeanFuncion SubprocesoFuncion= SubprocesoBeanFuncion.getInstanceS();
		
		Integer codigo=Integer.parseInt(request.getParameter("codigo"));
				
		if(Integer.valueOf(request.getParameter("tipo"))==2){
	
			SubprocesoBeanData subprocesoData=SubprocesoFuncion.crearSubprocesoModificar(request, response);
			subprocesoData.setCodigosubproceso(codigo);
			SubprocesoFuncion.modificarSubproceso(subprocesoData);
			
			this.direccionar(sc, request, response, "/Gts/subproceso/buscarsubproceso.jsp");
		}
		
		if(Integer.valueOf(request.getParameter("tipo"))==1){
			
			SubprocesoBeanData subprocesoData=SubprocesoFuncion.consultarSubproceso(codigo);
			request.setAttribute("subproceso", subprocesoData);

			this.direccionar(sc, request, response,"/Gts/subproceso/modificarsubproceso.jsp");
		}
		

		
		
	}
}
