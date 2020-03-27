///
///
///
///

import 'dart:async';

import 'package:kudibooks/helpers/DBHelper.dart';
import 'package:kudibooks/models/Bill.dart';
import 'package:kudibooks/models/GoodsServicesBill.dart';
import 'package:sqflite/sqflite.dart';

class BillController {



  // get the vendor ID
  static getvendorID(String traderName) async {
    Database database = await DBH.db;
    var result = await database.rawQuery('SELECT id FROM Trader WHERE name = ' + traderName);
    // return a the Trader id
    return result;
  }

  // record the bill
  static Future<int> recordBill(BillModel bill) async {
    Database database = await DBH.db;
    bill.id = await database.insert('Bill', bill.toMap());

    return bill.id;
  }

  // add products to the bill
  static Future<int> addProducts (GoodsServicesBill product) async {
    Database database = await DBH.db;
    product.id = await database.insert('GoodsServicesBill', product.toMap());

    return product.id;
  }

}