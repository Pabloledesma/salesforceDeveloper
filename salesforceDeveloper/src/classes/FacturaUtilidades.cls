global with sharing class FacturaUtilidades{
	 // class method to renumber (Line Items) as Producto for a given Invoice number
    // returns a string that indicates success or failure
    webservice static String renombrarProductos(String nombreFactura) {
 
    // create a copy of the target Invoice object and it's Line Items
    Factura__c factura = [Select i.Name, (Select Name From Productos__r ORDER BY Name) 
                            From Factura__c i 
                           Where i.Name = :nombreFactura LIMIT 1];
 
    // loop through each Line Item, renumbering as you go
    Integer i = 1;
    for (Producto__c item : factura.Productos__r) {
      item.Name = String.valueOf(i);
      System.debug(item.Name);
      i++;
    }
 
    // update the Line Items in one transaction, rollback if any problems
    // and return error messages to the calling environment
    try {
      database.update(factura.Productos__r);
    }
    catch (DmlException e) {
      return e.getMessage();
    }
 
    // on success, return a message to the calling program
    return 'Line items renumbered successfully.'; 
  }
}