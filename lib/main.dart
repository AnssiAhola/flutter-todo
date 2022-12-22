import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/views/screens/todos_screen.dart';

// Base on https://www.youtube.com/watch?v=K4P5DZ9TRns

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: GestureDetector(
        // Dismisses keyboard when clicking outsite of it
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: const TodosScreen(),
      ),
    );
  }
}
