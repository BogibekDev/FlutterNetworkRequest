class Employee {
  String? name;
  String? salary;
  String? age;
  int? id;

  Employee({this.name, this.salary, this.age, this.id});

  Employee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    salary = json['salary'];
    age = json['age'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['salary'] = salary;
    data['age'] = age;
    data['id'] = id;
    return data;
  }
}
