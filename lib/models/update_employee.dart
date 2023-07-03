import 'dart:convert';

class UpdateEmployee {
  String status;
  List<dynamic> data;
  String message;

  UpdateEmployee({
    required this.status,
    required this.data,
    required this.message,
  });

  static UpdateEmployee updateEmployeeFromJson(String str) =>
      UpdateEmployee.fromJson(json.decode(str));

  static String updateEmployeeToJson(UpdateEmployee data) =>
      json.encode(data.toJson());

  factory UpdateEmployee.fromJson(Map<String, dynamic> json) => UpdateEmployee(
        status: json["status"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x)),
        "message": message,
      };
}
