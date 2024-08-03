import 'package:flutter/material.dart';
import 'package:module4/Prg76_2.dart';

class Prg76 extends StatefulWidget {
  @override
  _Prg76State createState() => _Prg76State();
}

class _Prg76State extends State<Prg76> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();

  void _navigateToSecondScreen(BuildContext context) {
    final double? firstNumber = double.tryParse(_firstNumberController.text);
    final double? secondNumber = double.tryParse(_secondNumberController.text);

    if (firstNumber != null && secondNumber != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Prg76_2(
            sum: firstNumber + secondNumber,
          ),
        ),
      );
    } else {
      // Show an error message if the input is invalid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Please enter valid numbers.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'First Number',
              ),
            ),
            TextField(
              controller: _secondNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Second Number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToSecondScreen(context),
              child: Text('Calculate Sum'),
            ),
          ],
        ),
      ),
    );
  }
}
