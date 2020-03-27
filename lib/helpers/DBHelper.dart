///
/// Define a helper class for all the database operations. 
///

import 'dart:io' as io;

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBH {

  static Database _db;
  static Future<Database> get db  async {
    if(_db != null) {
      return _db;
    }
    _db = await initDatabase();
  }

  // Initialize the database
  static initDatabase() async {
    // Get the directory in android or ios 
    // where the db path will be created
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    // Set the path to the db
    // usign the join() from the path package under path_provider dart plugin
    String path = join(documentDirectory.path, 'kudibooks.db');
	print(path);
    // Open the database at the created path with version : 1 (no upgrade nor downgrade)
    var db = openDatabase(path, version: 1, onCreate: _onCreate);

    return db;
  }

  // Define the _onCreate method to be called at
  //  the database initialization
  static _onCreate(Database db, int version) async {
    await db.execute(" " +
    
        "BEGIN TRANSACTION;" +
        "CREATE TABLE IF NOT EXISTS `TransactionType` (`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,`name`	TEXT NOT NULL);"+
        "CREATE TABLE IF NOT EXISTS `Transaction` ("+
          "`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"+
          "`serverID`	INTEGER,"+
          "`transactionTypeID`	INTEGER NOT NULL,"+
          "`name`	TEXT NOT NULL,"+
          "`transactionDate`	TEXT NOT NULL,"+
          "`memo`	TEXT NOT NULL,"+
          "`isSynced`	INTEGER NOT NULL,"+
          "`createdAt`	TEXT NOT NULL,"+
          "`updatedAt`	TEXT,"+
          "`approved`	INTEGER NOT NULL,"+
          "FOREIGN KEY(`transactionTypeID`) REFERENCES `TransactionType`(`id`)"+
        ");"+
        "CREATE TABLE IF NOT EXISTS `Trader` (`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,`name`	TEXT NOT NULL,`type`	TEXT NOT NULL);"+
        "INSERT INTO `Trader` VALUES (1,'Elijah','Vendor');"+
        "INSERT INTO `Trader` VALUES (2,'Chris','Client');"+
        "INSERT INTO `Trader` VALUES (3,'Dave','Client');"+
        "INSERT INTO `Trader` VALUES (4,'Etoile','Vendor');"+
        "CREATE TABLE IF NOT EXISTS `Revenue` ("+
          "`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"+
          "`transactionID`	INTEGER NOT NULL,"+
          "`productsRevenueId`	INTEGER NOT NULL,"+
          "`clientID`	INTEGER NOT NULL,"+
          "`bankID`	INTEGER,"+
          "`referenceNumber`	NUMERIC NOT NULL"+
        ");"+
        "CREATE TABLE IF NOT EXISTS `ProductsRevenue` ("+
          "`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"+
          "`revenueID`	INTEGER NOT NULL,"+
          "`productID`	INTEGER NOT NULL,"+
          "`unit`	INTEGER NOT NULL,"+
          "`amount`	REAL NOT NULL"+
        ");"+        
        "CREATE TABLE IF NOT EXISTS `CompanyAccount` ("+
          "`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"+
          "`name`	TEXT NOT NULL,"+
          "`accountTypeID`	INTEGER NOT NULL,"+
          "FOREIGN KEY(`accountTypeID`) REFERENCES `AccountType`(`id`)"+
        ");"+
        "INSERT INTO `CompanyAccount` VALUES (1,'ABC Inc',1);"+
        "INSERT INTO `CompanyAccount` VALUES (2,'CHK Inc',1);"+
        "INSERT INTO `CompanyAccount` VALUES (3,'ZBM Inc',2);"+
        "INSERT INTO `CompanyAccount` VALUES (4,'HYT Corp',2);"+        
        "CREATE TABLE IF NOT EXISTS `AccountType` ("+
          "`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"+
          "`name`	TEXT NOT NULL"+
        ");"+
        "INSERT INTO `AccountType` VALUES (1,'Bank Account');"+
        "INSERT INTO `AccountType` VALUES (2,'Cash Account');"+
        "COMMIT;"+
          "");
  }

}
