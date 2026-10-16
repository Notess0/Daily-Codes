import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Text('Decrease'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text('Increase'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
