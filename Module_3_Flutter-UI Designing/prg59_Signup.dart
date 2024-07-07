import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Signup Form'),
          centerTitle: true,
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Form(
    key: _formKey,
    child: Column(
    children:[
    TextFormField(
    controller: _nameController,
    decoration: const InputDecoration(
    labelText: 'Name',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter your name';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _emailController,
    decoration: const InputDecoration(
    labelText: 'Email',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter your email';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'Please enter a valid email address';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _passwordController,
    decoration: const InputDecoration(
    labelText: 'Password',
    ),
    obscureText: true,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter your password';
    } else if (value.length < 6) {
    return 'Password must be at least 6 characters long';
    }
    return null;
    },
    ),
    const SizedBox(height: 20),
    ElevatedButton(
    onPressed: () {

    },

  child

      :

  const Text

  (

  'Submit'),
  ),
  ],
  ),
  )

  ,

  )

  ,

  );
}}
