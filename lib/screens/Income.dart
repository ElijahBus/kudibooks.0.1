import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kudibooks/utils/Theme.dart';
import 'package:kudibooks/controllers/Revenue.dart';
import 'package:kudibooks/models/Transaction.dart' as Tr;
import 'package:kudibooks/models/Revenue.dart';
import 'package:kudibooks/models/ProductsRevenue.dart';

import 'dart:async';

import 'package:sqflite/sqflite.dart';
// import 'package:intl/intl.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class Income extends StatefulWidget {

  @override
  _IncomeState createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  final  _formKey = new GlobalKey<FormState>();

  @override
  void initState() { 
    super.initState();    
  }

  List<String> _banks = <String>['', 'ABC Inc', 'CHK Inc'];
  List<String> _traders = <String>['', 'Elijah', 'Dave'];

  String _bank = '';
  String _trader = '';

  // properties to hold form value
    static String client;   
    static String cashBankaccount;  
    static double amount;
    static String transactionDate;
    static String referenceNumber;
    static String transactionName;
    static String memo;

  // Connect to the model class

  // Get the app theme
  KudiTheme theme = new KudiTheme();

  // final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
  // DateTime date;
  String currentDate = new DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(            
            title: Text('Record Revenue',
              style: TextStyle(
                color: Colors.white,
              )
            ),
            centerTitle: true,
            backgroundColor: theme.mainC,
            elevation: 8,
          ),
          body: Center(            
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
              children: <Widget>[
                Center(
                  child: Card(
                    elevation: 8.0,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Form(
                          key: _formKey,
                          child: Column(
                          children: <Widget>[
                            new FormField(

                            builder: (FormFieldState state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.person, color: Color.fromRGBO(113, 193, 126, 1)),
                                  labelText: 'Select Client',
                                ),
                                isEmpty: _trader == '',
                                child: new DropdownButtonHideUnderline(
                                  child: new DropdownButton(
                                    value: _trader,
                                    isDense: true,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        // newContact.favoriteColor = newValue;
                                        _trader = newValue;
                                        state.didChange(newValue);
                                      });
                                    },
                                    items: _traders.map((String value) {
                                      return new DropdownMenuItem(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                            onSaved: (val) => client = val,
                          ),

                          new FormField(
                            builder: (FormFieldState state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.account_balance, color: Color.fromRGBO(113, 193, 126, 1)),
                                  labelText: 'Select Cash/Bank account',
                                ),
                                isEmpty: _bank == '',
                                child: new DropdownButtonHideUnderline(
                                  child: new DropdownButton(
                                    value: _bank,
                                    isDense: true,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        // newContact.favoriteColor = newValue;
                                        _bank = newValue;
                                        state.didChange(newValue);
                                      });
                                    },
                                    items: _banks.map((String value) {
                                      return new DropdownMenuItem(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                            onSaved: (val) => cashBankaccount = val,
                          ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.attach_money, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Amount paid',
                              labelText: '0',
                            ),
                            keyboardType: TextInputType.datetime,
                            onSaved: (val) => amount = double.parse(val),
                          ),

                          new Container(
                          margin: const EdgeInsets.only(left: 100.0, right: 100.0),
                          child: Divider(
                            color: theme.secondC,
                            height: 50,
                          )),

                          // new Row(
                          //   children: <Widget>[
                          //     Text(
                          //       'Date'
                          //     ),
                          //     DateTimePickerFormField(
                          //       format: dateFormat,
                          //       decoration: InputDecoration(labelText: 'Date'),
                          //       onChanged: (dt) => setState(() => date = dt),
                          //     ),
                          //   ],
                          // ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.calendar_today, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Transaction date',
                              labelText: 'Transaction date',                              
                            ),
                            initialValue: currentDate,
                            keyboardType: TextInputType.datetime,
                            onSaved: (val) => transactionDate = val,         
                          ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.confirmation_number, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Reference number',
                              labelText: 'Reference number',
                            ),
                            keyboardType: TextInputType.text,
                            onSaved: (val) => referenceNumber = val,                
                          ),
                          
                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.note, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Transaction name',
                              labelText: 'Transaction name',
                            ),
                            keyboardType: TextInputType.text,
                            onSaved: (val) => transactionName = val,
                          ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.note_add, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Memo',
                              labelText: 'Memo',
                            ),
                            keyboardType: TextInputType.multiline,
                            onSaved: (val) => memo = val,
                          ),

                          new Container(
                              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                              child: new RaisedButton(
                                child: const Text('Save Transaction', style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  _formKey.currentState.save();
                                  save();
                                },
                                color: theme.mainC
                          )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
      );
  }


  void save() async {
    // get client id & bank id
    var clientID = RevenueController.getbankID(client);
    var bankID = RevenueController.getbankID(cashBankaccount);

    try {     
      Tr.Transaction tr = new Tr.Transaction(null, transactionDate, memo, transactionDate, null);
      var trID = await RevenueController.addTransaction(tr);

      Revenue rv = new Revenue( trID, clientID, bankID, referenceNumber);
      var rvID = await RevenueController.addRevenue(rv);

      ProductsRevenue pr = new ProductsRevenue( rvID, 1, 1, amount);
      await RevenueController.addProductRevenue(pr);
      
      print('success');
    } catch (e) {
      print('save error');
      print(e);
    }
    }
}