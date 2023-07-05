
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/EventModel.dart';

import '../../model/Intersted.dart';
import 'dio_helper.dart';
import 'package:http/http.dart' as http;

class EventModelApi {
  static const _baseUrl = 'https://baheya-app-kjsk.onrender.com/';

  // static const _imageMaterialsEndpoint = '/ImageMaterials';

  static Future<upcomaing> getEventModel({required String endPoint}) async {
    String? token = await API.getToken();
    //  String token = prefs.getString('token') ?? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjQ5MTAwYTIzMDY4MTg1ODZmNzE5YzIyIiwicm9sZSI6InBhdGllbnQiLCJpYXQiOjE2ODc0Nzc0NzN9.g7WPk66uD_AR1YZyVVmIRbxS-hoWuY21jLTemD2pDYI';
    final url = '$_baseUrl$endPoint';
    final response = await http.get(Uri.parse(url), headers: {
      'token': token ??
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjQ5MTAwYTIzMDY4MTg1ODZmNzE5YzIyIiwicm9sZSI6InBhdGllbnQiLCJpYXQiOjE2ODc0Nzc0NzN9.g7WPk66uD_AR1YZyVVmIRbxS-hoWuY21jLTemD2pDYI"
    });
    final jsonData = jsonDecode(response.body);

    upcomaing  eventModel = upcomaing .fromJson(jsonData);

    if (response.statusCode == 200) {
      final _id = jsonData['_id'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('_id', _id);
    }
    return eventModel;
  }

  static Future<String?> getID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('_id');
  }
}
