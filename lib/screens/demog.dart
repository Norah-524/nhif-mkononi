import 'package:flutter/material.dart';
import 'personalprofile.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PInfo extends StatefulWidget {
  const PInfo({super.key});

  @override
  State<PInfo> createState() => _PInfoState();
}

class _PInfoState extends State<PInfo> {
  double _name = 0.0;
  double _price = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchName();
  }

  Future<void> _fetchName() async {
    try {
      final response = await http.get(Uri.parse(
          'https://icare-student.dhis2.udsm.ac.tz/openmrs/ws/rest/v1/patient?identifier=LOY&v=full&limit=10'));
      print('Response status code: ${response.statusCode}');
      print('Response headers: ${response.headers}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        // patientName = invoices[0]['patient']['name'];
        setState(() {
          _name = jsonData[0]['person']['age'];
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

  Widget _buildSingleRow({String? title, IconData? icon, String? data}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white),
          child: Icon(
            icon,
            color: Colors.indigo,
            size: 20,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            title!,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          data!,
          //style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demographics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    _buildSingleRow(
                        title: 'Age', icon: Icons.numbers, data: '22'),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(),
                    SizedBox(
                      height: 8,
                    ),
                    _buildSingleRow(
                        title: 'Sex',
                        icon: Icons.settings_accessibility,
                        data: 'Male'),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(),
                    SizedBox(
                      height: 8,
                    ),
                    _buildSingleRow(
                        title: 'Height', icon: Icons.height, data: '180'),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(),
                    SizedBox(
                      height: 8,
                    ),
                    _buildSingleRow(
                        title: 'Weight',
                        icon: Icons.monitor_weight,
                        data: '65'),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    _buildSingleRow(
                        title: 'BMI', icon: Icons.scale, data: '20.1 Normal'),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
                child: Column(children: [
              SizedBox(
                height: 8,
              ),
              _buildSingleRow(
                  title: 'Target setting',
                  icon: FeatherIcons.settings,
                  data: ' '),
              SizedBox(
                height: 8,
              ),
            ])),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    _buildSingleRow(
                        title: 'Height unit',
                        icon: Icons.height_rounded,
                        data: 'cm'),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(),
                    SizedBox(
                      height: 8,
                    ),
                    _buildSingleRow(
                        title: 'Weight unit',
                        icon: FeatherIcons.star,
                        data: 'kg'),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(),
                    SizedBox(
                      height: 8,
                    ),
                    _buildSingleRow(
                        title: 'Distance unit',
                        icon: FeatherIcons.activity,
                        data: 'km'),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
