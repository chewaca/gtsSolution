package GtsSoftware.usuario;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionBuscarRol extends CoAccion{
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		
		Integer tipo=Integer.parseInt(request.getParameter("tipo"));
		
		UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
		CriterioRolBeanData criterioRolData = usuarioFuncion.crearCriterioRol(request, response);
		Vector<ResultadoRolData> resultados = usuarioFuncion.buscarRol(criterioRolData);
		request.setAttribute("resultados",resultados);
		
		if(tipo==1)
			this.direccionar(sc, request, response, "/Gts/rol/buscarrol.jsp");		
		if(tipo==2)
			this.direccionar(sc, request, response, "/Gts/rol/seleccionarrol.jsp");
		if(tipo==3)
			this.direccionar(sc, request, response, "/Gts/rol/seleccionarrolresponsable.jsp");
		
	}

}
