package GtsSoftware.subproceso;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
public class AccionGuardarOrden extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		String tipo="0";
		SubprocesoBeanData criterioData=new SubprocesoBeanData();
		SubprocesoBeanFuncion subprocesoFuncion= SubprocesoBeanFuncion.getInstanceS();
		Integer ordenNuevo=Integer.parseInt(request.getParameter("txtNroOrden"));
		
		//modifico orden del actual
		String codigoSubproceso=request.getParameter("codigo");
		Integer ordenAux=0;
		SubprocesoBeanData subprocesoData=subprocesoFuncion.consultarSubprocesoS(Integer.parseInt(codigoSubproceso));
		Integer ordenActual=subprocesoData.getOrden();
		subprocesoData.setOrden(ordenNuevo);
		
		if(ordenActual<ordenNuevo)
			ordenAux=ordenActual+1;
		else
			ordenAux=ordenActual-1;
		
		Integer idProceso=subprocesoData.getCodigoproceso();
		criterioData.setCodigoproceso(idProceso);		
		
		//modifico orden de los demas 
		while(ordenActual!=ordenNuevo){
			
			//buscar subproceso por ordenNuevo,
			criterioData.setOrden(ordenAux);
			SubprocesoBeanData subprocesoDataNuevo=subprocesoFuncion.consultarSubprocesoOrden(criterioData);
			if(ordenActual<ordenNuevo){
				subprocesoDataNuevo.setOrden(ordenActual);
				ordenAux++;
				ordenActual++;
			}
			else{
				subprocesoDataNuevo.setOrden(ordenActual);
				ordenAux--;
				ordenActual--;				
			}
			subprocesoFuncion.modificarSubproceso(subprocesoDataNuevo);
		}
		subprocesoFuncion.modificarSubproceso(subprocesoData);
				
		//Integer idProceso=subprocesoData.getCodigoproceso();
		
		Vector<ResultadoSubprocesoBeanData> resultadosNivelInferior=new Vector<ResultadoSubprocesoBeanData>();
		
		//Se supone que se busca un unico valor, un unico proceso...

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
						niveles.add(nivelDos);

					}
					
					else{
						if(resultadosNivelInferior.size()!=0){
							tamanho.add(resultadosNivelInferior.size());
							indicepadre.add(subProceso);
							tamanhoAcumulado.add(tamanhoAcum);
							tamanhoAcum=tamanhoAcum+resultadosNivelInferior.size();
							niveles.add(nivelDos);
						
//							if(nivelDos==2){
//								suspadres.add(0);
//							}
//							else
								suspadres.add(subProceso.getCodigosubprocesopadre());
						}
					}
					
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
						nivel2.add(indicepadre.get(i));
					}
					
					if(niveles.get(i)==3){
						nivel3.add(indicepadre.get(i));
					}
					
					if(niveles.get(i)==4){
						nivel4.add(indicepadre.get(i));
					}
					
					if(niveles.get(i)==5){
						nivel5.add(indicepadre.get(i));
					}	
					
				}
				
				if(nivel2.size()==0){ indicepadre=resultadosNivelDos;}
				
				sesion.setAttribute("suspadres", suspadres);
				//sesion.setAttribute("resultados", resultados);
				sesion.setAttribute("tamanho", tamanho);
				sesion.setAttribute("tamanhoAcumulado", tamanhoAcumulado);
				sesion.setAttribute("indicepadre", indicepadre);
				sesion.setAttribute("matrizSubprocesos", matrizSubprocesos);
				sesion.setAttribute("resultadosNivelDos", resultadosNivelDos);
				sesion.setAttribute("nivel2", nivel2);
				sesion.setAttribute("nivel3", nivel3);
				sesion.setAttribute("nivel4", nivel4);
				sesion.setAttribute("nivel5", nivel5);

				sesion.setAttribute("subproceso", subprocesoData);
				request.setAttribute("tipo", tipo);
		
		
		this.direccionar(sc, request, response, "/Gts/proceso/principal.jsp");
		
	}

}
