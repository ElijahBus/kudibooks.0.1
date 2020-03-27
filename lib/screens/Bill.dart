import 'package:flutter/material.dart';
import 'package:kudibooks/utils/Theme.dart';
import 'package:kudibooks/models/Bill.dart';

class Bill extends StatefulWidget {
  Bill({Key key}) : super(key: key);

  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
    final _formKey = GlobalKey<FormState>();
    // var colors to be changed and asigned correct values
    List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
    String _color = '';

    // properties to hold form values
    int id;
    int vendorID;
    int goodsServicesID;
    String dueDate;
    var billNumber;

    KudiTheme theme = new KudiTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('New Bill',
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
                                  labelText: 'Vendor',
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

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.calendar_today, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Select date',
                              labelText: 'Billing date',
                            ),
                            keyboardType: TextInputType.datetime,
                            onSaved: (val) => vendorID = int.parse(val),
                          ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.calendar_today, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Due date',
                              labelText: 'Select date',
                            ),
                            keyboardType: TextInputType.datetime,
                            onSaved: (val) => goodsServicesID = int.parse(val),
                          ),

                          new Container(
                          margin: const EdgeInsets.only(left: 100.0, right: 100.0),
                          child: Divider(
                            color: theme.secondC,
                            height: 50,
                          )),

                          new FormField(
                            builder: (FormFieldState state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.laptop_mac, color: Color.fromRGBO(113, 193, 126, 1)),
                                  labelText: 'Product',
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
                            onSaved: (val) => dueDate = val.toString(),
                          ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.attach_money, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: '0',
                              labelText: 'Unit cost',
                            ),
                            keyboardType: TextInputType.number,
                            onSaved: (val) => billNumber = val,
                          ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.confirmation_number, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: '-',
                              labelText: 'Units',
                            ),
                            keyboardType: TextInputType.number,
                          ),


                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.attach_money, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: '0',
                              labelText: 'Amount',
                            ),
                            keyboardType: TextInputType.number,
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
                              icon: const Icon(Icons.note, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Bill Number',
                              labelText: 'Bill Number',
                            ),
                            keyboardType: TextInputType.text,
                          ),


                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.note, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Transaction Name',
                              labelText: 'Transaction Name',
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
                                child: const Text('Save Bill', style: TextStyle(color: Colors.white)),
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
      );  }


  // TODO:
  void save() async {
    // BillModel bill = new BillModel(id, vendorID, goodsServicesID, dueDate, billNumber);

   try {     
    //  await bill.insert(bill);
    print('success');
   } catch (e) {
     print('save error');
     print(e);
   }
  }
}
