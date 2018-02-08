public with sharing class AccountSearchController {  

    // Matching Accounts
    public List<account> acc {
        
        get{
            if(setCon != null){
                return (List<Account>)setCon.getRecords();
            } else {
                return null;
            }    
        }
        
        set;
    }  
    
    // Search Text entered by user
    public string searchString {get;set;}
    
    public ApexPages.StandardSetController setCon {get;set;}  
              
    // Action method to search for Accounts  
    public void search() {  
     
        try {
            String searchWord = '%' + searchString + '%';  
            setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT AccountNumber,AccountSource,Active__c,AnnualRevenue,BillingAddress,
                  BillingCity,BillingCountry,BillingPostalCode,BillingState,BillingStreet,
                  Description,DunsNumber,Fax,Id,Industry,Name,NumberOfEmployees,Phone,Type,Website 
                  FROM Account 
                  WHERE Name like : searchWord])); 
        } catch (System.QueryException ex) {
             ApexPages.addMessages(ex);
        }
    }  

 }