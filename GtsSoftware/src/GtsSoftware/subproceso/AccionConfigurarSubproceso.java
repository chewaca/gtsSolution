package GtsSoftware.subproceso;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.programacion.ProgramacionBeanData;
public class AccionConfigurarSubproceso extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response)  throws CoException{
		
		HttpSession sesion= request.getSession(true);
		int tipo=Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==1){//viene del buscarsubproceso
				
		Integer codigo=Integer.parseInt(request.getParameter("codigo"));
		String nombre=request.getParameter("nombre");
		String descripcion=request.getParameter("descripcion");
		SubprocesoBeanData subprocesoData=new SubprocesoBeanData();
		subprocesoData.setCodigosubprocesopadre(codigo);
		subprocesoData.setNombre(nombre);
		subprocesoData.setDescripcion(descripcion);
		
		sesion.setAttribute("subproceso", subprocesoData);

		this.direccionar(sc, request, response, "/Gts/subproceso/configurarsubproceso.jsp");
		}
		if(tipo==2){//viene del crear programacion
			Integer idprogramacion=Integer.parseInt(request.getParameter("programacion"));
			ProgramacionBeanData programacionData=new ProgramacionBeanData();
			programacionData.setCodigo(idprogramacion);
			request.setAttribute("programacion", programacionData);
			
			this.direccionar(sc, request, response, "/Gts/subproceso/configurarsubproceso.jsp");
			
		}
	}
	
}
