

import 'package:flutter/material.dart';
import 'package:simple_employee_app/src/ui/create_employee_screen.dart';
import 'package:simple_employee_app/src/ui/detail_employee_screen.dart';
import 'package:simple_employee_app/src/ui/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context)=>HomeScreen(),
        '/detail_employee_screen' : (context)=>DetailEmployeeScreen(),
        '/create_employee_screen' : (context)=>CreateEmployeeScreen(),
        },
    );
  }
}

