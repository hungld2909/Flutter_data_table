import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget bodyData() => DataTable(
    onSelectAll: (b){},
    sortColumnIndex:1,
    sortAscending: true,
    columns: <DataColumn>[
      DataColumn(
        label: Text("First Name"),
        numeric: false,
        onSort: (i,b){
          print("$i $b");
          setState(() {
            names.sort((a,b)=> a.firstName.compareTo(b.firstName));
          });
        },
        tooltip: "To display first name of the name"
      ),
         DataColumn(
        label: Text("Last Name"),
        numeric: false,
        onSort: (i,b){
          print("$i $b");
          setState(() {
            names.sort((a,b)=> a.lastName.compareTo(b.lastName));
          });
        },
        tooltip: "To display last name of the name"
      ),
    ],
   rows: names.map((name) => DataRow(cells: [
     DataCell(Text(name.firstName),showEditIcon: false,placeholder: false),
      DataCell(Text(name.lastName),showEditIcon: false,placeholder: false),

   ])).toList());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Table"),
      ),
      body: Container(
        child: bodyData(),
      ),
    );
  }
}

class Name {
  String firstName;
  String lastName;
  Name({this.firstName, this.lastName});
}

var names = <Name>[
  Name(firstName: "LD", lastName: "Hung"),
  Name(firstName: "Thuy", lastName: "aOcc"),
  Name(firstName: "Cuong", lastName: "Sc"),
];
