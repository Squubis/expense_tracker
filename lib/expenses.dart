import 'package:expense_tracker/expenses_list/expenses_list.dart';
import 'package:expense_tracker/material/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  State<Expenses> createState(){
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>
{
  final List <Expense> _registereExpenses = [
    Expense(title: "Cheeseburger", amount: 12.45, date: DateTime.now(), category: Category.food), Expense(title: "Pizza", amount: 5.00, date: DateTime.now(), category: Category.food)
  ];
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Column(
          children: [
            Text("Chart"), 
            Expanded(child: ExpensesList(expenses: _registereExpenses))
          ],
        )
      );
    }
  }