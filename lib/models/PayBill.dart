import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:kudibooks/helpers/DBHelper.dart';


class PayBillModel {


  int id;
  int vendorID;
  int goodsServicesPayBillID;
  int referenceNumber;

  PayBillModel(this.id, this.vendorID, this.goodsServicesPayBillID, this.referenceNumber);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': this.id,
      'vendorID': this.vendorID,
      'goodsServicesPayBillID': this.goodsServicesPayBillID,
      'referenceNumber': this.referenceNumber
    };

    return map;
  }

  PayBillModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    vendorID = map['vendorID'];
    goodsServicesPayBillID = map['goodsServicesPayBillID'];
    referenceNumber = map['rferenceNumber'];
  }

  // CRUD 

  Future<int> insert (PayBillModel payBill) async {    
    Database db = await DBH.db;    
    var result = await db.insert('PayBill', payBill.toMap());
    
    return result;
  }

}