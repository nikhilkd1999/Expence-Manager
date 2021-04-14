import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return 
    
    
    Container(

      height: 490,

      

      child: transactions.isEmpty ? 
      
      
      
        Column(

          children: [
            
            Text('The List Is Empty',
          
          style: Theme.of(context).textTheme.title,
          
          ),

          SizedBox(height: 20,),

          Container(
            
            height: 300,
            
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)),

          ]

        )



       :
       
       ListView.builder(
        itemBuilder: (ctx, index){

          return Card(

            elevation: 5,

            margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),


            child: ListTile(leading: CircleAvatar(radius: 30,
            child: 
            Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(child: Text('₹ ${transactions[index].amount.toStringAsFixed(2)}'),),
              )
              
              ,),
              

              title: Text(transactions[index].title, style: Theme.of(context).textTheme.title,),
              
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date),)

              
              
              ,),
          );
          // Card(
          //   elevation: 1,
          //   child: Row(
          //     children: [
          //       Container(
                  
          //         margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          //         decoration: BoxDecoration(
          //           border: Border.all(
          //             color: Theme.of(context).primaryColor,
          //             width: 2,
                      
          //           ),
                    
          //           // boxShadow: [BoxShadow( color: Colors.grey , blurRadius: 2 ),],
          //         ),
          //         padding: EdgeInsets.all(10),
          //         child: Text(
          //           '₹ ${transactions[index].amount.toStringAsFixed(2)}',
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 20,
          //               color: Colors.purple),
          //         ),
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             transactions[index].title,
          //             // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,
                      
          //             style: Theme.of(context).textTheme.title,
                      
                      
          //             textAlign: TextAlign.left,
          //           ),
          //           Text(
          //             DateFormat.yMMMd().format(transactions[index].date),
          //             style: TextStyle(color: Colors.grey),
          //             textAlign: TextAlign.left,
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // );



        },
        itemCount: transactions.length,
        )
        
        
        // children: transactions.map<Widget>((tx) {
          
        // }).toList(),
      // ),
    );
  }
}
