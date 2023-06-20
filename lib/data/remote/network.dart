import 'dart:convert';

import 'package:http/http.dart';

import '../../models/employee.dart';

class Network {
  static String BASE_URL = "dummy.restapiexample.com";

  // static Map<String, String> headers = {
  //   'Content-Type': 'application/json; charset=UTF-8'
  // };

  // routes
  static String EMPLOYEES_LIST = "/api/v1/employees";
  static String EMPLOYEE = "/api/v1/employee/"; //id
  static String CREATE = "/api/v1/create";
  static String UPDATE = "/api/v1/update/"; //id
  static String DELETE = "/api/v1/delete/"; //id

  //requests
  static Future<String?> GET(String route, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, route, params);
    var response = await get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String route, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, route);
    var response = await post(uri, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String route, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, route);
    var response = await put(uri, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 202) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String route, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, route, params);
    var response = await delete(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Map<String, String> emptyParams() => <String, String>{};

  static Map<String, String> createParams(Employee employee) {
    Map<String, String> params = {};
    params.addAll({
      "name": employee.name!,
      "salary": employee.salary!,
      "age": employee.age!,
    });
    return params;
  }

  static Map<String, String> updateParams(Employee employee) {
    Map<String, String> params = {};
    params.addAll({
      "name": employee.name!,
      "salary": employee.salary!,
      "age": employee.age!,
    });
    return params;
  }



}
