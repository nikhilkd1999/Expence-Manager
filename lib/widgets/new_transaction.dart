import 'package:flutter/material.dart';
import 'package:flutter/services.dart';






class NewTransaction extends StatefulWidget {


  final addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData()
  {

    final inputTitle = titleController.text;
    final inputAmount = double.parse(amountController.text);

    if(inputTitle.isEmpty || inputAmount <=0)
    {
      return;
    }

    widget.addNewTransaction(inputTitle,inputAmount);

  Navigator.of(context).pop();


  }

  @override
  Widget build(BuildContext context) {
    return Card(

                    elevation: 5,

                    child: 
                    
                    Container(

                      padding: EdgeInsets.all(10),

                      margin: EdgeInsets.all(1),


                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.end,

                        

                        children: <Widget> [

                          // TextField(),

                            TextField( decoration: InputDecoration(labelText: 'Title'),
                            //onChanged: (value){ titleInput = value;  },
                             
                             controller: titleController,
                              onSubmitted: (_) => submitData(),
                             
                             ),
                            TextField( decoration: InputDecoration(labelText: 'Amount'),
                            // onChanged: (value){amountInput = value;},
                            controller: amountController,
                            keyboardType: TextInputType.number,

                              onSubmitted: (_) => submitData(),

                             ),


                            TextButton(
                            
                            child: Text('Add Transaction'),


                              // style: ButtonStyle(foregroundColor: Colors.black),


                            onPressed:() => submitData(),

                            ),


                        ],


                      ),
                    ),
                    
                    
                    );
  }
}