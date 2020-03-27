import 'package:flutter/material.dart';
import 'package:kudibooks/screens/CardScreen.dart';
import 'package:kudibooks/screens/HomeScreen.dart';
import 'package:kudibooks/screens/Bill.dart';
import 'package:kudibooks/screens/PayBill.dart';
import 'package:kudibooks/screens/Expense.dart';
import 'package:kudibooks/screens/Income.dart';
import 'package:kudibooks/screens/Invoice.dart';
import 'package:kudibooks/utils/Theme.dart';

import 'package:kudibooks/helpers/DBHelper.dart';


void main() {  
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kudiboks Cashier',
      // theme: ThemeData(        
      //   primarySwatch: Colors.blue,
      // ),
      home: WalletApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WalletApp extends StatefulWidget {
  @override
  _WalletAppState createState() => _WalletAppState();
}

class _WalletAppState extends State<WalletApp> {
  var screens = [
    HomeScreen(),
    CardScreen(),
  ]; //screens for each tab

  int selectedTab = 0;

  String screen = 'income';
  // String get tab => screen;

  KudiTheme theme = new KudiTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 81, 158, 1),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: theme.secondC),
            title: Text("Home", style: TextStyle(color: theme.secondC))
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card, color: theme.secondC),
              title: Text("Card", style: TextStyle(color: theme.secondC))
          ),
        ],
        onTap: (index){
          setState(() {
            selectedTab = index;
          });
        },
        showUnselectedLabels: true,
        iconSize: 30,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Transactions()));
          return showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Select Transaction Type'),
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {                          
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Income()));                                                      
                        },
                        child: Text('Income'),
                      ),
                      RaisedButton(
                        onPressed: () {                          
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Expense()));
                        },
                        child: Text('Expense'),
                      ),
                      RaisedButton(
                        onPressed: () {                          
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Invoice()));                       },
                        child: Text('Invoice'),
                      ),
                      RaisedButton(
                        onPressed: () {                          
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Bill()));
                        },
                        child: Text('Bill'),
                      ),
                      RaisedButton(
                        onPressed: () {                        
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => PayBill())); 
                        },
                        child: Text('Pay Bill'),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Cancel', style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },  
        elevation: 0,
        child: Icon(Icons.add),
        backgroundColor: theme.mainC,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screens[selectedTab],
    );
  }
}


// Future<void> _neverSatisfied() async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Rewind and remember'),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text('You will never be satisfied.'),
//               Text('You\’re like me. I’m never satisfied.'),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           FlatButton(
//             child: Text('Regret'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
