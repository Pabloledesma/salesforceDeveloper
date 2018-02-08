({
	 // Load data from Salesforce
    doInit: function(component, event, helper) {
    
        // Create the action
        var action = component.get("c.getItems");
    
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
    
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    
    clickCreateItem : function(component, event, helper) {
        
        if(helper.validateItem(component)){
            var item = component.get("v.newItem");
            helper.createItem(component, item);
            item = {
                'sobjectType': 'Camping_Item__c',
                'Name': '',
                'Packed__c': false,
                'Price__c': 0,
                'Quantity__c': 0 
            };
            component.set("v.newItem", item);
        }
	}
})