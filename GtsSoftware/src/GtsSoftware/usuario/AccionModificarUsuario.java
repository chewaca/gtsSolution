package GtsSoftware.usuario;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.general.UsuarioBeanFunction;

public class AccionModificarUsuario extends CoAccion {
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		HttpSession sesion= request.getSession(true);
		int tipo = Integer.parseInt(request.getParameter("tipo"));
		if(tipo==1){
			UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
			UsuarioBeanData usuario = usuarioFuncion.crear(request, response);
			ResultadoUsuarioBeanData resultado = usuarioFuncion.buscarUsuarioUnico(usuario);
			Vector<ResultadoRol> cmbRol = usuarioFuncion.comboRol();
			sesion.setAttribute("cmbRol",cmbRol);
			request.setAttribute("resultado", resultado);
			this.direccionar(sc, request, response, "/Gts/usuario/modificarusuario.jsp");
		}
		if(tipo==2){
			UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
			UsuarioBeanData usuario = usuarioFuncion.crearUsuarioModificar(request, response);
			Vector<ResultadoRol> cmbRol = usuarioFuncion.comboRol();
			sesion.setAttribute("cmbRol",cmbRol);
			usuarioFuncion.modificarUsuario(usuario);
			this.direccionar(sc, request, response, "/Gts/usuario/buscarusuario.jsp");
		}
		if(tipo==3){
			UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
			UsuarioBeanData usuario = new UsuarioBeanData();
			int codigo=Integer.parseInt(request.getParameter("codigoUsuario"));
			usuario.setCodigo(codigo);
			ResultadoUsuarioBeanData resultado = usuarioFuncion.buscarUsuarioUnico(usuario);
			Vector<ResultadoRol> cmbRol = usuarioFuncion.comboRol();
			sesion.setAttribute("cmbRol",cmbRol);
			request.setAttribute("resultado", resultado);
			this.direccionar(sc, request, response, "/Gts/usuario/visualizarusuario.jsp");
		}
	}
}
