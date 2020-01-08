// To parse this JSON data, do
//
//     final employeeRequest = employeeRequestFromJson(jsonString);

import 'dart:convert';

EmployeeRequest employeeRequestFromJson(String str) => EmployeeRequest.fromMap(json.decode(str));

String employeeRequestToJson(EmployeeRequest data) => json.encode(data.toMap());

class EmployeeRequest {
    String name;
    String salary;
    String age;
    String id;

    EmployeeRequest({
        this.name,
        this.salary,
        this.age,
        this.id,
    });

    factory EmployeeRequest.fromMap(Map<String, dynamic> json) => EmployeeRequest(
        name: json["name"],
        salary: json["salary"],
        age: json["age"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "salary": salary,
        "age": age,
        "id": id,
    };
}
