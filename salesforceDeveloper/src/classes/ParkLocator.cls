public class ParkLocator {
	public static String[] country(String count)
    {
        ParkService.ParksImplPort pspi = new ParkService.ParksImplPort();
        return pspi.byCountry(count);
    }
}