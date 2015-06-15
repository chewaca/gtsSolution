package GtsSoftware.tipomoneda;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
//import GtsSoftware.proceso.*;

public class AccionAgregarTipoMoneda extends CoAccion{
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		//esto lo saca del html
		int tipo=Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==2){

			TipoMonedaBeanFuncion tipomonedaFuncion= TipoMonedaBeanFuncion.getInstanceS();
			
			//saca los datos de la vista
			TipoMonedaBeanData tipomonedaData=tipomonedaFuncion.crearTipoMoneda(request, response);
			
			//inserta los datos en BD
			tipomonedaFuncion.agregarTipoMoneda(tipomonedaData);
			
			//se puede usar en el html
			request.setAttribute("tipomoneda", tipomonedaData);
			
			this.direccionar(sc, request, response, "/Gts/proceso/buscarproceso.jsp");
		
		}
		
		this.direccionar(sc, request, response, "/Gts/proceso/agregarproceso.jsp");

	}
}
