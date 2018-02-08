@isTest
public class MaintenanceRequestTest {
    
    @TestSetup
    static void initData()
    {
        Vehicle__c vehicle = new Vehicle__c();
        insert vehicle;
        
        Product2 equipment = new Product2(
        	Name = 'Product1',
            Replacement_part__C = true,
            Lifespan_Months__c = 24,
            Maintenance_cycle__c = 60
        );
        insert equipment;
        
        Product2 equipment2 = new Product2(
        	Name = 'Product2',
            Replacement_part__C = true,
            Lifespan_Months__c = 12,
            Maintenance_cycle__c = 50
        );
        insert equipment2;
          
        Case req = new Case(
        	Vehicle__c = vehicle.Id,
            Type = 'Repair',
            Subject = 'Repair some parts'
        );
        insert req;
        
        Work_part__c workPart = new Work_Part__c(
        	Maintenance_Request__c = req.Id,
            Equipment__c = equipment.Id
        );
        insert workPart;
        
         Work_part__c workPart2 = new Work_Part__c(
        	Maintenance_Request__c = req.Id,
            Equipment__c = equipment2.Id
        );
        insert workPart2;
    }
    
    @isTest
    static void it_create_a_new_maintenance_request_when_an_existing_is_closed()
    {
        List<Vehicle__c> vehicle = [select Id from Vehicle__c limit 1];
        List<Case> req = [select Id, Type, Subject, Status from Case];
        
        System.assert(!req.isEmpty(), 'No se encontraron casos');
        
        req[0].Status = 'Closed';
        
        Test.startTest();
        	update req[0];
        Test.stopTest();
        
        system.assertEquals(
            2,
        	[select count() from case where Vehicle__c = :vehicle[0].id],
            'It is not the expected number of cases'
        );
    }

}