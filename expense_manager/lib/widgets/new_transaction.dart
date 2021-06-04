import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx) {
    print(" Newtransaction CONSTRUCTOR WIDGET");
  }

  @override
  _NewTransactionState createState() {
    print("crateState widget");
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  _NewTransactionState() {
    print("Transsaction Constructor state");
  }

  @override
  void initState() {
    // Here, we can retirve data from database
    // load HTTP protocols
    print("initState()");
    super.initState();
    // Here, Flutter recommend to initiliase super.initState() at begining, BUT it affects only for Debugging
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    print("in didUpdateidget()");
    super.didUpdateWidget(oldWidget);
    // didUpdateWidget() is rarely used
    // it is used when there is change in parent state due to new addtional data from database
  }

  @override
  void dispose() {
    print("Dispose()");
    super.dispose();
    // it is used when data is coming through live server
    // if widget is NOT more required so get destroyed,
    // so information / data attached with That widget is NOT so required to store in memory, SO dispose()
  }

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context)
        .pop(); // To have window after on tap also while changing from 1 filedto other field
  }

  void _giveDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                // onChanged: (val) => amountInput = val,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Date NOT chosen !!!'
                          : DateFormat.yMMMEd().format(_selectedDate),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  FlatButton(
                    onPressed: _giveDatePicker,
                    child: Text(
                      'Choose date...',
                      style: TextStyle(fontSize: 15),
                    ),
                    textColor: Theme.of(context).textTheme.button.color,
                  ),
                ],
              ),
              RaisedButton(
                elevation: 20,
                focusElevation: 20,
                hoverElevation: 10,
                focusNode: FocusNode(descendantsAreFocusable: true),
                //focusColor: Colors.amberAccent,
                child: Text('Add Transaction'),
                textColor: Colors.yellow,
                color: Color.fromRGBO(210, 41, 80, 0.8),
                onPressed: submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final itemnameController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final itemname = itemnameController.text;
    final amounT = double.parse(amountController.text);
    print(itemname);

    if (itemname.isEmpty || amounT <= 0) {
      print("empty");
      return;
    }
    widget.addNewTx(itemname, amounT);
    Navigator.of(context).pop();
    print("added");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Item Name'),
              controller: itemnameController,
              onSubmitted: (_) => submitData,
              /* onChanged: (val) {
                      itemnameInput = val;
                    }, */
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
              //onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Colors.limeAccent,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
 */
