import 'package:rxdart/rxdart.dart';
import 'package:simple_employee_app/src/helpers/validators.dart';
import 'package:simple_employee_app/src/models/employee.dart';
import 'package:simple_employee_app/src/resource/repository/employee_repository.dart';

class EmployeeBloc extends Object with Validators{
  final _employeeRepository = EmployeeRepository();
  final _employeeFetcher = PublishSubject<List<Employee>>();

  final _employeeName = BehaviorSubject<String>();
  final _age = BehaviorSubject<String>();
  final _salary = BehaviorSubject<String>();

  Function(String) get employeeNameChanged=>_employeeName.sink.add;
  Function(String) get employeeAgeChanged=>_age.sink.add;
  Function(String) get employeeSalaryChanged=>_salary.sink.add;

  Stream<List<Employee>> get allEmployee => _employeeFetcher.stream;

  fetchAllEmployee() async {
    var employees = await _employeeRepository.fetchAllEmployee();
    _employeeFetcher.sink.add(employees);
  }

  createEmployee() async {
    var employee = await _employeeRepository.createEmployee(
    _employeeName.value, 
    _age.value, 
    _salary.value);
    return employee;
  }

  void dispose() {
    _employeeFetcher.close();
    _employeeName.close();
    _age.close();
    _salary.close();
  }

  Stream<String> get employeeAge => _age.stream.transform(ageValidator); 
}

final employeeBloc = EmployeeBloc();
