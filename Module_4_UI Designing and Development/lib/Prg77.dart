import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlExample extends StatefulWidget {
  const UrlExample({super.key});

  @override
  State<UrlExample> createState() => _UrlExample2State();
}

class _UrlExample2State extends State<UrlExample> {

  Future<void> myPhoneCall(String? phonenumber) async 
  {
    Uri phoneuri = Uri(scheme: "tel", path: phonenumber!);
    if (await canLaunchUrl(phoneuri)) {
      await launchUrl(phoneuri);
    }
  }

  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Call"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(
                hintText: "Phone Number", labelText: 'Phone Number'),
          ),
          ElevatedButton(
              onPressed: () {
                myPhoneCall(_phoneController.text.toString());
              },
              child: Text('Call'))
        ],
      ),
    );
  }
}
