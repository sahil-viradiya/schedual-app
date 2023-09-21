class DayModel {
  String dayName;
  bool dayActive =false;
  bool morningActive=false;
  bool afternoonActive=false;
  bool eveningActive=false;


DayModel({required this.dayName});
  
}



// DayModel({required this.dayName, required this.});

  // factory DayModel.fromJson(List<dynamic> json) {
  //   return DayModel(
  //     week: List<String>.from(json),
  //   );
  // }

  // List<dynamic> toJson() {
  //   return week;
  // }