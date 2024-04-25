
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => Counter(),
    child: MyApp()
  )
);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample',
      home: CounterApp(),
      );
  }
}

class Counter with ChangeNotifier {
  int _number = 0;

  int get number => _number;

  void increment() {
    _number++;
    notifyListeners();
  }

  void decrement() {
    _number--;
    notifyListeners();
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(
        child: Consumer<Counter>(
          builder: (context, counter, _) => 
            Text('You have pressed the button ${counter.number} times.'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<Counter>(context, listen: false).decrement(),
        tooltip: 'Decrement Counter',
        child: const Icon(Icons.remove),
      ),
    );
  }
}
