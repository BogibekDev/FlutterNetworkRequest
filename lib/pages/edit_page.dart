import 'package:flutter/material.dart';

import '../data/remote/network.dart';
import '../models/employee.dart';
import '../utils/logger.dart';

class EditPage extends StatefulWidget {
  static const String id = "/editPage";

  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late var id;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Employee'),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: () {
              var employee = Employee(
                name: "Qummi",
                salary: "1254",
                age: "96",
                id: id,
              );
              _updateEmployee(employee);
            },
            child: Text("Edit"),
          ),
        ));
  }

  void _updateEmployee(Employee employee) {
    Network.PUT(Network.UPDATE + employee.id.toString(),
            Network.updateParams(employee))
        .then((response) => {Log.i(response.toString())});
  }
}
