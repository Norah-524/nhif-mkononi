import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:nhif_app/screens/contactlist.dart';
import 'package:nhif_app/screens/loginpage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nhif_app/screens/profile.dart';
import 'package:nhif_app/screens/signuppage.dart';
import 'package:url_launcher/url_launcher.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final samples = ['assets/abc.jpg', 'assets/n.jpg'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          color: Colors.deepPurple[100],
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.deepPurple,
                child: CarouselSlider.builder(
                    itemCount: samples.length,
                    itemBuilder: (context, index, realIndex) {
                      final sample = samples[index];
                      return buildImage(sample, index);
                    },
                    options: CarouselOptions(
                        autoPlay: true,
                        height: MediaQuery.of(context).size.height * 0.3)),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: 375,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'The United Republic of Tanzania',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Colors.indigo),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'National Health Insuarance Fund',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Colors.indigo),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Uhakika wa matibabu',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/service');
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  border: Border.all(
                                    color: Colors.indigo,
                                    width: 0.0,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Icon(
                                    Icons.medical_services,
                                    color: Colors.indigo,
                                    size: 45,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Services",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              const url =
                                  'https://verification.nhif.or.tz/ServicePortal/application';
                              if (await canLaunch(url)) {
                                await launch(
                                  url,
                                  forceWebView: false,
                                );
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  border: Border.all(
                                    color: Colors.indigo,
                                    width: 0.0,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Icon(
                                    FeatherIcons.userPlus,
                                    size: 45,
                                    color: Colors.indigo,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Registration",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Contacts()));
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  border: Border.all(
                                    color: Colors.indigo,
                                    width: 0.0,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Icon(
                                    FeatherIcons.compass,
                                    size: 45,
                                    color: Colors.indigo,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Contacts",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width * 0.43,
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => SignUp()));
                          //     },
                          //     child: Text('Sign Up'),
                          //     style: ButtonStyle(
                          //         foregroundColor:
                          //             MaterialStateProperty.all<Color>(
                          //                 Colors.indigo),
                          //         backgroundColor:
                          //             MaterialStateProperty.all<Color>(
                          //                 Colors.white),
                          //         shape: MaterialStateProperty.all<
                          //                 RoundedRectangleBorder>(
                          //             RoundedRectangleBorder(
                          //                 borderRadius:
                          //                     BorderRadius.circular(8.0),
                          //                 side: BorderSide(
                          //                     color: Colors.indigo)))),
                          //   ),
                          // ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => JobPosting()));
                              },
                              child: Text('Welcome aboard'),
                              style: ButtonStyle(
                                  overlayColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.indigoAccent),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.indigo),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          side: BorderSide(
                                              color: Colors.indigo)))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildImage(String sample, int index) {
  return Container(
    color: Colors.white,
    //margin: EdgeInsets.symmetric(horizontal: 1),
    child: Image.asset(
      sample,
      fit: BoxFit.cover,
    ),
  );
}
