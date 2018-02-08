({
	validateItem : function(component) {

        var itemValid = true;
        
        //Name is required
        var nameField = component.find('name');
        var name = nameField.get("v.value");
        if ($A.util.isEmpty(name)){
           itemValid = false;
            nameField.set("v.errors", [{message:"Item name can't be blank."}]);
        }
        else {
            nameField.set("v.errors", null);
        }
        
        //Quantity is required
        var quantityField = component.find('quantity');
        var quantity = quantityField.get("v.value");
        if ($A.util.isEmpty(quantity)){
            itemValid = false;
            quantityField.set("v.errors", [{message:"Item quantity can't be blank."}]);
        }
        else {
            quantityField.set("v.errors", null);
        }
        
        //Quantity is required
        var priceField = component.find('price');
        var price = priceField.get("v.value");
        if ($A.util.isEmpty(price)){     
			itemValid = false;
            priceField.set("v.errors", [{message:"Item price can't be blank."}]);
        }
        else {
            priceField.set("v.errors", null);
        }
        
        return itemValid;
	},
    
    createItem: function(component, newItem){
        var action = component.get('c.saveItem');
        action.setParams({'newItem': newItem});
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
            }
        });
        $A.enqueueAction(action);
    }
})