import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:table_calendar/table_calendar.dart';

class MStatus extends StatefulWidget {
  const MStatus({super.key});

  @override
  State<MStatus> createState() => _MStatusState();
}

class _MStatusState extends State<MStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Membership status'),
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: [
              buildCard(
                  title: "NHIF number",
                  icon: FeatherIcons.creditCard,
                  txt: '2172016513'),
              buildCard(
                  title: "Membership type",
                  icon: Icons.people,
                  txt: 'Student Package'),
              Card(
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  headerStyle: HeaderStyle(
                      titleCentered: true, formatButtonVisible: false),
                ),
              )
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
