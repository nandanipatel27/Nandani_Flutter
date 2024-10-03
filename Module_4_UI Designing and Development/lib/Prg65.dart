import 'package:flutter/material.dart';


class Prg65 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Alert Dialog'),
                content: Text('Do you want to Exit?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('You clicked No')),
                      );
                    },
                    child: Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('You clicked Yes')),
                      );
                    },
                    child: Text('Yes'),
                  ),
                ],
              ),
            );
          },
          child: Text('Click to Exit'),
        ),
      ),
    );
  }
}
