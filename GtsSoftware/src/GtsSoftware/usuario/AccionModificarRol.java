package GtsSoftware.usuario;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;


public class AccionModificarRol extends CoAccion {
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		int tipo=Integer.parseInt(request.getParameter("tipo"));
		
		
		if (tipo==1){
			int codigo=Integer.parseInt(request.getParameter("codigo"));
			UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
			CriterioRolBeanData criterioRolData = new CriterioRolBeanData();
			criterioRolData.setCodigo(codigo);
			ResultadoRolData resultado = usuarioFuncion.buscarRolUnico(criterioRolData);
			
			request.setAttribute("resultado",resultado);
			this.direccionar(sc, request, response, "/Gts/rol/modificarrol.jsp");
		}
		if(tipo==2){
			UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
			CriterioRolBeanData criterioRolData = new CriterioRolBeanData();
			criterioRolData.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
			ResultadoRolData resultado = usuarioFuncion.buscarRolUnico(criterioRolData);
			resultado.setNombre(request.getParameter("txtNombre"));
			resultado.setDescripcion(request.getParameter("txtDescripcion"));
			usuarioFuncion.modificarRol(resultado);
			request.setAttribute("resultado",resultado);
			this.direccionar(sc, request, response, "/Gts/rol/visualizarrol.jsp");
		}
		if(tipo==3){
			int codigo=Integer.parseInt(request.getParameter("codigo"));
			UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
			CriterioRolBeanData criterioRolData = new CriterioRolBeanData();
			criterioRolData.setCodigo(codigo);
			ResultadoRolData resultado = usuarioFuncion.buscarRolUnico(criterioRolData);
			
			request.setAttribute("resultado",resultado);
			this.direccionar(sc, request, response, "/Gts/rol/visualizarrol.jsp");
		}
	}

}
