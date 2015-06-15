package GtsSoftware.usuario;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionCmbRol extends CoAccion {
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
		Vector<ResultadoRol> cmbRol = usuarioFuncion.comboRol();
		CriterioBusqueda criterio = new CriterioBusqueda();
		criterio.setEstado("Activo");
		request.setAttribute("criterio", criterio);
		request.setAttribute("cmbRol",cmbRol);
		this.direccionar(sc, request, response, "/Gts/usuario/buscarusuario.jsp");
	}

}
