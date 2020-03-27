///
///
///
///

import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:kudibooks/models/PayBill.dart';
import 'package:kudibooks/models/GoodsServicesPayBill.dart';
import 'package:kudibooks/helpers/DBHelper.dart';

class PayBillController {


  // get the vendor ID
  static getVendorID(String traderName) async {
    Database database = await DBH.db;
    var result = await database.rawQuery('SELECT id FROM Trader WHERE name = ' + traderName);
    // return  the Trader id
    return result;
  }

  // record the paid bill
  static Future<int> recordPaidBill(PayBillModel paidBill) async {
    Database database = await DBH.db;
    paidBill.id = await database.insert('PayBill', paidBill.toMap());

    return paidBill.id;
  }

  // add products to the paid bill
  static Future<int> addProducts(GoodsServicesPayBill product) async {
    Database database = await DBH.db;
    product.id = await database.insert('GoodsServicesPayBill', product.toMap());

    return product.id;
  }

}

