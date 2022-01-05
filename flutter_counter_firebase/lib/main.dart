import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //int _counter = 0;

  int reset = 0;
  CollectionReference DB = FirebaseFirestore.instance.collection('counterDB');




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Counter App'),
      ),
      // Using StreamBuilder to display counter value from Firestore in real-time
      body: StreamBuilder(
        stream: DB.snapshots(),

        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {

          if (streamSnapshot.hasData) {
            return ListView.builder( //return for 'streamSnapshot.hasData'
              itemCount: streamSnapshot.data!.docs.length,

              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                return Column( //return for 'itemBuilder'
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                    ),
                    Container(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Counter value: ',
                              style: TextStyle(fontSize: 35.0),
                            ),
                            Text(
                              documentSnapshot['ctrVal'].toString(),
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
                              onPressed: (){ DB.doc('ctrTbl').update(
                                  {"ctrVal": FieldValue.increment(1)});},
                              tooltip: 'Increment counter',
                              child: Icon(Icons.add, color: Colors.white,),
                              backgroundColor: Colors.green,),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: (){DB.doc('ctrTbl').update(
                                  {"ctrVal": FieldValue.increment(-1)});},
                              tooltip: 'Decrement counter',
                              child: Icon(Icons.remove, color: Colors.white,),
                              backgroundColor: Colors.green,),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              child: Text("Reset"),
                              onPressed: (){DB.doc('ctrTbl').update(
                                  {"ctrVal": reset});},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                                onPrimary: Colors.black45,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                textStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }, //itemBuilder

            );
          }

          return Center( //return for 'builder'
            child: CircularProgressIndicator(),
          );

        }, //builder

      ),

    );
  } //Widget build()
}