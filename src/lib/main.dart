import 'package:flutter/material.dart';
import 'package:flutter_mpc/features/main/presentation/login_page.dart';
import 'styles/theme.dart';
import 'styles/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Open Sans", "Open Sans");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Flutter MPC Demo',
      themeMode: ThemeMode.system,
      theme: theme.light(),
      darkTheme: theme.dark(),
      home: const LoginPage(),
    );
  }
}
