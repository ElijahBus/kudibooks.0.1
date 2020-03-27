import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(), // client nm
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(), // phone num
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(), // csh bnk ccount
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(), // $ pd
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(), // reference num
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(), // trnsc nm
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              child: Text("Submitß"),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Text("Open Popup"),
        ),
      ),
    );
  }
}