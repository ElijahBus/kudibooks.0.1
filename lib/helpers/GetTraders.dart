///
/// This helper class help get all the client/vendors from the database,
/// the data get preselected for being used in other part of the 
/// application where needed, 
/// 
/// for instance,
/// 1. when recording a revenue, the selection of the client is needed.
/// 
///
///

import 'dart:async';

import 'package:kudibooks/helpers/DBHelper.dart';
import 'package:sqflite/sqflite.dart';

class GetTraders {


  List<Map<String, dynamic>> traders;

  GetTraders() {
    selectTraders();
  }

  Future<List<Map<String, dynamic>>> selectTraders() async {
    Database dbh = await DBH.db;
    traders = await dbh.rawQuery('SELECT name from Trader');
    
    return traders;
  }
}