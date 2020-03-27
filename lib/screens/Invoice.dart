import 'package:flutter/material.dart';
import 'package:kudibooks/utils/Theme.dart';
import 'package:kudibooks/models/Invoice.dart';

class Invoice extends StatefulWidget {

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
    final _formKey = GlobalKey<FormState>();
    List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
    String _color = '';

    // properties to hold form values
    int id;
    String dueDate;
    int productsServicesID;
    int invoiceNumber;

    KudiTheme theme = new KudiTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(            
            title: Text('Record Invoice',
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
                              hintText: 'Invoice date',
                              labelText: 'Select date',
                            ),
                            keyboardType: TextInputType.datetime,
                            onSaved: (val) => productsServicesID = int.parse(val),
                          ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.calendar_today, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: 'Due date',
                              labelText: 'Select date',
                            ),
                            keyboardType: TextInputType.datetime,
                            onSaved: (val) => dueDate = val,
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
                                  labelText: 'Product/Service',
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
                            onSaved: (val) => invoiceNumber = int.parse(val),
                          ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.attach_money, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: '0',
                              labelText: 'Unit price',
                            ),
                            keyboardType: TextInputType.datetime,
                          ),

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.confirmation_number, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: '-',
                              labelText: 'Unit',
                            ),
                            keyboardType: TextInputType.text,                      
                          ),
                          

                          new TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.attach_money, color: Color.fromRGBO(113, 193, 126, 1)),
                              hintText: '0',
                              labelText: 'Total',
                            ),
                            keyboardType: TextInputType.datetime,
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
                              hintText: 'Invoice number',
                              labelText: 'Invoice number',
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
                                color: theme.mainC,
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
    // InvoiceModel invoice = new InvoiceModel(id, productsServicesID, dueDate, invoiceNumber);

   try {     
    //  await invoice.insert(invoice);      
    print('success');
   } catch (e) {
     print('save error');
     print(e);
   }
  }
}