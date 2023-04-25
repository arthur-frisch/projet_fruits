import 'package:flutter/material.dart';
import 'package:projet_fruits/list_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pomme, poire et Ananas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _counterType = "Nombre";
  var items = List<ListItem>.generate(
    0,
    (i) => Item(i)
  );

  bool isPrime(int number) {
    for (var i = 2; i <= number / i; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  String getCounterType(int number) {
    return isPrime(number) && number != 1 ? "Nombre premier" : number % 2 == 0 ? "Nombre pair" : "Nombre impair";
  }

  void _incrementCounter() {
    setState(() {
      ++_counter;
      _counterType = getCounterType(_counter);
      items.add(Item(_counter));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("$_counter : $_counterType", style: const TextStyle(fontSize: 20),)),
      ),
      body: ListView.builder(
        itemCount: items.length, 
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: item.buildLine(context),
            tileColor: index % 2 == 0 ? Colors.cyan : Colors.indigo, 
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
