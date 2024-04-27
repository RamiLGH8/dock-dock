import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  static Login(String email, String password, SharedPreferences prefs) async {
    print('hello');
    if (email.isNotEmpty && password.isNotEmpty) {
      var reqBody = {"email": email, "password": password};
      var response = await http.post(
          Uri.parse('http://192.168.244.77:3000/api/auth/login'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse.toString());

      var myToken = jsonResponse['jwt'];
      print(myToken);
      prefs.setString('token', myToken);
    }
  }
}
