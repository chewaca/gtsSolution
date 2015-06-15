package GtsSoftware.actividad;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import GtsSoftware.general.MyBatisSesion;

public class CriterioActividadBeanFuncion {

	SimpleDateFormat DF = new SimpleDateFormat("dd/MM/yyyy");

	public CriterioActividadBeanData crearCriterio(HttpServletRequest request, HttpServletResponse response){
		
		CriterioActividadBeanData criterioProcesoData= new CriterioActividadBeanData();
		
		criterioProcesoData.setNombre(request.getParameter("txtNombre")+"%");
		//criterioProcesoData.setDescripcion(request.getParameter("txtDescripcion")+"%");
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
	
	public synchronized Vector<ResultadoActividadBeanData> buscarPlantillaActividad(CriterioActividadBeanData criterioActividadData){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoActividadBeanData> resultadosV=null;
					
		try{		
			List<ResultadoActividadBeanData> resultados=sqlsesion.selectList("Data.mappers.actividad.buscarActividad",criterioActividadData);
			
			resultadosV= new Vector<ResultadoActividadBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
}
