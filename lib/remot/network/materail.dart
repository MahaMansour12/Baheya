import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'dio_helper.dart';

class ImageMaterialApi {
  static const _baseUrl = 'https://baheya-app-kjsk.onrender.com/';
 // static const _imageMaterialsEndpoint = '/ImageMaterials';

  static Future<dynamic> getMaterials({required String endPoint}) async {
   String? token=await API.getToken();
  //  String token = prefs.getString('token') ?? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjQ5MTAwYTIzMDY4MTg1ODZmNzE5YzIyIiwicm9sZSI6InBhdGllbnQiLCJpYXQiOjE2ODc0Nzc0NzN9.g7WPk66uD_AR1YZyVVmIRbxS-hoWuY21jLTemD2pDYI';
    final url = '$_baseUrl$endPoint';
    final response = await http.get(Uri.parse(url), headers: {'token': token??"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjQ5MTAwYTIzMDY4MTg1ODZmNzE5YzIyIiwicm9sZSI6InBhdGllbnQiLCJpYXQiOjE2ODc0Nzc0NzN9.g7WPk66uD_AR1YZyVVmIRbxS-hoWuY21jLTemD2pDYI"});
    final jsonData = jsonDecode(response.body);
    List<Material> materials = [];
    for (var item in jsonData) {
      materials.add(Material.fromJson(item));

    }


    return materials;
  }
}

class Material {

  final String? id;
  final String? title;
  final String? description;
  final String? stage;
  final String? location;
  final String? imageUrl;
  final String? date;
  final String? url;
  final int? interestedPatientsCount;


  Material( {

     required this.id,
    required this.title,
    required this.description,
    required this.stage,
    required this.url,
   required this.location,
   required this.date,
   required this.imageUrl,
    required this.interestedPatientsCount

  });

  factory Material.fromJson(Map<String, dynamic> json) {
    return Material(
        id: json['_id'],
      title: json['title'],
      description: json['description'],
      stage: json['stage'],
      url: json['url'],
        location:json['location'],
        date:json['date'],
        imageUrl : json['ImageUrl'],
    interestedPatientsCount : json['interestedPatientsCount']

    );
  }
}