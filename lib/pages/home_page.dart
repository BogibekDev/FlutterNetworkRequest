import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:network_request/data/remote/network.dart';
import 'package:network_request/models/employee_responce.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;
  var employees = [];

  @override
  void initState() {
    super.initState();

    _getAllEmployees();
  }

  void _getAllEmployees() async {
    setState(() {
      isLoading = true;
    });
    var response =
        await Network.GET(Network.EMPLOYEES_LIST, Network.emptyParams());
    if (response != null) {
      setState(() {
        isLoading = false;
        employees = EmployeeResp.employeeRespFromJson(response).data!;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  // void _createEmployee(Employee employee) {
  //   Network.POST(Network.CREATE, Network.createParams(employee)).then(
  //     (response) => {
  //       Log.i(response.toString()),
  //     },
  //   );
  // }
  //
  // void _updateEmployee(Employee employee) {
  //   Network.PUT(Network.UPDATE + employee.id.toString(),
  //           Network.updateParams(employee))
  //       .then((response) => {Log.i(response.toString())});
  // }
  //
  // void _deleteEmployee(Employee employee) {
  //   Network.DEL(Network.UPDATE + employee.id.toString(), Network.emptyParams())
  //       .then((response) => {Log.i(response.toString())});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, index) {
              return itemEmployees(employees[index]);
            },
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget itemEmployees(Employee employee) {
    return Column(
      children: [
        Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {},
                flex: 1,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete_forever,
                label: "Delete",
              ),
              SlidableAction(
                onPressed: (BuildContext context) {},
                flex: 1,
                backgroundColor: Colors.yellowAccent,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: "Delete",
              ),
            ],
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),
        ),
      ],
    );
  }
}
