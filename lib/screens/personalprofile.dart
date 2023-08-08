import 'package:flutx/flutx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({Key? key}) : super(key: key);

  @override
  PersonalProfileState createState() => PersonalProfileState();
}

class PersonalProfileState extends State<PersonalProfile> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildSingleRow({String? title, IconData? icon}) {
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
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 62, 24, 24),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
              child: Image(
                fit: BoxFit.cover,
                width: 100,
                height: 100,
                image: AssetImage('assets/loy.jpeg'),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            'Loy Sanford',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            'General',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/demo');
              },
              child: _buildSingleRow(
                  title: 'Demographics', icon: FeatherIcons.creditCard)),
          SizedBox(
            height: 8,
          ),
          Divider(),
          SizedBox(
            height: 8,
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/mstat');
              },
              child: _buildSingleRow(
                  title: 'Membership status', icon: FeatherIcons.user)),
          SizedBox(
            height: 8,
          ),
          Divider(),
          SizedBox(
            height: 8,
          ),
          _buildSingleRow(
              title: 'Subscription & payment', icon: FeatherIcons.lock),
          SizedBox(
            height: 8,
          ),
          Divider(),
          SizedBox(
            height: 8,
          ),
          _buildSingleRow(title: 'Notifications', icon: FeatherIcons.bell),
          SizedBox(
            height: 8,
          ),
          Divider(),
          SizedBox(
            height: 8,
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child:
                  _buildSingleRow(title: 'Logout', icon: FeatherIcons.logOut)),
        ],
      ),
    );
  }
}
