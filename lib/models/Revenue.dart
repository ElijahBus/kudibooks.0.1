/// Define the model for the Revenue
/// 
import 'dart:async';
import 'package:sqflite/sqflite.dart';

import 'package:kudibooks/helpers/DBHelper.dart';
import 'package:kudibooks/controllers/Revenue.dart';
import 'package:kudibooks/models/Trader.dart';
import 'package:kudibooks/models/TransactionType.dart';

class Revenue {

  
  //   
  int transactionID;  
  int clientID;
  int bankID;
  String referenceNumber;
  
 int get getTransactionID => transactionID;

 set setTransactionID(int transactionID) => this.transactionID = transactionID;

 int get getClientID => clientID;

 set setClientID(int clientID) => this.clientID = clientID;

 int get getBankID => bankID;

 set setBankID(int bankID) => this.bankID = bankID;

 String get getReferenceNumber => referenceNumber;

 set setReferenceNumber(String referenceNumber) => this.referenceNumber = referenceNumber;

  Revenue( this.transactionID, this.clientID, this.bankID, this.referenceNumber);

  // Convert the Revenue Object to a map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'transactionID': this.transactionID,      
      'clientID': this.clientID,
      'bankID': this.bankID,
      'referenceNumber': this.referenceNumber
    };
    
    return map;
  }

  // Convert a retrieved Map back to a Revenue Object
  Revenue.fromMap(Map<String, dynamic> map) {
    transactionID = map['transactionID'];    
    clientID = map['clientID'];
    bankID = map['bankID'];
    referenceNumber = map['referenceNumber'];
  }


  // CRUD 

  // insert (Revenue revenue) async {
  //   await RevenueController.add(revenue);
  // }

  static select() async {    
    Database database = await DBH.db;
    List<Map<String, dynamic>> result1 = await database.rawQuery('SELECT * FROM Revenue');
    List<Map<String, dynamic>> result2 = await database.rawQuery('SELECT * FROM Transaction');
    List<Map<String, dynamic>> result3 = await database.rawQuery('SELECT * FROM ProductsRevenue');

    print(result1.toList());
    print('transaction start');
    print(result2.toList());
    print('products revenue start');
    print(result3.toList());

  }
}