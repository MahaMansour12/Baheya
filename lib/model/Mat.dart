class Mat {
  Mat({
      this.title, 
      this.description, 
      this.stage, 
      this.url,});

  Mat.fromJson(Map<String,dynamic>json) {
    title = json['title'];
    description = json['description'];
    stage = json['stage'];
    url = json['url'];
  }
  String? title;
  String? description;
  String? stage;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['stage'] = stage;
    map['url'] = url;
    return map;
  }

}