package GtsSoftware.general;

import java.util.Vector;

public class VAccion {

	private Vector<String> identificador= new Vector<String>();
	private Vector<CoAccion> objeto= new Vector<CoAccion>();
	
	
	public void put(String str,CoAccion obj) {
		if(str==null) System.out.println("id nula");
		if(obj==null) System.out.println("obj nula");
		this.identificador.add(str);
		this.objeto.add(obj);
	}
	
	public CoAccion find (String str){
			for(int i=0;i<this.identificador.size();i++){
				if(this.identificador.get(i).equalsIgnoreCase(str)) return this.objeto.get(i);				
			}
			
		return null;
	}

}
