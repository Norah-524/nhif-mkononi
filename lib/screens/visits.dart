import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nhif_app/models/visit_details.dart';

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
  String date1 = '';
   String date2 = '';

  List<Map<String, dynamic>> results = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchName();
    _fetchName1().then((value) {
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

    final response = await http.get(
        Uri.parse(
            'https://icare-student.dhis2.udsm.ac.tz/openmrs/ws/rest/v1/visit?includeInactive=true&patient=305997de-13b1-4e0e-8ec6-37927c5c7993&v=custom%3A(uuid%2CvisitType%2Clocation%3A(uuid%2Cdisplay%2Ctags%2CparentLocation%3A(uuid%2Cdisplay))%2CstartDatetime%2Cattributes%2CstopDatetime%2Cpatient%3A(uuid%2Cdisplay%2Cidentifiers%2Cperson%2Cvoided)%2Cencounters%3A(uuid%2Cform%2Clocation%2Cobs%3A(accessionNumber%2CobsDatetime%2Ccomment%2Cconcept%3A(uuid%2Cdisplay%2Cunits%2ClowNormal%2ChiNormal%2CsetMembers%3A(uuid%2Cdisplay%2Cunits%2ClowNormal%2ChiNormal))%2Cdisplay%2Cencounter%2CgroupMembers%2Corder%2Cperson%2Cuuid%2Cvalue%2CvalueCodedName%2CvalueModifier%2Cvoided)%2Corders%2Cdiagnoses%2CencounterProviders%2CencounterDatetime%2CencounterType%2Cvoided%2CvoidReason))'),
        headers: headers);
    print('Response status code: ${response.statusCode}');
    print('Response headers: ${response.headers}');
    //final visit = visitDetailsToJson(response.body as VisitDetails);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data['results'][1]['startDatetime']);

      setState(() {
        date1 = data['results'][1]['startDatetime']; 
        date2 = data['results'][0]['startDatetime']; 
      });
    } else {
      // Handle the error
      print('Failed to load name');
    }
  }

  Future<void> _fetchName1() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response1 = await http.get(Uri.parse(
          'https://icare-student.dhis2.udsm.ac.tz/openmrs/ws/rest/v1/billing/invoice?patient=305997de-13b1-4e0e-8ec6-37927c5c7993'));
      print('Response status code: ${response1.statusCode}');
      print('Response headers: ${response1.headers}');

      if (response1.statusCode == 200) {
        final jsonData = json.decode(response1.body);

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
      body: Column(
        children: [
          vDetails(isLoading: isLoading, name: _name, sum: _sum, date: date1,),
          vDetails(isLoading: isLoading, name: _name, sum: _sum, date: date2,),
         
        ],
      ),
    );
  }
}

class vDetails extends StatelessWidget {
 final bool isLoading;
  final String _name;
  final double _sum;
  final String date1;
  String date2;

  vDetails({
    Key? key,
    required this.isLoading,
    required String name,
    required double sum,
    required String date,
  })  : _name = name,
        _sum = sum,
        date1 = date,
        date2 = date;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                              decoration: BoxDecoration(
                                shape: BoxShape.circle
                              ),
                              
                              height: 20,
                              width: 20,
                              child: Center(
                                  child: Text(
                                '',
                                style: TextStyle(color: Colors.white),
                              )),
                            )
                          ],
                        ),
                        Text('OPD Services'),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            text: 'Habari, ',
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: '$_name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' kadi namba 109234567234 imetumia Shilingi ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: '$_sum',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              // kwa huduma za matibabu katika kituo cha UDSM Health Centre tarehe 09/5/2023. Kama taarifa hizi sio sahihi piga namba 0800110063 bure kutoa taarifa NHIF.
                              TextSpan(
                                text:
                                    ''' kwa huduma za matibabu katika kituo cha UDSM Health Centre tarehe ${date1}. Kama taarifa hizi sio sahihi piga namba 0800110063 bure kutoa taarifa NHIF.''',
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
    );
  }
}
