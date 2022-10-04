class SlotsModel {
  bool? booked;
  String? bookedby;
  String? time;

  SlotsModel({this.booked, this.bookedby, this.time});

  factory SlotsModel.fromJson(Map<String, dynamic> json) {
    return SlotsModel(
      booked: json['booked'],
      bookedby: json['bookedby'],
      time: json['time'],
    );
  }
}
