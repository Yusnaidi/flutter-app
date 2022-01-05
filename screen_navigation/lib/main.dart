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
      initialRoute: '/',
      routes: {
        '/':  (context) => MyHomePage(),
        '/counter':  (context) => CounterRoute(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Counter"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Let\'s Count'),
          onPressed: () {
            Navigator.pushNamed(context, '/counter');
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.pinkAccent,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            textStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class CounterRoute extends StatefulWidget {
  //const CounterRoute({Key? key, required this.title}) : super(key: key);
  final String title = 'Home';

  @override
  State<CounterRoute> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CounterRoute> {
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
        backgroundColor: Colors.pinkAccent,
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
                                  color: Colors.pinkAccent),
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
                backgroundColor: Colors.pinkAccent,),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement counter',
                child: Icon(Icons.remove, color: Colors.white,),
                backgroundColor: Colors.pinkAccent,
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                child: Text("Reset"),
                onPressed: _resetCounter,
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  onPrimary: Colors.black45,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  textStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),


            ],
          ),
        ),
      ),
          SizedBox(
            height: 300,
          ),

          ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                textStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              icon: const Icon(Icons.home),
              label: const Text('Back'))
        ],
      ),
    );
  }
}

