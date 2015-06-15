package GtsSoftware.general;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AccionModificar extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		ConfiguracionBeanFunction configuracionFuncion= ConfiguracionBeanFunction.getInstanceS();
		
		ConfiguracionBeanData configuracionDataAux=configuracionFuncion.crearConfiguracionModificarAux(request, response);
		configuracionDataAux.setIdConfiguracion(1);
		configuracionFuncion.modificarConfiguracion(configuracionDataAux);
		
		ConfiguracionBeanData configuracionData=configuracionFuncion.crearConfiguracionModificar(request, response);
		configuracionData.setIdConfiguracion(2);
		configuracionFuncion.modificarConfiguracion(configuracionData);
				
		this.direccionar(sc, request, response, "/Gts/configuracion/modificarconfiguracion.jsp");		
	}

}
