import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/model/Mat.dart';

// Future<Mat> fetchImageMaterials(String endPoint) async {
//
//   /
//   final url = Uri.parse('https://baheya-app-kjsk.onrender.com/$endPoint');
//   var response = await http.get(
//     url,
//     headers: {'token':"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjQ5MTAwYTIzMDY4MTg1ODZmNzE5YzIyIiwicm9sZSI6InBhdGllbnQiLCJpYXQiOjE2ODc0Nzc0NzN9.g7WPk66uD_AR1YZyVVmIRbxS-hoWuY21jLTemD2pDYI"},
//
//   );
//   //final response = await http.get(Uri.parse('https://baheya-app-kjsk.onrender.com/ImageMaterials'));
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body);
//
//     Mat materials = Mat.fromJson(data);
//     return materials;
//   } else {
//     throw Exception('Failed to fetch image materials');
//   }
// }


Future<List<dynamic>> fetchMaterials(String endpoint) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
 String token = prefs.getString('token') ?? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjQ5MTAwYTIzMDY4MTg1ODZmNzE5YzIyIiwicm9sZSI6InBhdGllbnQiLCJpYXQiOjE2ODc0Nzc0NzN9.g7WPk66uD_AR1YZyVVmIRbxS-hoWuY21jLTemD2pDYI';
  final response = await http.get(
    Uri.parse('https://baheya-app-kjsk.onrender.com/ImageMaterials'),
    headers: {'Authorization':token},
  );
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    print(data);
    return data;
  } else {
    throw Exception('Failed to fetch materials');
  }
}