import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';






class NewTransaction extends StatefulWidget {


  final addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime _selectedDate;

  void _submitData()
  {
    if(amountController.text.isEmpty)
    {
      return;
    }

    final inputTitle = titleController.text;
    final inputAmount = double.parse(amountController.text);

    if(inputTitle.isEmpty || inputAmount <=0 || _selectedDate == null)
    {
      return;
    }

    widget.addNewTransaction(inputTitle,inputAmount,_selectedDate);

  Navigator.of(context).pop();


  }


  void _presentDatePicker()
  {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime.now()
    ).then((pickedDate)
    {
        if(pickedDate==null)
        {
          return;
        }

        setState(() {
        _selectedDate = pickedDate;
                  
                });

    }
    );
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(

                      elevation: 5,

                      child: 
                      
                      Container(

                        padding: EdgeInsets.only(top: 10, left: 10, right:  10, bottom: MediaQuery.of(context).viewInsets.bottom + 10 ),

                        margin: EdgeInsets.all(1),


                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.end,

                          

                          children: <Widget> [

                            // TextField(),

                              TextField( decoration: InputDecoration(labelText: 'Title'),
                              //onChanged: (value){ titleInput = value;  },
                               
                               controller: titleController,
                                onSubmitted: (_) => _submitData(),
                               
                               ),
                              TextField( decoration: InputDecoration(labelText: 'Amount'),
                              // onChanged: (value){amountInput = value;},
                              controller: amountController,
                              keyboardType: TextInputType.number,

                                onSubmitted: (_) => _submitData(),

                               ),

                               Container(
                                 height: 60,
                                 child: Row(
                                   children: [
                                    
                                     Expanded(child: Text(_selectedDate == null ? 'No date chosen!!' : DateFormat.yMMMd().format(_selectedDate))),

                                     TextButton(child: Text('Choose Date', style: TextStyle(fontWeight: FontWeight.bold),),
                                     
                                     style: TextButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                      ),
                                     
                                     onPressed:_presentDatePicker,

                                     ),


                                   ],
                                 ),
                               ),


                              ElevatedButton(
                              
                              child: Text('Add Transaction'),


                                     style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        // onPrimary: Theme.of(context).textTheme.button,
                                        onPrimary: Colors.white,
                                      ),


                              onPressed:() => _submitData(),

                              ),


                          ],


                        ),
                      ),
                      
                      
                      ),
    );
  }
}