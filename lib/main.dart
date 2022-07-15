import 'package:change_password/password_requirement.dart';
import 'package:flutter/material.dart';
import 'password_checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const PasswordChecker(),
      home: const PasswordRequirement(),
    );
  }
}
