package GtsSoftware.programacion;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import GtsSoftware.general.MyBatisSesion;

public class CriterioProgramacionBeanFuncion {

	SimpleDateFormat DF = new SimpleDateFormat("dd/MM/yyyy");

	public CriterioProgramacionBeanData crearCriterio(HttpServletRequest request, HttpServletResponse response){
		
		CriterioProgramacionBeanData criterioPrograData= new CriterioProgramacionBeanData();
		
		//criterioPromocionData.setTipo(Integer.parseInt(request.getParameter("cmbTipoEvento")==null?"0":request.getParameter("cmbTipoEvento")));
		//criterioPrograData.setNombre(request.getParameter("txtNombre")+"%");
		criterioPrograData.setDescripcion(request.getParameter("txtDescripcion")+"%");
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
			
			criterioPrograData.setEstado((est));
		}
	
	
		return criterioPrograData;				
	}
	
	public synchronized Vector<ResultadoProgramacionBeanData> buscarPlantillaProgramacion(CriterioProgramacionBeanData criterioPrograData){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProgramacionBeanData> resultadosV=null;
					
		try{		
			List<ResultadoProgramacionBeanData> resultados=sqlsesion.selectList("buscarProgramacion",criterioPrograData);
			resultadosV= new Vector<ResultadoProgramacionBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}		
		return resultadosV;		
	}
}

