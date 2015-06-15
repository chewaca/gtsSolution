package GtsSoftware.tipomoneda;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import GtsSoftware.general.MyBatisSesion;

public class CriterioTipoMonedaBeanFuncion {

	SimpleDateFormat DF = new SimpleDateFormat("dd/MM/yyyy");

	public CriterioTipoMonedaBeanData crearCriterio(HttpServletRequest request, HttpServletResponse response){
		
		CriterioTipoMonedaBeanData criterioProcesoData= new CriterioTipoMonedaBeanData();
		
		//criterioPromocionData.setTipo(Integer.parseInt(request.getParameter("cmbTipoEvento")==null?"0":request.getParameter("cmbTipoEvento")));
		criterioProcesoData.setNombre(request.getParameter("txtNombre")+"%");
		criterioProcesoData.setDescripcion(request.getParameter("txtDescripcion")+"%");
		//criterioProcesoData.setApellidoPaterno(request.getParameter("txtApellidoPaterno")+"%");
		Integer est=0;
		
		String estado=request.getParameter("cmdEstado");
		
		if (estado!=null){
			
			
			if(estado.equals("Activo")){				
				est=1;
			}				
			
			if(estado.equals("Inactivo")){
				est=2;
			}
			
			if(estado.equals("En proceso")){
				est=3;
			}
			
			criterioProcesoData.setEstado((est));
		}
	
	
		return criterioProcesoData;				
	}
	
	public synchronized Vector<ResultadoTipoMonedaBeanData> buscarPlantillaProceso(CriterioTipoMonedaBeanData criterioProcesoData){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoTipoMonedaBeanData> resultadosV=null;
					
		try{		
			List<ResultadoTipoMonedaBeanData> resultados=sqlsesion.selectList("buscarProceso",criterioProcesoData);
			
			resultadosV= new Vector<ResultadoTipoMonedaBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
}
