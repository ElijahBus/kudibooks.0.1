import 'dart:async';

import 'package:kudibooks/models/Revenue.dart';
import 'package:kudibooks/helpers/DBHelper.dart';
import 'package:kudibooks/models/ProductsRevenue.dart';
import 'package:kudibooks/models/Transaction.dart' as Tr ;
import 'package:kudibooks/models/Trader.dart';
import 'package:sqflite/sqflite.dart';


class RevenueController {



  // get the client ID
  static getClientID(String traderName) async {
    Database database = await DBH.db;
    var result = await database.rawQuery('SELECT id FROM Trader WHERE name = ' + traderName);
    // return a the Trader id
    return result;
  }

  // get the bank ID
  static getbankID(String companyName) async {
    Database database = await DBH.db;
    var result = await database.rawQuery('SELECT id FROM CompanyAccount WHERE name = ' + companyName);
    // return a the Trader id
    return result;
  }

  // Recording the REVENUE

    // . Transaction table
  static Future<int> addTransaction (Tr.Transaction record) async {    
    var dbClient = await DBH.db;
    var rs = await dbClient.insert('Transaction', record.toMap());
    
    return rs;
  }
    // 2. Revenue table    
  static Future<int> addRevenue (Revenue record) async {    
    var dbClient = await DBH.db;
    var rs = await dbClient.insert('Revenue', record.toMap());
    
    return rs;
  }
    // 3. ProductsRevenue table
  static Future<int> addProductRevenue (ProductsRevenue record) async {    
    var dbClient = await DBH.db;
    var rs = await dbClient.insert('ProductsRevenue', record.toMap());
    
    return rs;
  }  
}