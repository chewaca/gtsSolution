package GtsSoftware.usuario;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionAgregarRol extends CoAccion{
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		
		int tipo=Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==2){
			UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
			
			ResultadoRolData rolData = usuarioFuncion.crearRol(request, response);
			usuarioFuncion.agregarRol(rolData);
			this.direccionar(sc, request, response, "/Gts/rol/buscarrol.jsp");
		}
	}

}
