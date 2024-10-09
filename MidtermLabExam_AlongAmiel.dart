import 'package:flutter/material.dart';

// Step 1: Identify the state (Already changed to stateless widget)
class Counter extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;
  // Step 4: Use a callback function
  const Counter({
    super.key,
    required this.counter,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: onIncrement, // Step 4: Call the callback
          child: const Text('Increment'),
        ),
        const SizedBox(width: 16),
        Text('Count: $counter'),
      ],
    );
  }
}

// Step 5: Update the parent widget
class CounterState extends StatefulWidget {
  const CounterState({super.key});
  //Step 3: Update the UI
  @override
  _CounterParentState createState() => _CounterParentState();
}

class _CounterParentState extends State<CounterState> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(
        counter: _counter, 
        onIncrement: _incrementCounter, 
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: CounterState(), 
      ),
    ),
  );
}
