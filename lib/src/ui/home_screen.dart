import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simple_employee_app/src/blocs/employee_bloc.dart';
import 'package:simple_employee_app/src/models/employee.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    employeeBloc.fetchAllEmployee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Employee App'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Employee>>(
          stream: employeeBloc.allEmployee,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData) {
              return _buildList(snapshot);
            } else {
              return Center(child: Text('data tdk ada'));
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.send),
        onPressed: () {
          Navigator.pushNamed(context, "/create_employee_screen");
        },
      ),
    );
  }

  Widget _buildList(AsyncSnapshot<List<Employee>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.fromLTRB(15, 12, 12, 15),
          child: Material(
            type: MaterialType.card,
            color: Colors.lightGreen,
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/detail_employee_screen", arguments: snapshot.data[index],);
              },
              child: ListTile(
                leading: Icon(MdiIcons.shieldAccount),
                trailing: Icon(MdiIcons.checkAll),
                title: Text(snapshot.data[index].employeeName),
                subtitle: Text(snapshot.data[index].employeeSalary),
              ),
            ),
          ),
        );
      },
    );
  }
}
