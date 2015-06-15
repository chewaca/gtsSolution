package GtsSoftware.activo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import GtsSoftware.general.CoException;
import GtsSoftware.general.Constants;
import GtsSoftware.general.MyBatisSesion;
import GtsSoftware.local.LocalBeanData;
import GtsSoftware.marca.MarcaBeanData;
import GtsSoftware.programacion.ResultadoProgramacionBeanData;
import GtsSoftware.proveedor.ProveedorBeanData;
import GtsSoftware.tipomoneda.TipoMonedaBeanData;

public class ActivoBeanFuncion {

	static private ActivoBeanFuncion actividadFuncion=null;
	
	SimpleDateFormat DF1 = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat DF2 = new SimpleDateFormat("dd/MM/yyyy");

	   public static ActivoBeanFuncion getInstanceS(){
	       if(actividadFuncion==null) actividadFuncion= new ActivoBeanFuncion();
	       
	       return actividadFuncion;
	   }
	   
	   private ActivoBeanFuncion() {}
	
	   
	   public ActivoBeanData crearActivo(HttpServletRequest request, HttpServletResponse response){
		ActivoBeanData activoData= new ActivoBeanData();
		try{		
		
		activoData.setNumeroSerie(request.getParameter("txtNumeroSerie")==""?null:request.getParameter("txtNumeroSerie"));
		activoData.setCodigoPatrimonial(request.getParameter("txtCodigoPatrimonial")==""?null:request.getParameter("txtCodigoPatrimonial"));
//		activoData.setNombre((request.getParameter("txtNombre")));
		Date fechaCompra=new Date(DF1.parse(request.getParameter("fFechaCompra")).getTime());
		activoData.setFechaCompra(fechaCompra);
		
		Date fechaVencimientoGarantia=new Date(DF1.parse(request.getParameter("fFechaVencimientoGarantia")).getTime());
		activoData.setFechaVencimientoGarantia(fechaVencimientoGarantia);
		
		//para crear un registro con la fecha de hoy, formato DATE
		Date date = new Date(); 
		String fecha = DF1.format(date);
		Date fechaRegistro= DF1.parse(fecha); 
		activoData.setFechaRegistro((fechaRegistro));
		
		activoData.setMontoCompra((request.getParameter("txtMontoCompra")==""?null:Float.parseFloat(request.getParameter("txtMontoCompra"))));
		activoData.setTipoActivo((request.getParameter("cmbTipoActivo")==""?null:Integer.parseInt(request.getParameter("cmbTipoActivo"))));
		activoData.setTipoMoneda((request.getParameter("cmbTipoMoneda")==""?null:Integer.parseInt(request.getParameter("cmbTipoMoneda"))));
		activoData.setProveedor((request.getParameter("cmbProveedor")==""?null:Integer.parseInt(request.getParameter("cmbProveedor"))));
		activoData.setIdMarca((request.getParameter("cmbMarca")==""?null:Integer.parseInt(request.getParameter("cmbMarca"))));
//		activoData.setDescripcion(request.getParameter("txtDescripcion"));
		activoData.setBajoMantenimiento(Integer.parseInt(request.getParameter("rButton")));
		activoData.setIdLocal((request.getParameter("cmbLocal")==""?null:Integer.parseInt(request.getParameter("cmbLocal"))));
		
		activoData.setEstado(Constants.OPER_CALIBRADO);
		
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return activoData;		
	} 
	
	   
	public ActivoBeanData crearActivoModificar(HttpServletRequest request, HttpServletResponse response){
		ActivoBeanData activoData= new ActivoBeanData();
		try{		
		
		activoData.setMotivoBaja(request.getParameter("txtMotivoBaja"));
		
		//para crear un registro con la fecha de hoy, formato DATE
		Date date = new Date(); 
		String fecha = DF1.format(date);
		Date fechaBaja= DF1.parse(fecha); 
		activoData.setFechaBaja((fechaBaja));
		
		activoData.setEstado(Constants.DE_BAJA);//8= De baja
		
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return activoData;		
	}
	
	
	public ActivoBeanData crearActivoModificarGeneral(HttpServletRequest request, HttpServletResponse response){
		ActivoBeanData activoData= new ActivoBeanData();
		try{		
		
			activoData.setNumeroSerie(request.getParameter("txtNumeroSerie"));
			activoData.setCodigoPatrimonial(request.getParameter("txtCodigoPatrimonial"));
			activoData.setNombre((request.getParameter("cmbTipoActivo")));
			Date fechaCompra=new Date(DF1.parse(request.getParameter("fFechaCompra")).getTime());
			activoData.setFechaCompra(fechaCompra);
			
			Date fechaRegistro=new Date(DF1.parse(request.getParameter("fFechaRegistro")).getTime());
			activoData.setFechaRegistro(fechaRegistro);
			
			activoData.setMontoCompra(request.getParameter("txtMontoCompra")==""?null:Float.parseFloat(request.getParameter("txtMontoCompra")));
			activoData.setTipoActivo(request.getParameter("cmbTipoActivo")==""?null:Integer.parseInt(request.getParameter("cmbTipoActivo")));
			activoData.setTipoMoneda(request.getParameter("cmbTipoMoneda")==""?null:Integer.parseInt(request.getParameter("cmbTipoMoneda")));
			activoData.setProveedor(Integer.parseInt(request.getParameter("cmbProveedor")));
			activoData.setIdMarca(request.getParameter("cmbMarca")==""?null:Integer.parseInt(request.getParameter("cmbMarca")));
			//activoData.setBajoMantenimiento(Integer.parseInt(request.getParameter("rButton")));
			activoData.setIdLocal(Integer.parseInt(request.getParameter("cmbLocal")));
			
			activoData.setEstado(Constants.OPER_CALIBRADO);
		
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return activoData;		
	}
	

	public synchronized boolean agregarActivo(ActivoBeanData activoData) throws CoException {
		boolean resultado=false;		
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{			
			//se llama  la funcion creada en actividad_mapper, usando el namespace.funcion
			Integer codigo= sqlsesion.selectOne("Data.mappers.activo.sacarCodigo");
			
			if(codigo!=null){
				int cod= codigo + 1;
				activoData.setCodigo(cod);
			}			
			else activoData.setCodigo(1);
							
			sqlsesion.insert("Data.mappers.activo.insertarActivo",activoData);
			
			resultado=true;
		}
		catch(Exception a){
			sqlsesion.rollback();
			a.printStackTrace();
			throw CoException.set("Error: Nombre de activo repetido", "SMVActivo?accion=Agregar&tipo=1");
		}
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}			
		return resultado;
	}
	
	
	
	public synchronized boolean agregarNuevoEnInventario(InventarioActivoBeanData inventarioData) throws CoException {
		boolean resultado=false;		
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{			
			//se llama  la funcion creada en actividad_mapper, usando el namespace.funcion
			Integer codigo= sqlsesion.selectOne("Data.mappers.activo.sacarCodigoInventario");
			
			if(codigo!=null){
				int cod= codigo + 1;
				inventarioData.setIdInventario(cod);
			}			
			else inventarioData.setIdInventario(1);
							
			sqlsesion.insert("Data.mappers.activo.insertarActivoInventario",inventarioData);
			
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
	
	
	public synchronized boolean agregarActivoMultiple(HttpServletRequest request, HttpServletResponse response, ActivoBeanData activoData) throws CoException {		boolean resultado=false;		
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			String[] valores = request.getParameterValues("vectorActivos");
			String[] activos=valores[0].split(",");
			
			Integer codigoProgramacion=Integer.parseInt(request.getParameter("codigoActivo"));
			ProgramacionActivoBeanData activoDataMultiple=new ProgramacionActivoBeanData();
			
			for(int i=0;i<activos.length;i++){
				Integer codigoActivo=Integer.parseInt(activos[i]);
				activoDataMultiple.setIdProgramacion(codigoProgramacion);
				activoDataMultiple.setIdActivo(codigoActivo);
				
				Integer codigo= sqlsesion.selectOne("Data.mappers.activo.sacarCodigoProgramacionActivo");
				
				if(codigo!=null){

					int cod= codigo + 1;
					activoDataMultiple.setIdActivoProgramada(cod);
				}
				
				else activoDataMultiple.setIdActivoProgramada(1);
				
				sqlsesion.insert("Data.mappers.activo.insertarProgramacionActivo",activoDataMultiple);
			}			
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

	
	public synchronized boolean agregarRepuestoMultiple(HttpServletRequest request, HttpServletResponse response, Integer idActivo) throws CoException {		boolean resultado=false;		
	
	SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
	try{
		String[] valores = request.getParameterValues("vectorRepuestos");
		String[] repuestos=valores[0].split(",");
		
		ActivoBeanData repuestoData=new ActivoBeanData();
		
		for(int i=0;i<repuestos.length;i++){
			Integer codigoRepuesto=Integer.parseInt(repuestos[i]);
			repuestoData.setIdActivoPadre(idActivo);
			repuestoData.setCodigo(codigoRepuesto);
			
			sqlsesion.update("Data.mappers.activo.modificarRepuesto",repuestoData);
		}		
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
	
	
	
	public synchronized ActivoBeanData consultarActivo(Integer codigo){
		
		ActivoBeanData activoData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			activoData= sqlsesion.selectOne("Data.mappers.activo.buscarUnActivo",codigo);
		}
		finally{
			sqlsesion.close();		
		}
		return activoData;
	}
	
	
	public synchronized InventarioActivoBeanData consultarEnInventario(ActivoBeanData activoData){
		
		InventarioActivoBeanData inventarioData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			inventarioData= sqlsesion.selectOne("Data.mappers.activo.buscarEnInventario",activoData);
		}
		finally{
			sqlsesion.close();			
		}
		return inventarioData;
	}
	
	
	public synchronized Vector<ResultadoActivoBeanData> consultarListaActivosInventario(ActivoBeanData activoData){
		
		Vector<ResultadoActivoBeanData> resultadosV=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			List<ResultadoActivoBeanData> resultados= sqlsesion.selectList("Data.mappers.activo.buscarListaActivosInventario",activoData);
			resultadosV= new Vector<ResultadoActivoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();			
		}
		return resultadosV;
	}
	
	
	public synchronized Vector<InventarioActivoBeanData> consultarListaEnInventario(ActivoBeanData activoData){
		
		Vector<InventarioActivoBeanData> resultadosV=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			List<InventarioActivoBeanData> resultados= sqlsesion.selectList("Data.mappers.activo.buscarEnInventarioLocal",activoData);
			resultadosV= new Vector<InventarioActivoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();			
		}
		return resultadosV;
	}
	
	
	public synchronized Vector<ResultadoActivoBeanData> consultarListaVistoMalo(Vector<Integer> vectorTipoActivo,Vector<Integer> vectorLocal){
		
		Vector<ResultadoActivoBeanData> resultadosAux=new Vector<ResultadoActivoBeanData>();
		List<ResultadoActivoBeanData> resultados=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			
			for(int i=0;i<vectorTipoActivo.size();i++){
				ActivoBeanData activoData=new ActivoBeanData();
				
				activoData.setIdLocal(vectorLocal.get(i));
				activoData.setTipoActivo(vectorTipoActivo.get(i));
				resultados= sqlsesion.selectList("Data.mappers.activo.buscarListaActivosInventario",activoData);
				
				for(int j=0;j<resultados.size();j++){
					
					resultadosAux.add(resultados.get(j));
				}
			}			
		}
		finally{
			sqlsesion.close();			
		}
		return resultadosAux;
	}
	
	
	
	public synchronized Float contarCantidadActivoHistorico(Integer codigo){
		
		Float cantidadActivos=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			cantidadActivos= sqlsesion.selectOne("Data.mappers.activo.contarCantidadActivoHistorico",codigo);
		}
		finally{
			sqlsesion.close();
			
		}
		return cantidadActivos;
	}
	
	
	public synchronized Float contarActivoProgramacion(Integer codigo){
		
		Float cantidadActivos=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			cantidadActivos= sqlsesion.selectOne("Data.mappers.programacion.contarActivoProgramacion",codigo);
		}
		finally{
			sqlsesion.close();
			
		}
		return cantidadActivos;
	}
	
	
	public synchronized TipoMonedaBeanData consultarTipoMoneda(Integer codigo){
		
		TipoMonedaBeanData tipoMonedaData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			tipoMonedaData= sqlsesion.selectOne("Data.mappers.activo.buscarUnTipoMoneda",codigo);
		}
		finally{
			sqlsesion.close();
			
		}
		return tipoMonedaData;
	}
	
	
	public synchronized ProveedorBeanData consultarProveedor(Integer codigo){
		
		ProveedorBeanData proveedorData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			proveedorData= sqlsesion.selectOne("Data.mappers.activo.buscarUnProveedor",codigo);
		}
		finally{
			sqlsesion.close();			
		}
		return proveedorData;
	}
	
	
	public synchronized TipoActivoBeanData consultarTipoActivo(Integer codigo){
		
		TipoActivoBeanData tipoActivoData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			tipoActivoData= sqlsesion.selectOne("Data.mappers.activo.buscarUnTipoActivo",codigo);
		}
		finally{
			sqlsesion.close();
			
		}
		return tipoActivoData;
	}
	
	
	//BUSCAR un único local para un activo en especial
	public synchronized LocalBeanData consultarLocal(Integer idLocal){
		
		LocalBeanData localData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			localData= sqlsesion.selectOne("Data.mappers.activo.buscarUnLocal",idLocal);
		}
		finally{
			sqlsesion.close();			
		}
		return localData;
	}
	
	
	//BUSCAR un única marca para un activo en especial
	public synchronized MarcaBeanData consultarMarca(Integer idMarca){
			
		MarcaBeanData marcaData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			marcaData= sqlsesion.selectOne("Data.mappers.activo.buscarUnaMarca",idMarca);
		}
		finally{
			sqlsesion.close();			
		}
		return marcaData;
	}
	
	
	//Consulta todos los tipos de activo de la BD
	public synchronized Vector<TipoActivoBeanData> consultarTipoActivos(){
		
		Vector<TipoActivoBeanData> resultadosV=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			List<TipoActivoBeanData> resultados= sqlsesion.selectList("Data.mappers.activo.buscarTipoActivo");
			resultadosV= new Vector<TipoActivoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();			
		}
		return resultadosV;
	}
	
	
	//busca todos los activos diferentes del estado 4, de baja
	public synchronized Vector<ActivoBeanData> consultarActivos(){
		
		Vector<ActivoBeanData> resultadosV=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			List<ActivoBeanData> resultados= sqlsesion.selectList("Data.mappers.activo.buscarActivos");
			resultadosV= new Vector<ActivoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();			
		}
		return resultadosV;
	}
	
	
	//Consulta todos los locales de la BD
	public synchronized Vector<LocalBeanData> consultarLocales(){
		
		Vector<LocalBeanData> resultadosV=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			List<LocalBeanData> resultados= sqlsesion.selectList("Data.mappers.activo.buscarLocales");
			resultadosV= new Vector<LocalBeanData>(resultados);
		}
		finally{
			sqlsesion.close();			
		}
		return resultadosV;
	}
	
	
	//Consulta todos los tipos de moneda de la BD
	public synchronized Vector<TipoMonedaBeanData> consultarTipoMonedas(){
			
		Vector<TipoMonedaBeanData> resultadosV=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			List<TipoMonedaBeanData> resultados= sqlsesion.selectList("Data.mappers.activo.buscarTipoMonedas");
			resultadosV= new Vector<TipoMonedaBeanData>(resultados);
		}
		finally{
			sqlsesion.close();			
		}
		return resultadosV;
	}
	
	
	
	//Consulta todos los tipos de moneda de la BD
	public synchronized Vector<ProveedorBeanData> consultarProveedores(){
				
		Vector<ProveedorBeanData> resultadosV=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			List<ProveedorBeanData> resultados= sqlsesion.selectList("Data.mappers.activo.buscarProveedores");
			resultadosV= new Vector<ProveedorBeanData>(resultados);
		}
		finally{
			sqlsesion.close();			
		}
		return resultadosV;
	}
	
	
	
	//Consulta todos los marcas de activo de la BD
	public synchronized Vector<MarcaBeanData> consultarMarcas(){
					
		Vector<MarcaBeanData> resultadosV=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			List<MarcaBeanData> resultados= sqlsesion.selectList("Data.mappers.activo.buscarMarcas");
			resultadosV= new Vector<MarcaBeanData>(resultados);
		}
		finally{
			sqlsesion.close();				
		}
		return resultadosV;
	}
	
	
	public synchronized int consultarOrdenMaxactivo(Integer codigo){
		
		int orden;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			orden= sqlsesion.selectOne("Data.mappers.subactividad.sacarMaxOrden",codigo);
		}
		finally{
			sqlsesion.close();			
		}
		return orden;
	}
	
	
	public void modificaractivo(ActivoBeanData actividad) throws CoException {
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
					
			sqlsesion.update("Data.mappers.actividad.modificaractividad",actividad);
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
	
	
	public synchronized Vector<LocalBeanData> buscarPlantillaLocalesActivos(Vector<ResultadoActivoBeanData> resultadosActivos){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<LocalBeanData> resultadosV=new Vector<LocalBeanData>();
					
		try{			
			for(int i=0;i<resultadosActivos.size();i++){
				
				ResultadoActivoBeanData activoData=resultadosActivos.get(i);
				Integer idLocal=activoData.getIdLocal();
				LocalBeanData resultados=sqlsesion.selectOne("Data.mappers.activo.buscarUnLocal",idLocal);
				
				if(resultados==null)	
					resultadosV.add(null);
				else
					resultadosV.add(resultados);
			}
		}
		finally{
			sqlsesion.close();
		}		
		return resultadosV;		
	}
	
	
	
	public synchronized Vector<LocalBeanData> buscarPlantillaLocalesActivosI(Vector<InventarioActivoBeanData> resultadosActivos){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<LocalBeanData> resultadosV=new Vector<LocalBeanData>();
					
		try{			
			for(int i=0;i<resultadosActivos.size();i++){
				
				InventarioActivoBeanData activoData=resultadosActivos.get(i);
				Integer idLocal=activoData.getIdLocal();
				LocalBeanData resultados=sqlsesion.selectOne("Data.mappers.activo.buscarUnLocal",idLocal);
				resultadosV.add(resultados);
			}
		}
		finally{
			sqlsesion.close();
		}		
		return resultadosV;		
	}
	
	public synchronized Vector<TipoActivoBeanData> buscarPlantillaTipoActivos(Vector<ResultadoActivoBeanData> resultadosActivos){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<TipoActivoBeanData> resultadosV=new Vector<TipoActivoBeanData>();
					
		try{			
			for(int i=0;i<resultadosActivos.size();i++){
				
				ResultadoActivoBeanData activoData=resultadosActivos.get(i);
				Integer idTipoActivo=activoData.getIdTipoActivo();
				TipoActivoBeanData resultados=sqlsesion.selectOne("Data.mappers.activo.buscarUnTipoActivo",idTipoActivo);
				resultadosV.add(resultados);
			}
		}
		finally{
			sqlsesion.close();
		}		
		return resultadosV;		
	}
	
	
	
	public synchronized Vector<TipoActivoBeanData> buscarPlantillaTipoActivosI(Vector<InventarioActivoBeanData> resultadosActivos){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<TipoActivoBeanData> resultadosV=new Vector<TipoActivoBeanData>();
					
		try{			
			for(int i=0;i<resultadosActivos.size();i++){
				
				InventarioActivoBeanData activoData=resultadosActivos.get(i);
				Integer idTipoActivo=activoData.getIdTipoActivo();
				TipoActivoBeanData resultados=sqlsesion.selectOne("Data.mappers.activo.buscarUnTipoActivo",idTipoActivo);
				resultadosV.add(resultados);
			}
		}
		finally{
			sqlsesion.close();
		}		
		return resultadosV;		
	}
	
	
	
	
	public void modificarActivo(ActivoBeanData activoData) throws CoException {
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{					
			sqlsesion.update("Data.mappers.activo.modificarActivo",activoData);
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
		return;
	}
	
	
	public void modificarActivoGeneral(ActivoBeanData activoData) throws CoException {
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{					
			sqlsesion.update("Data.mappers.activo.modificarActivoGeneral",activoData);
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
		return;
	}
	
	
	public void modificarActivoDeBaja(String[] motivo,String[] idActivo) throws CoException {
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		ActivoBeanFuncion activoFuncion=ActivoBeanFuncion.getInstanceS();
		
		try{
			
			for(int i=0;i<motivo.length;i++){
				ActivoBeanData activoData=new ActivoBeanData();
				activoData.setCodigo(Integer.parseInt(idActivo[i]));
				activoData.setMotivoBaja(motivo[i]);
				
				Date date = new Date(); 
				String fecha = DF1.format(date);
				Date fechaBaja= DF1.parse(fecha); 
				activoData.setFechaBaja((fechaBaja));
				
				activoData.setEstado(4);//4= De baja
				
				//ver fechaBaja
				ActivoBeanData activoDataAux=activoFuncion.consultarActivo(Integer.parseInt(idActivo[i]));
				InventarioActivoBeanData inventarioData=activoFuncion.consultarEnInventario(activoDataAux);
				Integer cantidadNueva=inventarioData.getCantidad()-1;
				inventarioData.setCantidad(cantidadNueva);
				
				activoFuncion.modificarCantidadInventario(inventarioData);
				sqlsesion.update("Data.mappers.activo.modificarActivo",activoData);
			}
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
		return;
	}
	
	
	public void modificarCantidadInventario(InventarioActivoBeanData inventarioData) throws CoException {
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{					
			sqlsesion.update("Data.mappers.activo.modificarInventario",inventarioData);
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
		return;
	}
	
	
	public synchronized Vector<ResultadoActivoBeanData> buscarPlantillaRepuestos(Vector<ResultadoActivoBeanData> resultadosA){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoActivoBeanData> resultadosV=new Vector<ResultadoActivoBeanData>();
					
		try{		
			
			for(int i=0;i<resultadosA.size();i++){
				
				ResultadoActivoBeanData ActivoData=resultadosA.get(i);
				Integer idTipoActivo=ActivoData.getIdTipoActivo();
				TipoActivoBeanData resultados=sqlsesion.selectOne("Data.mappers.activo.buscarUnTipoActivo",idTipoActivo);
				//2 es para repuestos
				if(resultados.getTipoActivoPadre()==2){
					resultadosV.add(ActivoData);
				}
			}
		}
		finally{
			sqlsesion.close();
		}		
		return resultadosV;
		
	}
	
	
	public synchronized Vector<ResultadoActivoBeanData> buscarPlantillaEquipos(Vector<ResultadoActivoBeanData> resultadosA){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoActivoBeanData> resultadosV=new Vector<ResultadoActivoBeanData>();
					
		try{		
			
			for(int i=0;i<resultadosA.size();i++){
				
				ResultadoActivoBeanData ActivoData=resultadosA.get(i);
				Integer idTipoActivo=ActivoData.getIdTipoActivo();
				TipoActivoBeanData resultados=sqlsesion.selectOne("Data.mappers.activo.buscarUnTipoActivo",idTipoActivo);
				//1 es para equipos
				if(resultados.getTipoActivoPadre()==1){
					resultadosV.add(ActivoData);
				}
			}
		}
		finally{
			sqlsesion.close();
		}		
		return resultadosV;		
	}
	
	
	public synchronized Vector<Integer> verificarAvance(Vector<ResultadoProgramacionBeanData> resultadosProgramaciones){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<Integer> resultadosV=new Vector<Integer>();
		ActivoBeanFuncion activoBeanFuncion=ActivoBeanFuncion.getInstanceS();			
		try{		
			
			for(int i=0;i<resultadosProgramaciones.size();i++){
				
				ResultadoProgramacionBeanData programacionData=resultadosProgramaciones.get(i);
				Integer codigoProgramacion=programacionData.getIdProgramacion();
				Float cantidadActivoHistorico=activoBeanFuncion.contarCantidadActivoHistorico(codigoProgramacion);
				Float cantidadActivos=activoBeanFuncion.contarActivoProgramacion(codigoProgramacion);
				
				//1 es para equipos
				if(cantidadActivoHistorico!=0){
					Float valor=cantidadActivoHistorico/cantidadActivos*100;
					Integer valorRedondeado=Math.round(valor);
					resultadosV.add(valorRedondeado);
				}
				else{
					resultadosV.add(0);
				}
			}
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;		
	}
	
}
