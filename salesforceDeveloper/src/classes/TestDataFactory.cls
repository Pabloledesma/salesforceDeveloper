/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
public class TestDataFactory {

   public static Invoice_Statement__c createOneInvoiceStatement( Boolean WithLineItem ){
   		
   		//Create one invoice statement
   		Invoice_Statement__c testInvoice = createInvoiceStatement();
   		
   		if( WithLineItem == true ){
   			//Create Merchandise item
   			Merchandise__c m = createMerchandiseItem('Orange Juice');
   			AddLineItem( testInvoice, m );
   		}
   		return testInvoice;
   }
   
   //Helper Methods
   
   private static Merchandise__c createMerchandiseItem(String merchName){
   		Merchandise__c m = new Merchandise__c( 
   			Name 				= merchName,
   			Description__c 		= 'Fresh juice',
   			Price__c 			= 2,
   			Total_Inventory__c 	= 1000
   		);
   		
   		insert m;
   		return m;
   }
   
   private static Invoice_Statement__c createInvoiceStatement(){
   		Invoice_Statement__c inv = new Invoice_Statement__c(
   			Description__c = 'Test Invoice'
   		);
   		
   		insert inv;
   		return inv;
   }
   
   private static Line_Item__c AddLineItem(Invoice_Statement__c inv, Merchandise__c m) {
		Line_Item__c lineItem = new Line_Item__c(
		Invoice_Statement__c = inv.Id,
		Merchandise__c = m.Id,
		Unit_Price__c = m.Price__c,
		Units_Sold__c = (Double)(10*Math.random()+1));
		insert lineItem;
		return lineItem;
	}
    
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            for (Integer k=0;k<numOppsPerAcct;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        
        return accts;
    }

}