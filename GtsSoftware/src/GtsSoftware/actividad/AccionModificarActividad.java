package GtsSoftware.actividad;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionModificarActividad extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException{
		// TODO Auto-generated method stub
//		ActividadBeanFuncion ProcesoFuncion= ActividadBeanFuncion.getInstanceS();
//		
//		Integer codigo=Integer.parseInt(request.getParameter("codigo"));
//				
//		if(Integer.valueOf(request.getParameter("tipo"))==2){
//	
//			ActividadBeanData procesoData=ProcesoFuncion.crearProcesoModificar(request, response);
//			procesoData.setCodigo(codigo);
//			ProcesoFuncion.modificarProceso(procesoData);
//			
//			this.direccionar(sc, request, response, "/Gts/proceso/buscarproceso.jsp");
//		}	
//		
//		ActividadBeanData procesoData=ProcesoFuncion.consultarProceso(codigo);
//		request.setAttribute("proceso", procesoData);
//
//		this.direccionar(sc, request, response, "/Gts/proceso/modificarproceso.jsp");
	}
}
