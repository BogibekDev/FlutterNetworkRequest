import 'dart:convert';

class DeleteEmployee {
  String? status;
  String? message;

  DeleteEmployee({this.status, this.message});

  static DeleteEmployee deleteEmployeeFromJson(String json) =>
      DeleteEmployee.fromJson(jsonDecode(json));

  static String deleteEmployeeToJson(DeleteEmployee data) =>
      jsonEncode(data.toJson());

  factory DeleteEmployee.fromJson(Map<String, dynamic> json) => DeleteEmployee(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
