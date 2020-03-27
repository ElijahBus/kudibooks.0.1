class GoodsServicesPayBill {


  int id;
  int payBillID;
  String productName;
  var totalDue;
  var totalPaid;

  GoodsServicesPayBill(this.id, this.payBillID, this.productName, this.totalDue, this.totalPaid);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': this.id,
      'payBillID': this.payBillID,
      'productName': this.productName,
      'totalDue': this.totalDue,
      'totalPaid': this.totalPaid
    };

    return map;
  }

  GoodsServicesPayBill.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    payBillID = map['payBillID'];
    productName = map['productName'];
    totalDue = map['totalDue'];
    totalPaid = map['totalPaid'];
  }

}