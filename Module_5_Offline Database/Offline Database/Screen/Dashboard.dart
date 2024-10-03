// // ignore_for_file: override_on_non_overriding_member

// import 'package:firstapp/Offline%20Database/Screen/AddStudent.dart';
// import 'package:firstapp/Offline%20Database/Student.dart';
// import 'package:firstapp/Offline%20Database/StudentService.dart';
// import 'package:flutter/material.dart';

// class MyDashboard extends StatefulWidget {
//   const MyDashboard({super.key});

//   @override
//   State<MyDashboard> createState() => _MyDashboardState();
// }

// class _MyDashboardState extends State<MyDashboard> {
//   List<Student> studentList = [];

//   var studentService = Studentservice();
//   var studentModel;

//   @override
//   void initstate() {
//     super.initState();
//     getRecordFromDb();
//   }

//   getRecordFromDb() async {
//     studentService = Studentservice();
//     var allStudents = await studentService.readService();
//     allStudents.forEach((student) {
//       studentModel = Student();
//       setState(() {
//         studentModel.id = student["id"];
//         studentModel.name = student["name"];
//         studentModel.subject = student["subject"];

//         studentList.add(studentModel);
//       });
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: ListView.builder(
//         itemCount: studentList.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               title: Text("${studentList[index].name}"),
//               subtitle: Text("${studentList[index].subject}"),
//               trailing: Wrap(
//                 children: [
//                   IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
//                   IconButton(
//                       onPressed: () async {
//                         var result = await studentService
//                             .deleteService(studentList[index]);
//                         print(result);
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => MyDashboard()));
//                       },
//                       icon: Icon(Icons.delete)),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => Addstudent()));
//           }),
//     );
//   }
// }

import 'package:firstapp/Offline%20Database/Screen/AddStudent.dart';
import 'package:firstapp/Offline%20Database/Screen/EditStudent.dart';
import 'package:firstapp/Offline%20Database/Student.dart';
import 'package:firstapp/Offline%20Database/StudentService.dart';
import 'package:flutter/material.dart';
// import 'package:myfirstproject/Database%20Example/Screen/addStudent.dart';
// import 'package:myfirstproject/Database%20Example/Student.dart';
// import 'package:myfirstproject/Database%20Example/StudentService.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  List<Student> studentList = [];

  var studentService = Studentservice();
  var studentModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecordFromDB();
  }

  getRecordFromDB() async {
    studentService = Studentservice();
    var allStudents = await studentService.readService();

    allStudents.forEach((student) {
      studentModel = Student();
      setState(() {
        studentModel.id = student['id'];
        studentModel.name = student['name'];
        studentModel.subject = student['subject'];

        studentList.add(studentModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("${studentList[index].name}"),
              subtitle: Text("${studentList[index].subject}"),
              trailing: Wrap(
                children: [
                  IconButton(
                      onPressed: () {
                        print("----------------->>>>${studentList[index].name}",);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Editstudent(student: studentList[index]),
                            ));
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () async {
                        var result = await studentService
                            .deleteService(studentList[index]);
                        print(result);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyDashboard(),
                            ));
                      },
                      icon: Icon(Icons.delete)),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addstudent(),
                ));
          }),
    );
  }
}
