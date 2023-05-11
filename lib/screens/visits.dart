import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _name = '';
  double _price = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchName();
  }

  Future<void> _fetchName() async {
    try {
      final response = await http.get(Uri.parse(
          'https://icare-student.dhis2.udsm.ac.tz/openmrs/ws/rest/v1/billing/invoice?patient=305997de-13b1-4e0e-8ec6-37927c5c7993'));
      print('Response status code: ${response.statusCode}');
      print('Response headers: ${response.headers}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        // patientName = invoices[0]['patient']['name'];
        setState(() {
          _name = jsonData[0]['patient']['name'];
          _price = jsonData[0]["items"][0]["price"];
        });
      } else {
        // Handle the error
        print('Failed to load name');
      }
    } catch (e) {
      // Handle the exception
      print('Exception occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visits details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 150,
          child: Card(
            elevation: 2,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: 'Habari, ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${_name}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' kadi namba **** imetumia Shilingi ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: '${_price}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      // kwa huduma za matibabu katika kituo cha UDSM Health Centre tarehe 09/5/2023. Kama taarifa hizi sio sahihi piga namba 0800110063 bure kutoa taarifa NHIF.
                      TextSpan(
                        text:
                            ''' kwa huduma za matibabu katika kituo cha UDSM Health Centre tarehe 09/5/2023. Kama taarifa hizi sio sahihi piga namba 0800110063 bure kutoa taarifa NHIF.''',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
