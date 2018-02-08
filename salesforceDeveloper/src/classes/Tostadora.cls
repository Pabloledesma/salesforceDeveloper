public class Tostadora implements UtilidadCocina{
	
	private String modelo;
	private Integer unStock;
	
	public Tostadora(){
		modelo = 'Black-01';
		unStock = 30;
	}
	
	public String getModelo(){
		return modelo;
	}
	
	public Integer getUnStock(){
		return unStock;
	}
}