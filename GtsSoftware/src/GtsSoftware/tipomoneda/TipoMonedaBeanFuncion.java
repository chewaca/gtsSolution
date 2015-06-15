package GtsSoftware.tipomoneda;


import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import GtsSoftware.general.CoException;
import GtsSoftware.general.MyBatisSesion;

public class TipoMonedaBeanFuncion {

	static private TipoMonedaBeanFuncion ProcesoFuncion=null;
	
	SimpleDateFormat DF1 = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat DF2 = new SimpleDateFormat("dd/MM/yyyy");
	
    public static TipoMonedaBeanFuncion getInstanceS(){
       if(ProcesoFuncion==null) ProcesoFuncion= new TipoMonedaBeanFuncion();
       
       return ProcesoFuncion;
    }
	   
	private TipoMonedaBeanFuncion() {}
	
	public TipoMonedaBeanData crearTipoMoneda(HttpServletRequest request, HttpServletResponse response){
		TipoMonedaBeanData TipoMonedaData= new TipoMonedaBeanData();
		try{
		
		TipoMonedaData.setNombre((request.getParameter("txtNombre")));
		TipoMonedaData.setSigla(request.getParameter("txtSigla"));
				
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return TipoMonedaData;		
	} 
	
	public TipoMonedaBeanData crearProcesoModificar(HttpServletRequest request, HttpServletResponse response){
		TipoMonedaBeanData procesoData= new TipoMonedaBeanData();
		try{		
		
		procesoData.setNombre((request.getParameter("txtNombre")));
		//procesoData.setDescripcion(request.getParameter("txtDescripcion"));
				
		//Date fechaInicio=new Date(DF1.parse(request.getParameter("fFechaInicio")).getTime());
		//procesoData.setFechaInicio(fechaInicio);
		
		//Date fechaFin=new Date(DF2.parse(request.getParameter("fFechaFin")).getTime());
		//procesoData.setFechaFin(fechaFin);
		
		Integer valor=0;
		
		if (request.getParameter("rButton")!=null){
			String estado;
			estado=request.getParameter("rButton");
			
			if(estado.equals("Activo")){
				valor=1;
			}
			if(estado.equals("Inactivo")){
				valor=2;
			}
						
			
		}
		//procesoData.setEstado(valor);
		
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return procesoData;		
	} 

	public synchronized boolean agregarTipoMoneda(TipoMonedaBeanData tipomonedaData) throws CoException {
		boolean resultado=false;		
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{

			Integer codigo= sqlsesion.selectOne("Data.mappers.tipomoneda.sacarCodigo");
			
			if(codigo!=null){

				int cod= codigo + 1;
				tipomonedaData.setCodigo(cod);
			}
			
			else tipomonedaData.setCodigo(1);
							
			sqlsesion.insert("Data.mappers.tipomoneda.insertarTipoMoneda",tipomonedaData);
			
			resultado=true;
		}
		catch(Exception a){
			sqlsesion.rollback();
			a.printStackTrace();
			//throw CoException.set("Error: Nombre de evento repetido", "SMSEvento?accion=Agregar&tipo=1");
		}
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}
			
		return resultado;
	}	
	
//	public synchronized void modificarSocio(SocioBeanData socio) throws CoException {
//	
//		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
//		try{
//					
//			sqlsesion.update("Data.venta.socio.updateSocio",socio);
//		}
//		catch(Exception a)		
//		{sqlsesion.rollback();
//		a.printStackTrace();
//			throw CoException.set("Error: No se pudo modificar la plantilla intente de nuevo", "SMVSocio?accion=Modificar&tipo=1");
//			
//		}
//		
//		finally{
//			sqlsesion.commit();
//			sqlsesion.close();
//			
//		}			
//		return ;
//	}
	
	public synchronized TipoMonedaBeanData consultarProceso(Integer codigo){
		
	TipoMonedaBeanData procesoData=null;
	SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
	try{
		procesoData= sqlsesion.selectOne("Data.mappers.proceso.buscarUnProceso",codigo);
	}
	finally{
		sqlsesion.close();
		
	}
	return procesoData;
	}
	
	
	public synchronized int consultarOrdenMaxProceso(Integer codigo){
		
		int orden;
		//SubprocesoBeanData subprocesoData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			orden= sqlsesion.selectOne("Data.mappers.subproceso.sacarMaxOrden",codigo);
			//int orden=subprocesoData.get
		}
		finally{
			sqlsesion.close();
			
		}
		return orden;
	}
	
	
	public void modificarProceso(TipoMonedaBeanData proceso) throws CoException {
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
					
			sqlsesion.update("Data.mappers.proceso.modificarProceso",proceso);
		}
		catch(Exception a)		
		{sqlsesion.rollback();
		a.printStackTrace();
			//throw CoException.set("Error: No se pudo modificar el familiar, intente de nuevo", "SMVFamiliar?accion=Modificar&tipo=1");
			
		}
		
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}			
		return ;
	}
	
}
