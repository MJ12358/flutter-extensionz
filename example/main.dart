import 'package:flutter/material.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () => context.showSnackBar(const Text("I'm a snackbar!")),
          icon: const Icon(Icons.home),
        ),
      ),
    );
  }
}
