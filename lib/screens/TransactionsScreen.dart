// import 'package:flutter/material.dart';
// import 'package:kudibooks/IncomeTab.dart';
// import 'package:kudibooks/ExpenseTab.dart';
// import 'package:kudibooks/main.dart';

// class Transactions extends StatefulWidget {
//   Transactions({Key key}) : super(key: key);

//   @override
//   _TransactionsState createState() => _TransactionsState();
// }

// class _TransactionsState extends State<Transactions> {

//   @override
//   Widget build(BuildContext context) {
//     final String tab = ModalRoute.of(context).settings.arguments;
//     List<Object> tabsData = new List<Object>();

//     List<Object> tabs () {
//       if(tab == 'income') {        
//         tabsData = [Income(), Expense(), "Income", "Expense"];
//         return tabsData;
//       } else {
//         tabsData = [Expense(), Income(), "Expense", "Income"];       
//         return tabsData;
//       }
//     }    


//     return MaterialApp(
//       home: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             bottom: TabBar(
//               tabs: [
//                 Tab(
//                   child: Row(
//                     children: <Widget>[
//                       CircleAvatar(
//                         radius: 8,
//                         // backgroundColor: color1,
//                       ),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Text(tabsData[2], style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.grey[900]),),
//                     ],
//                   ),
//                 ),
//                 Tab(
//                   child: Row( 
//                     children: <Widget>[
//                       CircleAvatar(
//                         radius: 8,
//                         // backgroundColor: color2,
//                       ),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Text(tabsData[3], style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.grey[900]),),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             iconTheme: IconThemeData(
//             color: Colors.black, //change your color here
//           ),
//             title: Text('New Transaction',
//               style: TextStyle(
//                 color: Colors.black,
//               )
//             ),
//             centerTitle: true,
//             backgroundColor: Colors.white,
//             elevation: 8,
//           ),
//           body: TabBarView(
//             children: tabs(),
//           ),
//         ),
//       ),
//     );

//   }
// }










// Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Container(
//                       child: Column(
//                         children: <Widget>[
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Color.fromRGBO(243, 245, 248, 1),
//                               borderRadius: BorderRadius.all(Radius.circular(18))
//                             ),
//                             child: Icon(Icons.date_range, color: theme.secondC, size: 30,),
//                             padding: EdgeInsets.all(12),
//                           ),
//                           SizedBox(
//                             height: 4,
//                           ),
//                           Text("Revenue", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.blue[100]),),
//                         ],
//                       ),
//                     ),

//                     Container(
//                       child: Column(
//                         children: <Widget>[
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: Color.fromRGBO(243, 245, 248, 1),
//                                 borderRadius: BorderRadius.all(Radius.circular(18))
//                             ),
//                             child: Icon(Icons.public, color: theme.secondC, size: 30,),
//                             padding: EdgeInsets.all(12),
//                           ),
//                           SizedBox(
//                             height: 4,
//                           ),
//                           Text("Expense", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.blue[100]),),
//                         ],
//                       ),
//                     ),

//                     Container(
//                       child: Column(
//                         children: <Widget>[
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: Color.fromRGBO(243, 245, 248, 1),
//                                 borderRadius: BorderRadius.all(Radius.circular(18))
//                             ),
//                             child: Icon(Icons.attach_money, color: theme.secondC, size: 30,),
//                             padding: EdgeInsets.all(12),
//                           ),
//                           SizedBox(
//                             height: 4,
//                           ),
//                           Text("Invoice", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.blue[100]),),
//                         ],
//                       ),
//                     ),

//                     Container(
//                       child: Column(
//                         children: <Widget>[
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: Color.fromRGBO(243, 245, 248, 1),
//                                 borderRadius: BorderRadius.all(Radius.circular(18))
//                             ),
//                             child: Icon(Icons.trending_down, color: theme.secondC, size: 30,),
//                             padding: EdgeInsets.all(12),
//                           ),
//                           SizedBox(
//                             height: 4,
//                           ),
//                           Text("Bill", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.blue[100]),),
//                         ],
//                       ),
//                     ),

//                     Container(
//                       child: Column(
//                         children: <Widget>[
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: Color.fromRGBO(243, 245, 248, 1),
//                                 borderRadius: BorderRadius.all(Radius.circular(18))
//                             ),
//                             child: Icon(Icons.trending_down, color: theme.secondC, size: 30,),
//                             padding: EdgeInsets.all(12),
//                           ),
//                           SizedBox(
//                             height: 4,
//                           ),
//                           Text("Pay Bill", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.blue[100]),),
//                         ],
//                       ),
//                     )
//                   ],
//                 )
