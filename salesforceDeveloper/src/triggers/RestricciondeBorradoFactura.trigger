trigger RestricciondeBorradoFactura on Factura__c (before delete) {
    
    // create a list of Invoices in Trigger.oldMap along with their Line Items
    List<Factura__c> facturas = [Select i.Name, (Select Name From Productos__r)
    From Factura__c i
    Where i.Id IN :Trigger.oldMap.keySet()];
    // loop through the Invoices, attaching errors to those that have Line Items
    for (Factura__c factura : facturas) {
        if (!factura.Productos__r.isEmpty()) {
            Trigger.oldMap.get(factura.id).addError('No se puede borrar facturas con productos incluidos.');
        }
    }
}