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
private class TestBorraFactura {

   // Invoice generator, with or without a Line Item
	static Factura__c creaNuevaFactura(Boolean conProducto) {
		
		// Create test Merchandise
		Mercancia__c mercancia = new Mercancia__c(
			Name = 'Test Laptop',
			Cantidad__c = 1000,
			Precio__c = 500
		);
		insert mercancia;
		
		// Create test Invoice
		
		Factura__c factura = new Factura__c();
		insert factura;
		
		// Create test Line Item and insert it into the database, if withLineItem == true
		
		if (conProducto) {
			Producto__c producto = new Producto__c(
			name = '1',
			Cantidad__c = 1,
			Mercancia__c = mercancia.Id,
			Factura__c = factura.Id
			);
			insert producto;
		}
		return factura;
		
		
	
	}
	
		// Single row Invoice with no Line Items => delete
	static testMethod void verifyInvoiceNoLineItemsDelete(){
		// Create test Invoice and insert it
		Factura__c factura = creaNuevaFactura(false);
		// Delete the Invoice, capture the result
		Database.DeleteResult result = Database.delete(factura, false);
		// Assert success, because target Invoice doesn't have Line Items
		System.assert(result.isSuccess());
	}
	// Single row Invoice with Line Items => delete restrict
	static testMethod void verifyInvoiceLineItemsRestrict(){
		
		// Create test Invoice and Line Item and insert them
		Factura__c factura = creaNuevaFactura(true);
		
		// Delete the Invoice, capture the result
		Database.DeleteResult result = Database.delete(factura, false);
		
		// Assert failure-not success, because target Invoice has tracks
		System.assert(!result.isSuccess());
	}
	
		// Bulk delete of Invoice, one without Line Items, another with
	static testMethod void verifyBulkInvoiceDeleteRestrict(){
		
		// Create two test Invoices, one with and without a Line Item
		Factura__c[] facturas = new List<Factura__c>();
		facturas.add(creaNuevaFactura(false));
		facturas.add(creaNuevaFactura(true));
		
		// Delete the facturas, opt_allOrNone = false, capture the results.
		Database.DeleteResult[] results = Database.delete(facturas, false);
		
		// Assert success for first Invoice
		System.assert(results[0].isSuccess());
		
		// Assert not success for second Invoice
		System.assert(!results[1].isSuccess());
	}
}