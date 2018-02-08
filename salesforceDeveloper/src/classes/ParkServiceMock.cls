@isTest
global class ParkServiceMock implements WebServiceMock {
	global void doInvoke(
    	Object stub,
        Object request,
        Map<String, Object> response,
        String endPoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType
    ){
       response.put('Germany', ParkLocator.country('Germany'));
    }
}