
// import 'package:expence_manager/widgets/new_transaction.dart';
// import 'package:expence_manager/widgets/transaction_list.dart';
import 'package:expence_manager/widgets/chart.dart';
import 'package:expence_manager/widgets/new_transaction.dart';
import 'package:expence_manager/widgets/transaction_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';
// import './widgets/user_transactions.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Expence Manager',
    
    theme: ThemeData(
      primarySwatch: Colors.green
      ,
      accentColor: Colors.red,

      fontFamily: 'Quicksand',
      
      textTheme: ThemeData.light().textTheme.copyWith(
        title: TextStyle(
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),
      ),

      appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(
        title: TextStyle(
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold
        ),
      ),),


      )
    ,
    
     home: MyHomePage());
  }
}



class MyHomePage extends StatefulWidget {

  
// String titleInput;
// String amountInput;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// final titleController = TextEditingController();

// final amountController = TextEditingController();

final List _userTransactions = <Transaction> [

    // Transaction(id: 't1', title: 'first', amount: 69.99, date: DateTime.now()),
    // Transaction(id: 't2', title: 'second', amount: 4544.99, date: DateTime.now()),
    // Transaction(id: 't3', title: 'third', amount: 989665, date: DateTime.now()),



  ];




  void _addNewTransaction(String txTitle, double txAmount){

    final newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());

    setState(() {
          _userTransactions.add(newTx);
        });
  }


void startAddNewTransaction(BuildContext ctx)
{
  showModalBottomSheet(context: ctx, builder: (_){

    return GestureDetector(
      
      onTap: (){},
      
      child : NewTransaction(_addNewTransaction),
      
      behavior: HitTestBehavior.opaque,
      
      );
  },);
}



  List<Transaction> get _recentTransactions
  {
    return _userTransactions.where((tx) {

      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7),)
      );

    }).toList();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expence Manager'),
      
      actions: [
        IconButton(icon: Icon(Icons.add), onPressed : () => startAddNewTransaction(context) )
      ],
      ),
      
      body: 
      
      
      Container(
        margin: EdgeInsets.all(5),
        child: SingleChildScrollView(

          child: Column(

            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,

          
            



            children: <Widget>[
              
              

              Chart(_recentTransactions),

                      
                      // UserTransactions(),
                      TransactionList(_userTransactions),


                      
              
            ],
          ),
        ),
      ),
      
                      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: () => startAddNewTransaction(context),),
    );
  }
}


// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///



// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import './models/transaction.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final List<Transaction> transactions = [
//     Transaction(
//       id: 't1',
//       title: 'New Shoes',
//       amount: 69.99,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: 't2',
//       title: 'Weekly Groceries',
//       amount: 16.53,
//       date: DateTime.now(),
//     ),
//   ];
//   // String titleInput;
//   // String amountInput;
//   final titleController = TextEditingController();
//   final amountController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter App'),
//       ),
//       body: Column(
//         // mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Container(
//             width: double.infinity,
//             child: Card(
//               color: Colors.blue,
//               child: Text('CHART!'),
//               elevation: 5,
//             ),
//           ),
//           Card(
//             elevation: 5,
//             child: Container(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   TextField(
//                     decoration: InputDecoration(labelText: 'Title'),
//                     controller: titleController,
//                     // onChanged: (val) {
//                     //   titleInput = val;
//                     // },
//                   ),
//                   TextField(
//                     decoration: InputDecoration(labelText: 'Amount'),
//                     controller: amountController,
//                     // onChanged: (val) => amountInput = val,
//                   ),
//                   FlatButton(
//                     child: Text('Add Transaction'),
//                     textColor: Colors.purple,
//                     onPressed: () {
//                       print(titleController.text);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ////////////////////////////////////////////////////////////////////////////////////////////////////////
//           Column(
//             children: transactions.map((tx) {
//               return Card(
//                 child: Row(
//                   children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.symmetric(
//                         vertical: 10,
//                         horizontal: 15,
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.purple,
//                           width: 2,
//                         ),
//                       ),
//                       padding: EdgeInsets.all(10),
//                       child: Text(
//                         '\$${tx.amount}',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.purple,
//                         ),
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           tx.title,
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           DateFormat.yMMMd().format(tx.date),
//                           style: TextStyle(
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }















// 