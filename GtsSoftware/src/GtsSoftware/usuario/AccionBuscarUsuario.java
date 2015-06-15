package GtsSoftware.usuario;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.general.UsuarioBeanFunction;

public class AccionBuscarUsuario extends CoAccion {
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		int tipo = Integer.parseInt(request.getParameter("tipo"));
		if(tipo==1){
			CriterioUsuarioBeanData criterioUsuarioData = new CriterioUsuarioBeanFuncion().crearCriterio(request, response);
			Vector<ResultadoUsuarioBeanData> resultados = new CriterioUsuarioBeanFuncion().buscarUsuarios(criterioUsuarioData);
			UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
			Vector<ResultadoRol> cmbRol = usuarioFuncion.comboRol();
			CriterioBusqueda criterio = new CriterioBusqueda();
			request.setAttribute("cmbRol",cmbRol);
			request.setAttribute("resultados", resultados);
			criterio.setCodigo(request.getParameter("txtCodigo"));
			criterio.setNombre(request.getParameter("txtNombre"));
			criterio.setEstado(request.getParameter("cmdEstado"));
			criterio.setCodrol(Integer.parseInt(request.getParameter("cmbxRol")));
			request.setAttribute("criterio",criterio);
			this.direccionar(sc, request, response, "/Gts/usuario/buscarusuario.jsp");
		}
		if(tipo==2){
			UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
			UsuarioBeanData usuario = usuarioFuncion.crear(request, response);
			ResultadoUsuarioBeanData resultado = usuarioFuncion.buscarUsuarioUnico(usuario);
			
			request.setAttribute("resultado", resultado);
			this.direccionar(sc, request, response, "/Gts/usuario/visualizarusuario.jsp");
		}
	}
}
