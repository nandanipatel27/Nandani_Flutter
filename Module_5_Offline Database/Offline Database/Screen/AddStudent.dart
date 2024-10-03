// import 'package:firstapp/Offline%20Database/Screen/Dashboard.dart';
// import 'package:firstapp/Offline%20Database/Student.dart';
// import 'package:firstapp/Offline%20Database/StudentService.dart';
// import 'package:flutter/material.dart';

// class AddStudent extends StatefulWidget {
//   const AddStudent({super.key});

//   @override
//   State<AddStudent> createState() => _AddStudentState();
// }

// class _AddStudentState extends State<AddStudent> {
//   TextEditingController _snameController = TextEditingController();
//   TextEditingController _subjectController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add Student"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _snameController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter Name",
//                 labelText: "Name",
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextField(
//               controller: _subjectController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter Subject",
//                 labelText: "Subject",
//               ),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   var student = Student();
//                   setState(() async {
//                     student.name = _snameController.text.toString();
//                     student.subject = _subjectController.text.toString();

//                     var studentservice = Studentservice();
//                     var result = await studentservice.insertService(student);
//                     print("------------------------> result $result");
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MyDashboard(),
//                         ));
//                   });
//                 },
//                 child: Text("Submit"))
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:firstapp/Offline%20Database/Screen/Dashboard.dart';
import 'package:firstapp/Offline%20Database/Student.dart';
import 'package:firstapp/Offline%20Database/StudentService.dart';
import 'package:flutter/material.dart';
// import 'package:myfirstproject/Database%20Example/Dashboard.dart';
// import 'package:myfirstproject/Database%20Example/Student.dart';
// import 'package:myfirstproject/Database%20Example/StudentService.dart';

class Addstudent extends StatefulWidget {
  const Addstudent({super.key});

  @override
  State<Addstudent> createState() => _AddstudentState();
}

class _AddstudentState extends State<Addstudent> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Student"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: "Enter Name",
              labelText: "Name",
            ),
          ),
          TextField(
            controller: _subjectController,
            decoration: InputDecoration(
              hintText: "Enter Subject",
              labelText: "Subject",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              var student = Student();

              setState(() async {
                student.name = _nameController.text.toString();
                student.subject = _subjectController.text.toString();

                var studentService = Studentservice();

                var result = await studentService.insertService(student);

                print("---- result $result");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyDashboard(),
                    ));
              });
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
