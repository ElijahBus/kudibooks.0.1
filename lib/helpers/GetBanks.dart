///
/// This helper class help get all the company accounts Cash/Bank account,
/// the data get preselected for being used in other part of the 
/// application where needed, 
/// 
/// for instance,
/// 1. when recording a revenue, the selection of the cash/bank account is needed.
/// 
///
///

import 'dart:async';

import 'package:kudibooks/helpers/DBHelper.dart';
import 'package:sqflite/sqflite.dart';

class GetBanks {


  static List<Map<String, dynamic>> bankNames;

  GetBanks() {
    selectBanks();
  }

  static Future<List<Map<String, dynamic>>> selectBanks() async {
    Database dbh = await DBH.db;
    bankNames = await dbh.rawQuery('SELECT name from CompanyAccount');
    
    return bankNames;
  }
}