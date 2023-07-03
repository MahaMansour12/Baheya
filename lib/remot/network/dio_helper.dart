import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class API{
 static Future<dynamic> ApiLink(Map<String,dynamic>data,String endPoint) async {
    final url = Uri.parse('https://baheya-app-kjsk.onrender.com/$endPoint');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body:data,

    );
    final jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {

      final token = jsonData['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      print('Login successful');
      print(response.statusCode);
      // Do something after login
    } else {
      print('Login failed');
      // Handle error
    }
    return response;
  }
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

}


