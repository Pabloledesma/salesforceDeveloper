public class Nevera implements UtilidadCocina{
	
	private String modelo;
	private Integer unStock;
	public static final Integer STOCK_MINIMO = 5;
	public Integer ecoRating {
		get { return ecoRating; }
		set { ecoRating = value; if (ecoRating < 0) ecoRating =0; }
	}
	
	public Nevera(){
		modelo = 'LG 700Lt';
		unStock = 10;
	}
	
	public Nevera(String elModelo, Integer unidades){
		modelo = elModelo;
		unStock = unidades;
	}
	
	public void actualizarStock(Integer unidadesVendidas){
		unStock = unStock - unidadesVendidas;
	}
	
	public void setModelo(String elModelo){
		modelo = elModelo;
	}
	
	public String getModelo(){
		return modelo;
	}
	
	public static void toDebug(Nevera laNevera){
		System.debug('Modelo: ' + laNevera.modelo + '\n');
		System.debug('Unidades disponibles: ' + laNevera.unStock);
	}
	
	
}