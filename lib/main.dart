import 'package:flutter/material.dart';

import 'core/injection/injection_container.dart';
import 'src/core/cache/hive/hive_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  InjectionContainer.configureDependencies();
  await HiveInit.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
