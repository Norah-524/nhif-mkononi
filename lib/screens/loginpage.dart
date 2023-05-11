import 'package:flutter/material.dart';
import 'package:nhif_app/screens/forgot_password.dart';
import 'package:nhif_app/screens/profile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class JobPosting extends StatefulWidget {
  const JobPosting({Key? key}) : super(key: key);

  @override
  State<JobPosting> createState() => _JobPostingState();
}

class _JobPostingState extends State<JobPosting> {
  final TextEditingController _cardnoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loginError = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 110.0, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  foregroundImage: AssetImage('assets/nhif.png'), radius: 70),
              const SizedBox(
                height: 90,
              ),
              Center(
                child: Container(
                  width: 300,
                  height: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Username',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),

                      SizedBox(
                        height: 9,
                      ),
                      TextFormField(
                          controller: _cardnoController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            hintText: "Membership number",
                            fillColor: Colors.grey[200],
                            filled: true,
                          )),

                      SizedBox(
                        height: 30,
                      ),
                      const Text('Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      SizedBox(
                        height: 9,
                      ),
                      TextFormField(
                          controller: _passwordController,
                          obscureText: false,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.none,
                                  color: Colors.white,
                                  width: 0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            hintText: "Type here",
                            fillColor: Colors.grey[200],
                            filled: true,
                          )), //

                      SizedBox(
                        height: 70,
                      ), //
                      Center(
                        child: Column(
                          children: [
                            _isLoading
                                ? CircularProgressIndicator()
                                : SizedBox(
                                    width: 200,
                                    height: 51,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          //_login();
                                          Navigator.pushNamed(context, '/home');
                                        },
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(color: Colors.white),
                                        ))),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgotPass()));
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  letterSpacing: 0.8,
                                  //  decoration: TextDecoration.underline
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    final CardNo = _cardnoController.text;
    final Surname = _passwordController.text;

    final response = await http.post(
      Uri.parse('http://192.168.69.105:8081/api/login'),
      body: {
        'CardNo': CardNo,
        'Surname': Surname,
      },
    );
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data['message']);

      Navigator.pushNamed(context, '/home');
    } else {
      setState(() {
        _isLoading = false;
        Text('Invalid email or password', style: TextStyle(color: Colors.red));
      });

      throw Exception('Failed to log in');
    }
  }
}
