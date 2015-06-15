package GtsSoftware.proceso;

import java.util.Vector;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.subproceso.ResultadoSubprocesoBeanData;
import GtsSoftware.subproceso.SubprocesoBeanFuncion;

public class AccionModificarProceso extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException{
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		Vector<ResultadoSubprocesoBeanData> resultadosNivelInferior=new Vector<ResultadoSubprocesoBeanData>();
		
		ProcesoBeanFuncion procesoFuncion=ProcesoBeanFuncion.getInstanceS();
		SubprocesoBeanFuncion subprocesoFuncion= SubprocesoBeanFuncion.getInstanceS();
		//CriterioProcesoBeanData criterioProcesoData =new CriterioProcesoBeanFuncion().crearCriterio(request, response);

		//Vector<ResultadoProcesoBeanData> resultados=new CriterioProcesoBeanFuncion().buscarPlantillaProceso(criterioProcesoData);	
		
		//if(resultados!=null){
		//Se supone que se busca un unico valor, un unico proceso...
		//Integer idProceso=(resultados.get(0).getCodigo());
		Integer idProceso=Integer.parseInt(request.getParameter("codigo"));
		ProcesoBeanData procesoData=procesoFuncion.consultarProceso(idProceso);
		
		//Se busca todos sus subproceso, es decir el segundo nivel
		Vector<ResultadoSubprocesoBeanData> resultadosNivelDos=subprocesoFuncion.buscarSubprocesosNivelDos(idProceso);
		Vector<ResultadoSubprocesoBeanData> resultadosNivelDosAux=new Vector<ResultadoSubprocesoBeanData>();
		//matriz para manejar un array de la siguiente forma array(subproceso padre, subproeso hijo)
		
		
		Vector<ResultadoSubprocesoBeanData> matrizSubprocesos=new Vector<ResultadoSubprocesoBeanData>();
		Vector<ResultadoSubprocesoBeanData> matrizInferiorSubprocesos=new Vector<ResultadoSubprocesoBeanData>();

		//un array para manejar el tamaño de cada subproceso padre array(0) pertenece al subproceso padre 0
		Vector<Integer> tamanho=new Vector<Integer>();
		Vector<Integer> tamanhoAcumulado=new Vector<Integer>();
		Vector<Integer> niveles=new Vector<Integer>();
		Vector<Integer> suspadres=new Vector<Integer>();
		Vector<ResultadoSubprocesoBeanData> indicepadre=new Vector<ResultadoSubprocesoBeanData>();
		Vector<ResultadoSubprocesoBeanData> indicepadreAux=new Vector<ResultadoSubprocesoBeanData>();
		
		Integer tamanhoAcum=0;
		Integer nivelDos=2;

		resultadosNivelDosAux=resultadosNivelDos;
		
		
		while(resultadosNivelDosAux.size()!=0){
		//Con los segundos niveles se empiezaa buscar para 3er, 4to y siguientes nivel 
		for(int i=0;i<resultadosNivelDosAux.size();i++){
			//if(resultadosNivelDos.get(i)==null) continue;
			
			//Integer idSubProceso=(resultadosNivelDos.get(i).getCodigosubproceso());//subproceso padre
			
			ResultadoSubprocesoBeanData subProceso=resultadosNivelDosAux.get(i);
			
			Integer idSubProceso=subProceso.getCodigosubproceso();
			resultadosNivelInferior=subprocesoFuncion.buscarSubprocesosNivelInferior(idSubProceso);
			
			if(nivelDos==2){
				tamanho.add(resultadosNivelInferior.size());
				indicepadre.add(subProceso);
				tamanhoAcumulado.add(tamanhoAcum);
				tamanhoAcum=tamanhoAcum+resultadosNivelInferior.size();
				suspadres.add(0);

			}
			
			else{
				if(resultadosNivelInferior.size()!=0){
					tamanho.add(resultadosNivelInferior.size());
					indicepadre.add(subProceso);
					tamanhoAcumulado.add(tamanhoAcum);
					tamanhoAcum=tamanhoAcum+resultadosNivelInferior.size();
						
				}
				suspadres.add(subProceso.getCodigosubprocesopadre());
			}
			
			indicepadreAux.add(subProceso);
			niveles.add(nivelDos);
			
			for(int j=0;j<resultadosNivelInferior.size();j++){
				matrizSubprocesos.add(resultadosNivelInferior.get(j));
				matrizInferiorSubprocesos.add(resultadosNivelInferior.get(j));
			}
		}
		
		//la idea de pasar el arreglo indices a el resultadosNivelDos(iguales), y comentar con un bucle que se prosiga haciendo lo mismo
		//Un while mientras resultadosNivelDos.size()!=0 hacer todo el for
		//resultadosNivelDosAux.cl.clear();
		resultadosNivelDosAux=matrizInferiorSubprocesos;
		matrizInferiorSubprocesos=new Vector<ResultadoSubprocesoBeanData>();
		nivelDos++;
		//este seria el nuevo nivel inferior
		}
		
		
		
		Vector<ResultadoSubprocesoBeanData> nivel2=new Vector<ResultadoSubprocesoBeanData>();
		Vector<ResultadoSubprocesoBeanData> nivel3=new Vector<ResultadoSubprocesoBeanData>();
		Vector<ResultadoSubprocesoBeanData> nivel4=new Vector<ResultadoSubprocesoBeanData>();
		Vector<ResultadoSubprocesoBeanData> nivel5=new Vector<ResultadoSubprocesoBeanData>();
		
