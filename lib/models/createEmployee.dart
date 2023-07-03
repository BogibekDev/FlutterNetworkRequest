import 'dart:convert';

class CreateEmployee {
  String? status;
  Employeee? data;
  String? message;

  CreateEmployee({this.status, this.data, this.message});

  static CreateEmployee createEmployeeFromJson(String str) =>
      CreateEmployee.fromJson(json.decode(str));

  static String createEmployeeToJson(CreateEmployee data) =>
      jsonEncode(data.toJson());

  factory CreateEmployee.fromJson(Map<String, dynamic> json) => CreateEmployee(
        status: json["status"],
        data: Employeee.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class Employeee {
  String name;
  String salary;
  String age;
  int id;

  Employeee({
    required this.name,
    required this.salary,
    required this.age,
    required this.id,
  });

  factory Employeee.fromJson(Map<String, dynamic> json) => Employeee(
        name: json['name'],
        salary: json['salary'],
        age: json['age'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "salary": salary,
        "age": age,
        "id": id,
      };
}
