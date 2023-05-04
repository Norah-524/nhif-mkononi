import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> loginUser(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://your-domain.com/api/login'),
    body: {
      'email': email,
      'password': password,
    },
  );

  if (response.statusCode == 200) {
    final token = jsonDecode(response.body)['token'];
    return token;
  } else {
    throw Exception('Failed to log in');
  }
}
