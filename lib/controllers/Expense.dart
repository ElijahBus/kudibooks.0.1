import 'dart:async';

import 'package:kudibooks/helpers/DBHelper.dart';
import 'package:kudibooks/models/Expense.dart';
import 'package:sqflite/sqflite.dart';


class ExpenseController {

  

    // get the bank ID
  static getbankID(String companyName) async {
    Database database = await DBH.db;
    var result = await database.rawQuery('SELECT id FROM CompanyAccount WHERE name = ' + companyName);
    // return a the Trader id
    return result;
  }

  // record the expense
  static Future<int> recordExpense(ExpenseModel expense) async {
    Database database = await DBH.db;
    expense.id = await database.insert('Expense', expense.toMap());

    return expense.id;
  }
}