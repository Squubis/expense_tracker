
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});
  
  @override
  State<NewExpense> createState() {
    
    return _NewExpenseState();
  }
  
}

class _NewExpenseState extends State<NewExpense>{
  final _titleController = TextEditingController();
  final _budgetController = TextEditingController();
  @override
  void dispose(){
    _titleController.dispose();
    _budgetController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.all(16) ,
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),
          TextField(
            controller: _budgetController,
            maxLength: 50,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixText: '\$',
              label: Text('Cost')
            ),
          ),
          Row(children: [
            ElevatedButton(onPressed: (){print(_titleController.text); print(_budgetController.text);}, child: Text('Save Expense'),)
          ],)
        ],
      )
    );
  }
  
}