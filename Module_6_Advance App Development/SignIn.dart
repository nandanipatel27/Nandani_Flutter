import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Custom%20Widget/Mycustomwidget.dart';
import 'package:flutter_firebase/Dashboard%20.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> userLogin(
    String? email,
    String? password,
  ) async {
    try {
      // it will store data in Authentication
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);

      User? user = userCredential.user;

      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(user: user,),
            ));
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Sign In Failed"),
            content: Text("$e"),
            actions: [
              ElevatedButton(
                  onPressed: () {
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
        // leading: IconButton(onPressed: (){
          
        // }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text("SignIn Screen",style: TextStyle(color: Colors.white),),
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
                hinttext: "Enter Email",
                label: "Email"),
            SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: _passwordController,
             // hintText: "Enter Password",
              label: "Password", hinttext: 'Enter Password',
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                userLogin(_emailController.text.toString(),
                    _passwordController.text.toString());
              },
              child: Text(
                "Sign In",
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
