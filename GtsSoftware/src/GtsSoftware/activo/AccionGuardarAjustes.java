package GtsSoftware.activo;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionGuardarAjustes extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		String activosAjuste=request.getParameter("activoAjuste");
		String[] activosCodigo=activosAjuste.split(",");
		String[] activosMotivo=request.getParameterValues("txtMotivo");
		Integer j=0;
		
		for(int i=0;i<activosMotivo.length;i++){
			if(activosMotivo[i].equals("")){
			}
			else{
				j++;
			}			
		}
		
		String[] activosMotivoAux=new String[j];
		j=0;
		
		for(int i=0;i<activosMotivo.length;i++){
			if(activosMotivo[i].equals("")){
			}
			else{
				activosMotivoAux[j]=activosMotivo[i];
				j++;
			}			
		}
		
		ActivoBeanFuncion activoFuncion=ActivoBeanFuncion.getInstanceS();
		activoFuncion.modificarActivoDeBaja(activosMotivoAux, activosCodigo);
		
		
		
		this.direccionar(sc, request, response, "/Gts/activo/buscarinventario.jsp");
	}

}
