import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/material/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  State<Expenses> createState(){
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      context: context, 
      builder: (ctx) => NewExpense(onAddExpense: _addExpense,),
      isScrollControlled: true,
    );
  }

  void _addExpense(Expense expense)
  {
    setState(() {
      _registereExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){
    int expenseIndex = _registereExpenses.indexOf(expense);    
    setState(() {
      _registereExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Expense Deleted'),
      duration: Duration(seconds: 4),
      action: SnackBarAction(label: 'Undo', onPressed: (){
       setState(() 
       {_registereExpenses.insert(expenseIndex,expense);
       });
      }),
      )
    );
  }
  final List <Expense> _registereExpenses = [
    Expense(
      title: "Cheeseburger", 
      amount: 12.45, 
      date: DateTime.now(), 
      category: Category.Food), Expense(title: "Pizza", amount: 5.00, date: DateTime.now(), category: Category.Food)
  ];
  
    @override
    Widget build(BuildContext context){
      Widget mainContent = const Center(child: Text('Click the + button to add an expense'),);

      if(_registereExpenses.isNotEmpty){
        mainContent = ExpensesList(expenses: _registereExpenses, onRemoveExpense: _removeExpense,);
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Column(
          children: [
            Chart(expenses:_registereExpenses),
            Expanded(child: mainContent,),
          ],
        )
      );
    }
  }