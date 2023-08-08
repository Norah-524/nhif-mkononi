import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
//import 'package:nhif_app/models/visit_details.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MStatus extends StatefulWidget {
  const MStatus({super.key});

  @override
  State<MStatus> createState() => _MStatusState();
}

class _MStatusState extends State<MStatus> {
  // String ID = '';

  // bool isLoading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchName().then((_) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }

  // Future<void> _fetchName() async {
   
  //   final username = 'admin';
  //   final password = 'Admin123';

  //   final authBasic =
  //       'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  //   var headers = {
  //     'Authorization': authBasic,
  //   };
  //   try {
  //     final response = await http.get(
  //         Uri.parse(
  //             'https://icare-student.dhis2.udsm.ac.tz/openmrs/ws/rest/v1/visit?includeInactive=true&patient=305997de-13b1-4e0e-8ec6-37927c5c7993&v=custom%3A(uuid%2CvisitType%2Clocation%3A(uuid%2Cdisplay%2Ctags%2CparentLocation%3A(uuid%2Cdisplay))%2CstartDatetime%2Cattributes%2CstopDatetime%2Cpatient%3A(uuid%2Cdisplay%2Cidentifiers%2Cperson%2Cvoided)%2Cencounters%3A(uuid%2Cform%2Clocation%2Cobs%3A(accessionNumber%2CobsDatetime%2Ccomment%2Cconcept%3A(uuid%2Cdisplay%2Cunits%2ClowNormal%2ChiNormal%2CsetMembers%3A(uuid%2Cdisplay%2Cunits%2ClowNormal%2ChiNormal))%2Cdisplay%2Cencounter%2CgroupMembers%2Corder%2Cperson%2Cuuid%2Cvalue%2CvalueCodedName%2CvalueModifier%2Cvoided)%2Corders%2Cdiagnoses%2CencounterProviders%2CencounterDatetime%2CencounterType%2Cvoided%2CvoidReason))'),
  //         headers: headers);
  //     print('Response status code: ${response.statusCode}');
  //     print('Response headers: ${response.headers}');
  //     print('Response body: ${response.body}');
  //     if (response.statusCode == 200) {
  //       final vdata = json.decode(response.body);
  //       //final vdata = visitDetailsFromJson(response.body);
  //       print(vdata['results'][0]['attributes'][3]['display']);
  //       setState(() {
  //         ID = vdata['results'][0]['attributes'][3]['display'];
  //       });
  //     } else {
  //       // Handle the error
  //       print('Failed to load name');
  //     }
  //   } catch (e) {
  //     // Handle the exception
  //     print('Exception occurred: $e');
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Membership status'),
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: [
              buildCard(
                  title: "NHIF number", icon: FeatherIcons.creditCard, txt: '109234567234'
                  //ID
                  ),
              buildCard(
                  title: "Membership type",
                  icon: Icons.people,
                  txt: 'Student Package'),
              Card(
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  rangeStartDay:  DateTime.utc(2023, 10, 16),
                  rangeEndDay: DateTime.utc(2024, 10, 24),
                  headerStyle: HeaderStyle(
                      titleCentered: true, formatButtonVisible: false),
                  calendarStyle: CalendarStyle(
                    rangeHighlightColor: Color.fromARGB(255, 233, 133, 133),
                  ),
                ),
              ),
              buildCard( icon: Icons.do_not_disturb_on,
                title: 'Expiry Date',
              txt: '16 October, 2023'),

            ])));
  }
}

Widget buildCard({String? title, IconData? icon, String? txt}) {
  return SizedBox(
      height: 100,
      child: Card(
          elevation: 2,
          child: Center(
              child: ListTile(
            leading: Icon(
              icon,
              color: Colors.indigo,
            ),
            title: Text(
              title!,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            subtitle: Text(txt!),
          ))));
}
