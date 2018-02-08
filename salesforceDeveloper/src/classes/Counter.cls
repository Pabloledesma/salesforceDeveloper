public class Counter {
	
	public Counter(){
		clickCount = 0;
	}
	
	public Integer clickCount { get; set; }
	
	public void buttonClicked(){
		clickCount++;
	}
	
}