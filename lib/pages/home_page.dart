import 'package:flutter/material.dart';
import 'package:network_request/data/remote/network.dart';
import 'package:network_request/utils/logger.dart';

import '../models/employee.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    var employee = Employee(
      name: "Azamat",
      salary: "\$20000",
      age: "56",
      id: 719,);
    // _getAllEmployees();
    // _createEmployee(employee);
    // _updateEmployee(employee);
    _deleteEmployee(employee);
  }

  void _getAllEmployees() {
    Network.GET(Network.EMPLOYEES_LIST, Network.emptyParams())
        .then((response) =>
    {
      Log.i(response.toString()),
    });
  }

  void _createEmployee(Employee employee) {
    Network.POST(Network.CREATE, Network.createParams(employee)).then(
          (response) =>
      {
        Log.i(response.toString()),
      },
    );
  }

  void _updateEmployee(Employee employee) {
    Network.PUT(Network.UPDATE + employee.id.toString(),
        Network.updateParams(employee))
        .then((response) => {Log.i(response.toString())});
  }

  void _deleteEmployee(Employee employee) {
    Network.DEL(Network.UPDATE + employee.id.toString(), Network.emptyParams())
        .then((response) => {Log.i(response.toString())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home "),
      ),
    );
  }
}
