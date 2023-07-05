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
  double _price2 = 0.0;
  double _sum = 0.0;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchName().then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> _fetchName() async {
    setState(() {
      isLoading = true;
    });
    final username = 'admin';
    final password = 'Admin123';
      final authBasic =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    var headers = {
      'Authorization': authBasic,
    };
    try {
      final response2 = await http.get(Uri.parse('uri'), headers: headers);

      final response1 = await http.get(Uri.parse(
          'https://icare-student.dhis2.udsm.ac.tz/openmrs/ws/rest/v1/billing/invoice?patient=305997de-13b1-4e0e-8ec6-37927c5c7993'));
      print('Response status code: ${response1.statusCode}');
      print('Response headers: ${response1.headers}');

      if (response1.statusCode == 200) {
        final jsonData = json.decode(response1.body);
        // patientName = invoices[0]['patient']['name'];
        // _price = jsonData[0]["items"][0]["price"];
        // _price2 = jsonData[0]["items"][1]["price"];
        // double sum = _price + _price2;

        if (jsonData is List && jsonData.length > 0) {
          final data = jsonData[0];
          final items = data['items'];

          double sum = 0.0;

          for (var item in items) {
            double price = item['price'];
            sum += price;
          }

          print('Sum of prices: $sum');

          setState(() {
            _sum = sum;
          });
        } else {
          print('No data found');
        }

        setState(() {
          _name = jsonData[0]['patient']['name'];
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
          height: 200,
          child: Card(
            elevation: 2,
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Visit Description',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                color: Colors.indigoAccent,
                                height: 20,
                                width: 80,
                                child: Center(
                                    child: Text(
                                  'Results',
                                  style: TextStyle(color: Colors.white),
                                )),
                              )
                            ],
                          ),
                          Text('OPD'),
                          RichText(
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
                                  text:
                                      ' kadi namba 217201651 imetumia Shilingi ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: '${_sum}',
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
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
