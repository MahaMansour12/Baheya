
import 'dart:convert';

import '../../model/EventModel.dart';
import '../../model/EventModel.dart';
import 'dio_helper.dart';
import 'package:http/http.dart' as http;

class EventModelApi {
  static const _baseUrl = 'https://baheya-app-kjsk.onrender.com/';
  // static const _imageMaterialsEndpoint = '/ImageMaterials';

  static Future<EventModel> getEventModel({required String endPoint}) async {
    String? token=await API.getToken();
    //  String token = prefs.getString('token') ?? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjQ5MTAwYTIzMDY4MTg1ODZmNzE5YzIyIiwicm9sZSI6InBhdGllbnQiLCJpYXQiOjE2ODc0Nzc0NzN9.g7WPk66uD_AR1YZyVVmIRbxS-hoWuY21jLTemD2pDYI';
    final url = '$_baseUrl$endPoint';
    final response = await http.get(Uri.parse(url), headers: {'token': token??"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjQ5MTAwYTIzMDY4MTg1ODZmNzE5YzIyIiwicm9sZSI6InBhdGllbnQiLCJpYXQiOjE2ODc0Nzc0NzN9.g7WPk66uD_AR1YZyVVmIRbxS-hoWuY21jLTemD2pDYI"});
    final jsonData = jsonDecode(response.body);
    EventModel eventModel = EventModel.fromJson(jsonData);
    return eventModel;

    }
}
