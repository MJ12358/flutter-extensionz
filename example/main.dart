import 'package:flutter/material.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      localizationsDelegates:
          FlutterExtensionzLocalizations.localizationsDelegates,
      restorationScopeId: 'app',
      supportedLocales: FlutterExtensionzLocalizations.supportedLocales,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final String text = context.flutterExtensionzLocalizations.accept;

    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () => context.showSnackBar(Text(text)),
          icon: const Icon(Icons.home),
        ),
      ),
    );
  }
}
