import 'package:flutter/material.dart';
import 'package:simple_employee_app/src/blocs/employee_bloc.dart';


class CreateEmployeeScreen extends StatefulWidget {
  @override
  _CreateEmployeeScreenState createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Add Employee'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(onChanged: employeeBloc.employeeNameChanged,
                decoration: InputDecoration(
                  labelText: 'Employee Name'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: StreamBuilder<String>(
                stream: employeeBloc.employeeAge,
                builder: (context, snapshot) {
                  return TextFormField(
                    onChanged: employeeBloc.employeeAgeChanged,
                    decoration: InputDecoration(
                      labelText: 'Age', 
                      errorText: snapshot.error,
                      
                    ),
                  );
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                onChanged: employeeBloc.employeeSalaryChanged,
                decoration: InputDecoration(
                  labelText: 'Salary'
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: RaisedButton(
          color: Colors.green,
          child: Text('Save', style: TextStyle(
            color: Colors.white,
          )),
          onPressed: () async{
            var data = await employeeBloc.createEmployee();
            print(data);
            employeeBloc.fetchAllEmployee();
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
