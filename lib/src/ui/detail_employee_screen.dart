import 'package:flutter/material.dart';
import 'package:simple_employee_app/src/models/employee.dart';


class DetailEmployeeScreen extends StatefulWidget {
  @override
  _DetailEmployeeScreenState createState() => _DetailEmployeeScreenState();
}

class _DetailEmployeeScreenState extends State<DetailEmployeeScreen> {
     var nameController = TextEditingController();
     var ageCotroller = TextEditingController();
     var salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Employee employee =
     ModalRoute.of(context).settings.arguments;

    nameController.text = employee.employeeName;
    ageCotroller.text = employee.employeeAge;
    salaryController.text = employee.employeeSalary;

    

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Employee"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('ID : '),
                  Text('Name : '),
                ],
              ),
               Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Employee Name',
                ),
                
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                    controller: ageCotroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      // errorText: snapshot.error,
                    ),
                  )
               
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: salaryController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Salary',
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}