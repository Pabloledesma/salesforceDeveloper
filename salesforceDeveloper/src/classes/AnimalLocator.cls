public class AnimalLocator {
    
    public static String getAnimalNameById(Integer Id)
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+Id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        
        
        // Deserializes the JSON string into collections of primitive data types.
        
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        // Cast the values in the 'animals' key as a list
        //List<Object> animal = (List<Object>) results.get('animal');
        Map<String, Object> animal = (Map<String, Object>) results.get('animal');
        
        String name = String.valueOf(animal.get('name'));
        
        System.debug(name);
        return name;
        
         
    }

}