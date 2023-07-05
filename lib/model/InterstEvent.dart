import 'dart:convert';

import '../remot/network/dio_helper.dart';
import '../remot/network/event _API.dart';
import 'package:http/http.dart' as http;

import 'Intersted.dart';

class UpdatedEvent {
  final String? message;
  final String? id;
  final String? title;
  final String ?description;
  final String ?location;
  final String? category;
  final String? date;
  final String? imageUrl;
  final List<String> ?interestedPatients;
  final int ?v;

  UpdatedEvent({
    required this.id,
    required this.message,
    required this.interestedPatients,
    required this.title,
    required this.description,
    required this.location,
    required this.category,
    required this.date,
    required this.imageUrl,

    required this.v,
  });

  factory UpdatedEvent.fromJson(Map<String, dynamic> json) {
    return UpdatedEvent(
      id: json['_id'],
      message: json['message'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      category: json['category'],
      date: json['date'],
      interestedPatients: json['interestedPatients'],
      imageUrl: json['ImageUrl'],
      v: json['__v'],
    );
  }
}


class UpdatedPatient {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String medicalNumber;
  final String password;
  final String chosenStage;
  final String interestedPatients;
  final int v;

  final List<dynamic> chosenServices;

  UpdatedPatient({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.medicalNumber,
    required this.password,
    required this.chosenStage,
    required this.v,
    required this.chosenServices,

    required this.interestedPatients, required List<String> interestedEvents,
  });

  factory UpdatedPatient.fromJson(Map<String, dynamic> json) {
    return UpdatedPatient(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      medicalNumber: json['medicalNumber'],
      password: json['password'],
      chosenStage: json['chosenStage'],
      interestedPatients: json['interestedPatients'],
      v: json['__v'],
      interestedEvents: List<String>.from(json['interestedEvents']),
      chosenServices: List<dynamic>.from(json['chosenServices']),
    );
  }
}

