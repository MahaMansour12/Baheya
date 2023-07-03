class Data {
  Data({
      this.title, 
      this.description, 
      this.stage, 
      this.url,});

  Data.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    stage = json['stage'];
    url = json['url'];
  }
  String ?title;
  String? description;
  String ?stage;
  String ?url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['stage'] = stage;
    map['url'] = url;
    return map;
  }

}