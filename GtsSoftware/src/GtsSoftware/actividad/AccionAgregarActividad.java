package GtsSoftware.actividad;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionAgregarActividad extends CoAccion{
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		//esto lo saca del html
		int tipo=Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==2){

			ActividadBeanFuncion actividadFuncion= ActividadBeanFuncion.getInstanceS();
			ActividadBeanData actividadData=actividadFuncion.crearActividad(request, response);
			actividadFuncion.agregarActividad(actividadData);
			
			request.setAttribute("actividad", actividadData);
			
			this.direccionar(sc, request, response, "/Gts/actividad/buscaractividad.jsp");
		}
		this.direccionar(sc, request, response, "/Gts/actividad/agregaractividad.jsp");

	}
}
