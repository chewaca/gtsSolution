package GtsSoftware.proceso;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.subproceso.SubprocesoBeanData;
//import GtsSoftware.proceso.*;
import GtsSoftware.subproceso.SubprocesoBeanFuncion;

public class AccionAgregarSubproceso extends CoAccion{
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		//esto lo saca del html
		int tipo=Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==2){

			SubprocesoBeanFuncion subprocesoFuncion= SubprocesoBeanFuncion.getInstanceS();
			
			int codigo=Integer.parseInt(request.getParameter("codigo"));
			
			//saca los datos de la vista, la creacion es desde proceso, Agregar subproceso
			SubprocesoBeanData subprocesoData=subprocesoFuncion.crearSubproceso(request, response,codigo);
			
			//inserta los datos en BD
			subprocesoFuncion.agregarSubproceso(subprocesoData);
			
			//se puede usar en el html
			request.setAttribute("subproceso", subprocesoData);
			
			this.direccionar(sc, request, response, "/Gts/proceso/buscarproceso.jsp");
		
		}
		
		if(tipo==1){
		
		int codigo=Integer.parseInt(request.getParameter("codigo"));
		ProcesoBeanData procesoData=new ProcesoBeanData();
		
		procesoData.setCodigo(codigo);
		
		request.setAttribute("proceso", procesoData);
		this.direccionar(sc, request, response, "/Gts/subproceso/agregarsubproceso.jsp");
		}

	}
}
