import 'package:flutter/material.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.showSnackBar(const Text('The snack bar text')),
      icon: const Icon(Icons.person),
    );
  }
}
