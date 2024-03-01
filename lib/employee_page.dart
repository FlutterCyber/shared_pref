import 'package:flutter/material.dart';

class EmployeePage extends StatefulWidget {
  static const String id = "employee_page";

  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User"),
      ),
    );
  }
}
