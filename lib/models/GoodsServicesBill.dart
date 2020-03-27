class GoodsServicesBill {


  int id;
  int billID;
  int productID;
  var unitCost;
  int units;
  var amount;

  GoodsServicesBill(this.id, this.billID, this.productID, this.unitCost, this.units, this.amount);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': this.id,
      'billID': this.billID,
      'productID': this.productID,
      'unitCost': this.unitCost,
      'units': this.units,
      'amount': this.amount
    };

    return map;
  }

  GoodsServicesBill.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    billID = map['billID'];
    productID = map['productID'];
    unitCost = map['unitCost'];
    units = map['units'];
    amount = map['amount'];
  }
}