// class EventModel {
//   EventModel({
//     this.id,
//       this.title,
//       this.description,
//       this.location,
//       this.date,
//       this.imageUrl,
//       this.interestedPatientsCount,});
//   EventModel.fromJson(dynamic json) {
//     id = json['_id'];
//     title = json['title'];
//     description = json['description'];
//     location = json['location'];
//     date = json['date'];
//     imageUrl = json['ImageUrl'];
//     interestedPatientsCount = json['interestedPatientsCount'];
//   }
//   String?id;
//   String? title;
//   String? description;
//   String? location;
//   String ?date;
//   String ?imageUrl;
//   int? interestedPatientsCount;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['title'] = title;
//     map['description'] = description;
//     map['location'] = location;
//     map['date'] = date;
//     map['ImageUrl'] = imageUrl;
//     map['interestedPatientsCount'] = interestedPatientsCount;
//     return map;
//   }
//
// }
class Event {
  final String ?id;
  final String? title;
  final String ?description;
  final String? location;
  final String ?category;
  final DateTime ?date;
  final String ?imageUrl;
  final List<String> ?interestedPatients;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.category,
    required this.date,
    required this.imageUrl,
    required this.interestedPatients,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      category: json['category'],
      date: DateTime.parse(json['date']),
      imageUrl: json['ImageUrl'],
      interestedPatients: List<String>.from(json['interestedPatients']),
    );
  }
}