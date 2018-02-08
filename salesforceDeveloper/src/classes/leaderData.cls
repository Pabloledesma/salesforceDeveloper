public class leaderData {
	
	public String leaderName 	{ get; set; }
	public String leaderPic		{ get; set; }
	public Integer oppCount		{ get; set; }
	public Double oppAmount		{ get; set; }	

	public leaderData( String leaderName, String leaderPic, Integer oppCount, Double oppAmount ) {
		this.leaderName 	= leaderName;
		this.leaderPic 		= leaderPic;
		this.oppCount 		= oppCount;
		this.oppAmount 		= oppAmount;
	}
}