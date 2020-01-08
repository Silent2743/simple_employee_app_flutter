import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:simple_employee_app/src/helpers/url_helper.dart';
import 'package:simple_employee_app/src/models/employee.dart';
import 'package:simple_employee_app/src/models/employee_request.dart';

class EmployeeProvider {
  Client client = Client();

  Future<List<Employee>> fetchAllEmployee() async {
    final response = await client.get(ApiUrls.LIST_EMPLOYEE);
    if (response.statusCode == 200) {
      return compute(employeeFromJson, response.body);
    } else {
      print('failed to load data');
      return [];
    }
  }

  Future<EmployeeRequest> createEmployee(EmployeeRequest data) async {
    final response = await client.post(
      ApiUrls.CREATE_EMPLOYEE,
      body: employeeRequestToJson(data),
    );

    if (response.statusCode == 200) {
      return compute(employeeRequestFromJson, response.body);
    } else {
      print('failed to create data');
      return null;
    }
  }
}
