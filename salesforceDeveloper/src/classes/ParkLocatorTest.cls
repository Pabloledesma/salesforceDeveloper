@isTest
private class ParkLocatorTest {
    @isTest static void testCallout(){
    	Test.setMock(WebServiceMock.class, new ParkServiceMock());
        
        String[] cities = ParkLocator.country('Germany');
        System.assert(cities.size() != 0);
    }
}