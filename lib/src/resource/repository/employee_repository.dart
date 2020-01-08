import 'package:simple_employee_app/src/models/employee.dart';
import 'package:simple_employee_app/src/models/employee_request.dart';
import 'package:simple_employee_app/src/resource/provider/employee_provider.dart';

class EmployeeRepository {
  final _employeeProvider = EmployeeProvider();

  Future<List<Employee>> fetchAllEmployee() async{
    var listEmployee = await _employeeProvider.fetchAllEmployee();
    listEmployee.sort(
      (a, b)=> b.id.compareTo(a.id)
      );
      return listEmployee;
  }

  Future<EmployeeRequest> createEmployee(
    String name,
    String age,
    String salary,
  ) {
    var data = EmployeeRequest(
      name: name,
      age: age,
      salary: salary,
    );
    return _employeeProvider.createEmployee(data);
  }
}
