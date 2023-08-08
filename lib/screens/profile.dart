import 'package:flutter/material.dart';
import 'package:nhif_app/screens/home.dart';
import 'package:nhif_app/screens/payment.dart';
import 'package:nhif_app/screens/personalprofile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/demo_graphic.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _name = '';
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _fetchName().then((_) {
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
      final response = await http.get(
          Uri.parse(
              'https://icare-student.dhis2.udsm.ac.tz/openmrs/ws/rest/v1/patient?identifier=LOY&v=full&limit=10'),
          headers: headers);
      print('Response status code: ${response.statusCode}');
      print('Response headers: ${response.headers}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        // _name = jsonData['person']['display'];

        final demoGraph = demoGraphicFromJson(response.body);
        print("YOU GOT IT");
        setState(() {
          _name = demoGraph.results[0].person.names[1].display;
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
    var onPressed;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.transparent,
          //leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
          title: Center(child: Text('NHIF App')),
          actions: [Icon(Icons.notifications)],
        ),
        drawer: const NavigationDrawer(),
        body: isLoading? Center(child: CircularProgressIndicator()): Column(children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8, left: 40),
                        child: Text(
                          _name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        'You can currently access Students package',
                        style: TextStyle(color: Colors.indigo, fontSize: 15.0),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.43,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonalProfile()));
                    },
                    child: Text('Details'),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.indigo),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: Colors.indigo)))),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: width * 0.43,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/visit');
                    },
                    child: Text('Visits'),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.indigo),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: Colors.indigo)))),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 80,
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              toolbarHeight: 0.0,
              bottom: TabBar(
                labelColor: Colors.indigo,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: ' PAYMENT'),
                  Tab(text: ' '),
                ],
              ),
            ),
          ),
          Expanded(
              child: TabBarView(
            children: [Payment(), Shop()],
          )),
        ]),
      ),
    );
  }
}

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        children: [buildHeader(context), buildItems(context)],
      )),
    );
  }
}

Widget buildHeader(BuildContext context) => Container(
      height: 120,
      child: Center(
          child: Text(
        'NHIF @2023',
        style: TextStyle(color: Colors.white, fontSize: 18),
      )),
      decoration: BoxDecoration(
        color: Colors.indigo,
      ),
    );

Widget buildItems(BuildContext context) => Column(
      children: [
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Onboard()));
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.priority_high_rounded),
          title: Text('About'),
          onTap: () {},
        ),
      ],
    );
