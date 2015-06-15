package GtsSoftware.activo;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import GtsSoftware.general.MyBatisSesion;

public class CriterioActividadBeanFuncion {

	private Integer bajoMantenimiento=1;
	SimpleDateFormat DF = new SimpleDateFormat("dd/MM/yyyy");
	
	public CriterioActivoBeanData crearCriterioGeneral(HttpServletRequest request, HttpServletResponse response){
		
		CriterioActivoBeanData criterioActivoData= new CriterioActivoBeanData();
		
		criterioActivoData.setNombre(request.getParameter("txtNombre")+"%");
		criterioActivoData.setNumeroSerie(request.getParameter("txtNumeroSerie")+"%");
		criterioActivoData.setNombreExtra(request.getParameter("txtNombre"));
		criterioActivoData.setNumeroSerieExtra(request.getParameter("txtNumeroSerie"));	
		String local="0".equals(request.getParameter("cmdUbicacion"))?"0":request.getParameter("cmdUbicacion");
		criterioActivoData.setIdLocal(Integer.parseInt(local));
		
		String estado="0".equals(request.getParameter("cmdEstado"))?"0":request.getParameter("cmdEstado");
		criterioActivoData.setEstado(Integer.parseInt(estado));
		
		return criterioActivoData;				
	}
	
	
	public CriterioActivoBeanData crearCriterio(HttpServletRequest request, HttpServletResponse response){
		
		CriterioActivoBeanData criterioProcesoData= new CriterioActivoBeanData();
		
		criterioProcesoData.setNombre(request.getParameter("txtNombre")==""?null:"%"+request.getParameter("txtNombre")+"%");
		criterioProcesoData.setNumeroSerie(request.getParameter("txtNumeroSerie")==""?null:"%"+request.getParameter("txtNumeroSerie")+"%");
				
		String local="0".equals(request.getParameter("cmdUbicacion"))?"0":request.getParameter("cmdUbicacion");
		criterioProcesoData.setIdLocal(Integer.parseInt(local));
		
		String estado="0".equals(request.getParameter("cmdEstado"))?"0":request.getParameter("cmdEstado");
		criterioProcesoData.setEstado(Integer.parseInt(estado));
				
		criterioProcesoData.setBajoMantenimiento(bajoMantenimiento);
		
		return criterioProcesoData;				
	}
	
	
	public ActivoBeanData crearCriterioInventario(HttpServletRequest request, HttpServletResponse response){
		
		ActivoBeanData criterioProcesoData= new ActivoBeanData();

		String local="0".equals(request.getParameter("cmdUbicacion"))?"0":request.getParameter("cmdUbicacion");
		criterioProcesoData.setIdLocal(Integer.parseInt(local));
				
		return criterioProcesoData;				
	}
	
	public CriterioActivoBeanData crearCriterioRepuesto(HttpServletRequest request, HttpServletResponse response){
		
		CriterioActivoBeanData criterioProcesoData= new CriterioActivoBeanData();
		
		criterioProcesoData.setNombre(request.getParameter("txtNombre")==""?null:"%"+request.getParameter("txtNombre")+"%");
		criterioProcesoData.setNumeroSerie(request.getParameter("txtNumeroSerie")==""?null:"%"+request.getParameter("txtNumeroSerie")+"%");
		
		String local="0".equals(request.getParameter("cmdUbicacion"))?"0":request.getParameter("cmdUbicacion");
		criterioProcesoData.setIdLocal(Integer.parseInt(local));
		
		String estado="0".equals(request.getParameter("cmdEstado"))?"0":request.getParameter("cmdEstado");
		criterioProcesoData.setEstado(Integer.parseInt(estado));
		
		return criterioProcesoData;				
	}
	
	
	public synchronized Vector<ResultadoActivoBeanData> buscarPlantillaRepuesto(CriterioActivoBeanData criterioActivoData){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoActivoBeanData> resultadosV=null;
					
		try{		
			List<ResultadoActivoBeanData> resultados=sqlsesion.selectList("Data.mappers.activo.buscarRepuesto",criterioActivoData);
			
			resultadosV= new Vector<ResultadoActivoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}		
		return resultadosV;
		
	}
	
	public synchronized Vector<ResultadoActivoBeanData> buscarPlantillaActivoGeneral(CriterioActivoBeanData criterioActivoData){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoActivoBeanData> resultadosV=null;
					
		try{		
			List<ResultadoActivoBeanData> resultados=sqlsesion.selectList("Data.mappers.activo.buscarActivoGeneral",criterioActivoData);
			
			resultadosV= new Vector<ResultadoActivoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}		
		return resultadosV;
		
	}
	
	public synchronized Vector<ResultadoActivoBeanData> buscarPlantillaActivo(CriterioActivoBeanData criterioActivoData){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoActivoBeanData> resultadosV=null;
					
		try{		
			List<ResultadoActivoBeanData> resultados=sqlsesion.selectList("Data.mappers.activo.buscarActivo",criterioActivoData);
			
			resultadosV= new Vector<ResultadoActivoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		return resultadosV;
	}
}
