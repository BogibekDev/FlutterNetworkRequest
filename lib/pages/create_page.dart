import 'package:flutter/material.dart';
import 'package:network_request/data/remote/network.dart';
import 'package:network_request/models/employee.dart';

class CreatePage extends StatefulWidget {
  static const String id = "/createPage";

  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            createEmployee();
          },
          child: const Text("Create Employee"),
        ),
      ),
    );
  }

  void createEmployee() async {
    setState(() {
      isLoading = true;
    });
    var emp = Employee(name: "Azamatjon", salary: "1504", age: "26");

    var request = await Network.POST(Network.CREATE, Network.createParams(emp));
    if (request != null) {
      setState(() {
        isLoading = false;
        Navigator.pop(context);
      });
    } else {
      isLoading = false;
    }
  }
}
