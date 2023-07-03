class PatientInformation {
  PatientInformation({
      this.name, 
      this.email, 
      this.phone, 
      this.medicalNumber, 
      this.chosenStage, 
      this.interestedEvents,});

  PatientInformation.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    medicalNumber = json['medicalNumber'];
    chosenStage = json['chosenStage'];
    interestedEvents = json['interestedEvents'] != null ? json['interestedEvents'].cast<String>() : [];
  }
  String ?name;
  String ?email;
  String ?phone;
  String ?medicalNumber;
  String ?chosenStage;
  List<String>? interestedEvents;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['medicalNumber'] = medicalNumber;
    map['chosenStage'] = chosenStage;
    map['interestedEvents'] = interestedEvents;
    return map;
  }

}