import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './new_transaction.dart';
import './trasaction_list.dart';
import './chart.dart';
import '../models/trasnaction.dart';
import 'package:intl/intl.dart';

//void main() => runApp(MyApp());     // One line function

void main() {
  // This sis to lock or fix the orientation of app on screen
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([
  //  DeviceOrientation.portraitUp,
  //  DeviceOrien   ADStation.portraitDown,
  //]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];
  bool _showChart = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime choosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: choosenDate,
      id: DateTime.now().toString(),
    );
    print(newTx.id + " thi is id ");
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
      backgroundColor: Colors.blue.shade800,
    );
  }

  Widget _buildLandscape() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Show Chart'),
        Switch(
            value: _showChart,
            onChanged: (val) {
              setState(() {
                _showChart = val;
                //print(_showChart);
              });
            })
      ],
    );
  }

  List<Widget> _buildPortrait(
      MediaQueryData mediaQuery, AppBar appBAR, Widget txListWidget) {
    return [
      Container(
        height: (mediaQuery.size.height -
                appBAR.preferredSize.height -
                mediaQuery.padding.top) *
            0.3,
        child: Chart(_recentTransactions),
      ),
      txListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape =
        mediaQuery.orientation == Orientation.landscape; // it is bool
    final appBAR = AppBar(
      title: Text(
        'Personal Expenses',
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
    );
    final txListWidget = Container(
      height: (mediaQuery.size.height - appBAR.preferredSize.height) * 0.6,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );
    return Scaffold(
      appBar: appBAR,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape) _buildLandscape(),
            if (!isLandscape)
              ..._buildPortrait(mediaQuery, appBAR,
                  txListWidget), // Here ... spread operator used (JavaScript) to get elements from inner list and put them as individual elememts in Parent List

            if (isLandscape)
              _showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBAR.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.4,
                      child: Chart(_recentTransactions),
                    )
                  : txListWidget,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
    );
  }
}

/* import 'package:flutter/material.dart';
import './new_transaction.dart';
import '../models/trasnaction.dart';
import './chart.dart';
import 'trasaction_list.dart';
import './chart_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: (' Flutter App'),
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.blue,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final itemnameController = TextEditingController();
  //final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    //Transaction(
    //  id: 't1',
    //  name: 'fruits',
    //  amount: 200,
    //  date: DateTime.now(),
    //),
    //Transaction(
    //  id: 't2',
    //  name: 'grocery',
    //  amount: 500,
    //  date: DateTime.now(),
    //)
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String itemName, double amountQty) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        name: itemName,
        amount: amountQty,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _getTextField(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '\$ Expense Manager \$',
          textAlign: TextAlign.right,
          style: TextStyle(fontFamily: 'Quicksand'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _getTextField(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _getTextField(context),
      ),
    );
  }
}

/*

Container(
        height: 500,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(3),
              width: double.infinity,
              height: 60,
              child: Card(
                child: Text(
                  'Transaction Chart',
                  textAlign: TextAlign.center,
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToLastDescent: false),
                  textScaleFactor: 3,
                ),
                elevation: 10,
                borderOnForeground: true,
              ),
            ),

*/
 */
