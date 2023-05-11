import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:nhif_app/screens/slists.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NHIF Services'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Members()));
                },
                child: buildCard(title: "Memberships", icon: Icons.people)),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Benefit()));
                },
                child: buildCard(
                    title: "Benefit packages", icon: FeatherIcons.package)),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Additional()));
              },
              child: buildCard(
                  title: "Additional packages", icon: FeatherIcons.plusSquare),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildCard({String? title, IconData? icon}) {
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
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.indigo,
            ),
          ))));
}
