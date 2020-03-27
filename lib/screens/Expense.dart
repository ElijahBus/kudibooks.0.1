import 'package:flutter/material.dart';
import 'package:kudibooks/utils/Theme.dart';
import 'package:kudibooks/models/Expense.dart';

class Expense extends StatefulWidget {

  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
    final _formKey = GlobalKey<FormState>();
    List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
    String _color = '';

    KudiTheme theme = new KudiTheme();

    // properties to hold form value
    int id;
    String expenseAccount;
    String bankID;
    var amountPaid;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(            
            title: Text('Pay Expense',
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
                                  icon: const Icon(Icons.account_box, color: Color.fromRGBO(113, 193, 126, 1)),
                                  labelText: 'Expense Account',
                                ),
                                isEmpty: _color == '',
                                child: new DropdownButtonHideUnderline(
                                  child: new DropdownButton(
                                    value: _color,
                                    isDense: true,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        // newContact.favoriteColor = newValue;
                                        _color = newValue;
                                        state.didChange(newValue);
                                      });
                                    },
                                    items: _colors.map((String value) {
                                      return new DropdownMenuItem(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                            onSaved: (val) => id = int.parse(val),
                          ),

                          new FormField(
                            builder: (FormFieldState state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.account_balance, color: Color.fromRGBO(113, 193, 126, 1)),
                                  labelText: 'Select Cash/Bank account',
                                ),
                                isEmpty: _color == '',
                                child: new DropdownButtonHideUnderline(
                                  child: new DropdownButton(
                                    value: _color,
                                    isDense: true,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        // newContact.favoriteColor = newValue;
                                        _color = newValue;
                                        state.didChange(newValue);
                                      });
                                    },
                                    items: _colors.map((String value) {
                                      return new DropdownMenuItem(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                            onSaved: (val) => expenseAccount = val.toString(),
                          ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.attach_money, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Amount paid',
                              labelText: '0',
                            ),
                            keyboardType: TextInputType.datetime,
                            onSaved: (val) => bankID = val,
                          ),

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
                            keyboardType: TextInputType.datetime,
                            onSaved: (val) => amountPaid = val,                 
                          ),
                          
                          
                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.note, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Transaction name',
                              labelText: 'Transaction name',
                            ),
                            keyboardType: TextInputType.text,
                          ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.note_add, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Memo',
                              labelText: 'Memo',
                            ),
                            keyboardType: TextInputType.multiline,
                          ),

                          new Container(
                              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                              child: new RaisedButton(
                                child: const Text('Save Expense Payment', style: TextStyle(color: Colors.white)),
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

  // TODO:
  void save() async {
    // ExpenseModel expense = new ExpenseModel(id, expenseAccount, bankID, amountPaid);
    
   try {     
    //  await expense.insert(expense);      
    print('success');
   } catch (e) {
     print('save error');
     print(e);
   }
  }
}