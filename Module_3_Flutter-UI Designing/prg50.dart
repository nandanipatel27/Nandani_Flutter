import 'package:flutter/material.dart';

class Prg50 extends StatefulWidget {
  const Prg50({super.key});

  @override
  State<Prg50> createState() => _Prg50State();
}

class _Prg50State extends State<Prg50> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _reverseController = TextEditingController();

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
            controller: _userController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Enter Number',
              labelText: 'Number',
            ),
            style: TextStyle(color: Colors.black,fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _reverseController.text = "";
                  for (int i = _userController.text.length - 1; i >= 0; i--) {
                    _reverseController.text =
                        _reverseController.text + _userController.text[i];
                  }
                });
              },
              child: const Text("Reverse")),
          TextField(
            enabled: false,
            controller: _reverseController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Reversed Number',
              labelText: 'Reversed Number',
              hintStyle: TextStyle(color: Colors.black),
            ),
            style: const TextStyle(color: Colors.black,fontSize: 20),
          ),
        ],
      ),
    );
  }
}
