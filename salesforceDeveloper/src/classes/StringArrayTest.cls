public class StringArrayTest {

        
    public static List<String> generateStringArray(Integer num)
    {
     	
        List<String> ls = new List<String>(); 
        for(Integer i = 0; i < num; i++)
        {
           
            ls.add('Test ' + i);
            
        }
        
        return ls;
    }
    
}