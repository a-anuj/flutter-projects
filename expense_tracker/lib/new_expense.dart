import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();

  }
}

class _NewExpenseState extends State<NewExpense>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;


  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year-1,now.month,now.day);
    final _pickedDate = await showDatePicker(
        context: context,
        initialDate:now ,
        firstDate: firstDate,
        lastDate: now
    );
    setState(() {
      _selectedDate = _pickedDate;
    });
  }

  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount<0;
    if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null){
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Invalid Input"),
            content: Text("Make sure you have entered all the values."),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: Text("Okay")
              )
            ],
          )

      );
      return ;
    }
  }
  
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: InputDecoration(
                  label: Text("Title")
              ),
            ),
            Row(
              children: [
                Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixText: "₹ ",
                      label: Text("Amount")
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_selectedDate == null ? "No Date Selected" : formatter.format(_selectedDate!)),
                      IconButton(
                          onPressed: _presentDatePicker,
                          icon: Icon(Icons.calendar_month)
                      )
                    ],
                  )
              )
              ]
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                    items: Category.values
                        .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name.toUpperCase()),
                            )
                    ).toList(),
                    onChanged: (value) {
                        if(value==null){
                          return ;
                        }
                        setState(() {
                          _selectedCategory = value;
                        });
                    }
                ),
                const Spacer(),
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Close")
                ),
                ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: Text("Save Expense")
                ),

              ],
            )
          ],
        ),

    );

  }
}