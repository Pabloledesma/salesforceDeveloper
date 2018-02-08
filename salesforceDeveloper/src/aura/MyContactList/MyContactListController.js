/**
 * Created by pablo on 25/06/2017.
 */
({
    myAction: function(component, event, helper){
        var action = component.get('c.getContacts');
        action.setCallback(this, function(data){
            component.set('v.contacts', data.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})