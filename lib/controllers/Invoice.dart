///
///
///
///

import 'dart:async';

import 'package:kudibooks/helpers/DBHelper.dart';
import 'package:kudibooks/models/Invoice.dart';
import 'package:kudibooks/models/ProductsInvoice.dart';
import 'package:sqflite/sqflite.dart';

class InvoiceController {


  // record the invoice 
  static Future<int> recordInvoice(InvoiceModel invoice)  async {
    Database database = await DBH.db;
    invoice.id = await database.insert('Invoice', invoice.toMap());

    return invoice.id;
  }

  // add products to the invoice
  static Future<int> addProducts(ProductsInvoice product) async {
    Database database = await DBH.db;
    product.id = await database.insert('ProductcInvoice', product.toMap());

    return product.id;
  }
}