		for(int i=0;i<niveles.size();i++){
			
			if(niveles.get(i)==2){
				nivel2.add(indicepadreAux.get(i));
			}
			
			if(niveles.get(i)==3){
				nivel3.add(indicepadreAux.get(i));
			}
			
			if(niveles.get(i)==4){
				nivel4.add(indicepadreAux.get(i));
			}
			
			if(niveles.get(i)==5){
				nivel5.add(indicepadreAux.get(i));
			}	
			
		}
		
		
		
		
		Vector<ResultadoSubprocesoBeanData> padre=new Vector<ResultadoSubprocesoBeanData>();
		Vector<ResultadoSubprocesoBeanData> hijo=new Vector<ResultadoSubprocesoBeanData>();
		Vector<ResultadoSubprocesoBeanData> hijoAux=new Vector<ResultadoSubprocesoBeanData>();
		Vector<ProcesoBeanData> proceso=new Vector<ProcesoBeanData>();
		
		resultadosNivelDos=subprocesoFuncion.buscarSubprocesosNivelDos(idProceso);
		resultadosNivelDosAux=new Vector<ResultadoSubprocesoBeanData>();
		tamanhoAcum=0;
		nivelDos=2;

		resultadosNivelDosAux=resultadosNivelDos;
		
		while(resultadosNivelDosAux.size()!=0){
			//Con los segundos niveles se empiezaa buscar para 3er, 4to y siguientes nivel 
			for(int i=0;i<resultadosNivelDosAux.size();i++){
				//if(resultadosNivelDos.get(i)==null) continue;
				
				//Integer idSubProceso=(resultadosNivelDos.get(i).getCodigosubproceso());//subproceso padre
				
				ResultadoSubprocesoBeanData subProceso=resultadosNivelDosAux.get(i);
				
				Integer idSubProceso=subProceso.getCodigosubproceso();
				resultadosNivelInferior=subprocesoFuncion.buscarSubprocesosNivelInferior(idSubProceso);
				
				if(nivelDos==2){
					tamanho.add(resultadosNivelInferior.size());
					indicepadre.add(subProceso);
					tamanhoAcumulado.add(tamanhoAcum);
					tamanhoAcum=tamanhoAcum+resultadosNivelInferior.size();
					suspadres.add(0);
					if(resultadosNivelInferior.size()!=0){
						for(int k=0;k<resultadosNivelInferior.size();k++){
							padre.add(subProceso);
							hijo.add(resultadosNivelInferior.get(k));
						}
					}

				}
				
				else{
					if(resultadosNivelInferior.size()!=0){
						tamanho.add(resultadosNivelInferior.size());
						indicepadre.add(subProceso);
						tamanhoAcumulado.add(tamanhoAcum);
						tamanhoAcum=tamanhoAcum+resultadosNivelInferior.size();
						
						for(int k=0;k<resultadosNivelInferior.size();k++){
							padre.add(subProceso);
							hijo.add(resultadosNivelInferior.get(k));
						}	
					}
					suspadres.add(subProceso.getCodigosubprocesopadre());
				}
				
				indicepadreAux.add(subProceso);
				niveles.add(nivelDos);
				
				for(int j=0;j<resultadosNivelInferior.size();j++){
					matrizSubprocesos.add(resultadosNivelInferior.get(j));
					matrizInferiorSubprocesos.add(resultadosNivelInferior.get(j));
				}
			}
			
			//la idea de pasar el arreglo indices a el resultadosNivelDos(iguales), y comentar con un bucle que se prosiga haciendo lo mismo
			//Un while mientras resultadosNivelDos.size()!=0 hacer todo el for
			//resultadosNivelDosAux.cl.clear();
			resultadosNivelDosAux=matrizInferiorSubprocesos;
			matrizInferiorSubprocesos=new Vector<ResultadoSubprocesoBeanData>();
			nivelDos++;
			//este seria el nuevo nivel inferior
		}
		
		
		
		for(int i=0;i<resultadosNivelDos.size();i++){
			
			String nombre1=resultadosNivelDos.get(i).getNombre();
			
			
			for(int k=0;k<padre.size();k++){
				
				if(resultadosNivelDos.get(i)==padre.get(k)){
					String nombre2=hijo.get(k).getNombre();
					String nombreAux=nombre2;
				}
				
			}
			
			
			
		}

		if(nivel2.size()==0){ indicepadre=resultadosNivelDos;}
		
		String tipo="0";
		
		sesion.setAttribute("suspadres", suspadres);
		sesion.setAttribute("procesoData", procesoData);
		sesion.setAttribute("tamanho", tamanho);
		sesion.setAttribute("tamanhoAcumulado", tamanhoAcumulado);
		sesion.setAttribute("indicepadre", indicepadre);
		sesion.setAttribute("matrizSubprocesos", matrizSubprocesos);//vector con todos los subprocesos inferiores
		sesion.setAttribute("resultadosNivelDos", resultadosNivelDos);
		sesion.setAttribute("nivel2", nivel2);
		sesion.setAttribute("nivel3", nivel3);
		sesion.setAttribute("nivel4", nivel4);
		sesion.setAttribute("nivel5", nivel5);
		request.setAttribute("tipo", tipo);

		this.direccionar(sc, request, response, "/Gts/proceso/principal.jsp");
	}
}
