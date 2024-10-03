import 'package:flutter/material.dart';
import 'package:flutter_firebase/Custom%20Widget/Mycustomwidget.dart';
import 'package:flutter_firebase/SignIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? profilePicUrl =
      "https://img.freepik.com/free-photo/user-front-side-with-white-background_187299-40007.jpg";

  Future<void> registerUser(
    String? username,
    String? email,
    String? password,
  ) async {
    try {
      // it will store data in Authentication
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);

      User? user = userCredential.user;

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .set({"email": email, "name": username, "profilePic": profilePicUrl});
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignInScreen(),
            ));
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Registration Failed"),
            content: Text("$e"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    _usernameController.clear();
                    _emailController.clear();
                    _passwordController.clear();

                    Navigator.pop(context);
                  },
                  child: Text("Ok")),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Screen",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal[600],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
                controller: _emailController,
                hinttext: "Enter email",
                label: "Email"),
            SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: _usernameController,
                hinttext: "Enter Username",
                label: "Username"),
            SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: _passwordController,
              hinttext: "Enter Password",
              label: "Password",
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                registerUser(
                    _usernameController.text.toString(),
                    _emailController.text.toString(),
                    _passwordController.text.toString());
              },
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.teal.shade600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
