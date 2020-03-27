class ProductsInvoice {


  int id;
  int invoiceID;
  int productID;
  int unitPrice;
  int unit;
  var total;

  ProductsInvoice(this.id, this.invoiceID, this.productID, this.unitPrice, this.unit, this.total);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      'id': this.id,
      'invoiceID': this.invoiceID,
      'productID': this.productID,
      'unitPrice': this.unitPrice,
      'unit': this.unit,
      'total': this.total
    };

    return map;
  }

  ProductsInvoice.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    invoiceID = map['invoiceID'];
    productID = map['productID'];
    unitPrice = map['unitPrice'];
    unit = map['unit'];
    total = map['total'];
  }


}
