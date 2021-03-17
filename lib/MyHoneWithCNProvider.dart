import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final counterProviderWithCNProvider = ChangeNotifierProvider((ref) => CounterNotifier());

class CounterNotifier with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}

class MyHomeWithChangeNotifierProvider extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final int count = useProvider(counterProviderWithCNProvider).count;
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Introduction'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(counterProviderWithCNProvider).increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}