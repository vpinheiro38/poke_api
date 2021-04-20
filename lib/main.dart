import 'package:flutter/material.dart';
import 'poke_view.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke API',
      home: PokeView(),
    );
  }
}
