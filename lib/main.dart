
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_counter_1/Counter.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CounterAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
int _counter = 0;
late Box<Counter> B_count;
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  @override
  void didChangeDependencies() async {
    B_count=await Hive.openBox("counter");
    _counter=B_count.get('v',defaultValue: Counter(0,0))!.count;
    setState(() {
      
    });
    super.didChangeDependencies();
  }

  void _incrementCounter()async  {
    B_count.put('v', Counter(0,++_counter));
    setState(()  {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${B_count.get('v',defaultValue: Counter(0,0))!.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          
            
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:_incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
