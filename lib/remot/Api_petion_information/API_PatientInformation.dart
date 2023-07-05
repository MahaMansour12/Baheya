import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../network/dio_helper.dart';
import 'PationInformation.dart';


class Information{
  static const _baseUrl = 'https://baheya-app-kjsk.onrender.com/PatientInformation';
  // static const _imageMaterialsEndpoint = '/ImageMaterials';

  static Future<PatientInformation> InformationPatient() async {
    String? token=await API.getToken();
    //  String token = prefs.getString('token') ?? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjQ5MTAwYTIzMDY4MTg1ODZmNzE5YzIyIiwicm9sZSI6InBhdGllbnQiLCJpYXQiOjE2ODc0Nzc0NzN9.g7WPk66uD_AR1YZyVVmIRbxS-hoWuY21jLTemD2pDYI';
    final url = '$_baseUrl';
    final response = await http.get(Uri.parse(url), headers: {'token': token??"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjQ5MTAwYTIzMDY4MTg1ODZmNzE5YzIyIiwicm9sZSI6InBhdGllbnQiLCJpYXQiOjE2ODc0Nzc0NzN9.g7WPk66uD_AR1YZyVVmIRbxS-hoWuY21jLTemD2pDYI"});
    final jsonData = jsonDecode(response.body);
    PatientInformation Information = PatientInformation.fromJson(jsonData);
    return Information;

  }

}
class UPData{

 static Future<void> sendUPData({required Map<String ,dynamic>data,required String endpoint}) async {
    String? token=await API.getToken();
    final url = 'https://baheya-app-kjsk.onrender.com/$endpoint';
    final headers = {
    'token': token??'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjQ5MTAwYTIzMDY4MTg1ODZmNzE5YzIyIiwicm9sZSI6InBhdGllbnQiLCJpYXQiOjE2ODc0Nzc0NzN9.g7WPk66uD_AR1YZyVVmIRbxS-hoWuY21jLTemD2pDYI',
    };
    final response = await http.put(Uri.parse(url), headers: headers, body: data);
    print(response.body);
  }
}
