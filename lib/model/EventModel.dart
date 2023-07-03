class EventModel {
  EventModel({
      this.title, 
      this.description, 
      this.location, 
      this.date, 
      this.imageUrl, 
      this.interestedPatientsCount,});

  EventModel.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    location = json['location'];
    date = json['date'];
    imageUrl = json['ImageUrl'];
    interestedPatientsCount = json['interestedPatientsCount'];
  }
  String? title;
  String? description;
  String? location;
  String ?date;
  String ?imageUrl;
  int? interestedPatientsCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['location'] = location;
    map['date'] = date;
    map['ImageUrl'] = imageUrl;
    map['interestedPatientsCount'] = interestedPatientsCount;
    return map;
  }

}