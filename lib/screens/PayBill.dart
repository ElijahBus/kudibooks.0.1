import 'package:flutter/material.dart';
import 'package:kudibooks/utils/Theme.dart';
import 'package:kudibooks/models/PayBill.dart';

class PayBill extends StatefulWidget {
  PayBill({Key key}) : super(key: key);

  @override
  _PayBillState createState() => _PayBillState();
}

class _PayBillState extends State<PayBill> {
    final _formKey = GlobalKey<FormState>();
    List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
    String _color = '';

    // properties to hold form values
    int id;
    int vendorID;
    int goodsServicesPayBillID;
    int referenceNumber;


    KudiTheme theme = new KudiTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Pay Bills',
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
                        child: Column(
                          children: <Widget>[
                            new FormField(

                            builder: (FormFieldState state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.person, color: Color.fromRGBO(113, 193, 126, 1)),
                                  labelText: 'Select Vendor',
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
                            onSaved: (val) => vendorID = int.parse(val),
                          ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.attach_money, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: '0',
                              labelText: 'Amount',
                            ),
                            keyboardType: TextInputType.datetime,
                            onSaved: (val) => goodsServicesPayBillID = int.parse(val),
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
                            keyboardType: TextInputType.datetime,
                            onSaved: (val) => referenceNumber = int.parse(val),
                          ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.confirmation_number, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Reference number',
                              labelText: 'Reference number',
                            ),
                            keyboardType: TextInputType.text,
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
                                child: const Text('Save Transaction', style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  _formKey.currentState.save();
                                  save();
                                },
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
    PayBillModel payBill = new PayBillModel(id, vendorID, goodsServicesPayBillID, referenceNumber);

   try {     
     await payBill.insert(payBill);      
    print('success');
   } catch (e) {
     print('save error');
     print(e);
   }
  }
}
