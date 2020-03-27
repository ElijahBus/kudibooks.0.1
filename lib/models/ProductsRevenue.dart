import 'package:kudibooks/screens/Income.dart';

class ProductsRevenue {

  
  int revenueID;
  int productID;
  int unit;
  double amount;
  

  ProductsRevenue( this.revenueID, this.productID, this.unit, this.amount);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {      
      'revenueID': this.revenueID,
      'productID': this.productID,
      'unit': this.unit,
      'amount': this.amount
    };

    return map;
  }

  ProductsRevenue.fromMap(Map<String, dynamic> map) {    
    revenueID = map['revenueID'];
    productID = map['productID'];
    unit = map['unit'];
    amount = map['amount'];
  }
}