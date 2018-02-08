({
	packItem : function(component, event, helper) {
        var item = {Packed__c :true};
        component.set("v.item", item);        
	}
})