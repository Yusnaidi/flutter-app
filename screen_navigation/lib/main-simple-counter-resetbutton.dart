import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Apps',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Simple Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Counter value: ',
                  style: TextStyle(fontSize: 35.0),
                ),
                Text(
                  '$_counter',
                  //style: Theme.of(context).textTheme.headline4,
                  style: TextStyle(fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                ),
              ],
            ),
          ),
        ),
          SizedBox(
            height: 20,
          ),
        Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment counter',
                child: Icon(Icons.add, color: Colors.white,),
                backgroundColor: Colors.green,),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement counter',
                child: Icon(Icons.remove, color: Colors.white,),
                backgroundColor: Colors.green,),
              SizedBox(
                width: 20,
              ),
              RaisedButton(child: Text('Reset',
                                    style: TextStyle(fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.green,
                                    color: Colors.white),
                                  ),
                           onPressed: _resetCounter,
                           color: Colors.green,),

            ],
          ),
        ),
      ),
    ],
      ),
    );
  }
}
