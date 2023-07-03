import 'package:flutter/material.dart';

import '../models/employee_responce.dart';

class DetailPage extends StatefulWidget {
  static const String id = "/detailPage";

  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final employee = ModalRoute.of(context)!.settings.arguments as Employee;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${employee.employeeName}(${employee.employeeAge})",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("${employee.employeeSalary}\$"),
          ],
        ),
      ),
    );
  }
}
