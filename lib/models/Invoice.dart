///
///
///
///


class InvoiceModel {


  int id;
  String dueDate;  
  int invoiceNumber;

  InvoiceModel(this.id, this.dueDate, this.invoiceNumber);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': this.id,
      'dueDate': this.dueDate,
      'invoiceNumber': this.invoiceNumber
    };

    return map;
  }

  InvoiceModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    dueDate = map['dueDate'];
    invoiceNumber = map['invoiceNumber'];
  }

  
}