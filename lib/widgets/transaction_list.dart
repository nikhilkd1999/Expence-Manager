import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final transactions;
  final Function deleteTx;

  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return 
    
    
    Container(

      // height: MediaQuery.of(context).size.height * 0.6,
      
      
      // padding: EdgeInsets.all(2),
      // decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.black)),

      

      child: transactions.isEmpty ? 
      
      
      LayoutBuilder(builder: (context,constraints){

        return Column(

          children: [
            
            Text('The List Is Empty',
          
          style: Theme.of(context).textTheme.title,
          
          ),

          SizedBox(height: 20,),

          Container(
            
            height: constraints.maxHeight * 0.6,
            
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,),
            ),

          ]

        );

      })
        



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
              ),
              
              ),
              

              title: Text(transactions[index].title, style: Theme.of(context).textTheme.title,),
              
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date),),

              trailing: IconButton(icon: Icon(Icons.delete,color: Theme.of(context).errorColor,),
              // trailing: IconButton(icon: Icon(Icons.delete),color: Colors.red,),
              
              onPressed: () => deleteTx(transactions[index].id),
              
              
              ),
              
              
              ),
          );
          
        },
        itemCount: transactions.length,
        )
        
        
        // children: transactions.map<Widget>((tx) {
          
        // }).toList(),
      // ),
    );
  }
}
