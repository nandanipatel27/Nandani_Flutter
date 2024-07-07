import 'package:flutter/material.dart';

class Prg51_52 extends StatefulWidget {
  const Prg51_52({super.key});

  @override
  State<Prg51_52> createState() => _Prg51_52State();
}

class _Prg51_52State extends State<Prg51_52> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  String _selectedOperation='Add';
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextField Example"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: firstNumberController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Enter Number',
              labelText: 'First Number',
            ),
            style: TextStyle(color: Colors.black,fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: secondNumberController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Second Number',
              labelText: 'Second Number',
              hintStyle: TextStyle(color: Colors.black),
            ),
            style: const TextStyle(color: Colors.black,fontSize: 20),
          ),
          Row(
            children: [
              Radio<String>(
                value: "Add",
                groupValue: _selectedOperation,
                onChanged: (value) {
                  setState(() {
                    _selectedOperation = value!;
                  });
                },
              ),
              Text("Add"),
            ],
          ),
          Row(
            children: [
              Radio<String>(
                value: "Subtract",
                groupValue: _selectedOperation,
                onChanged: (value) {
                  setState(() {
                    _selectedOperation = value!;
                  });
                },
              ),
              Text("Subtract"),
            ],
          ),
          Row(
            children: [
              Radio<String>(
                value: "Multiply",
                groupValue: _selectedOperation,
                onChanged: (value) {
                  setState(() {
                    _selectedOperation = value!;
                  });
                },
              ),
              Text("Multiply"),
            ],
          ),
          Row(
            children: [
              Radio<String>(
                value: "Divide",
                groupValue: _selectedOperation,
                onChanged: (value) {
                  setState(() {
                    _selectedOperation = value!;
                  });
                },
              ),
              Text("Divide"),
            ],
          ),

          ElevatedButton(
              onPressed: () {
                setState(() {
                  _calculate();
                });
              },
              child: const Text("Calculate")),
          Text("Answer is: ${result.toString()}",style: TextStyle(fontSize: 26),)
        ],
      ),
    );
  }
  void _calculate() {
    double num1 = double.tryParse(firstNumberController.text) ?? 0;
    double num2 = double.tryParse(secondNumberController.text) ?? 0;

    switch (_selectedOperation) {
      case "Add":
        result = num1 + num2;
        break;
      case "Subtract":
        result = num1 - num2;
        break;
      case "Multiply":
        result = num1 * num2;
        break;
      case "Divide":
        result = num1 / num2;
        break;
      default:
        result = 0;
    }

    setState(() {
    });
  }

}

