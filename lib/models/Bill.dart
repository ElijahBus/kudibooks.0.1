import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:kudibooks/helpers/DBHelper.dart';


class BillModel {


  int id;
  int vendorID;
  int goodsServicesID;
  String dueDate;
  var billNumber;

  BillModel(this.id, this.vendorID, this.goodsServicesID, this.dueDate, this.billNumber);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': this.id,
      'vendorID': this.vendorID,
      'goodsServicesID': this.goodsServicesID,
      'dueDate': this.dueDate,
      'billNumber': this.billNumber
    };

    return map;
  }

  BillModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    vendorID = map['venorID'];
    goodsServicesID = map['goodsServicesID'];
    dueDate = map['dueDate'];
    billNumber = map['billNumber'];
  }

 

}