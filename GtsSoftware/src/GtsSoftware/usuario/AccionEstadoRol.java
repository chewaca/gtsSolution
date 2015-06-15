package GtsSoftware.usuario;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionEstadoRol extends CoAccion {
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		
		int tipo=Integer.parseInt(request.getParameter("tipo"));
		int codigo=Integer.parseInt(request.getParameter("codigo"));
		if(tipo==2){
			this.direccionar(sc, request, response, "/Gts/usuario/agregarusuario.jsp");
		}
		if(tipo==1){
			UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
			
			ResultadoRolData rolData = new ResultadoRolData();
			rolData.setCodigo(codigo);
			usuarioFuncion.estadoRol(rolData);
			this.direccionar(sc, request, response, "/Gts/rol/buscarrol.jsp");
		}
	}

}