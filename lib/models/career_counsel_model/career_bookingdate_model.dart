// To parse this JSON data, do
//
//     final bookingDateResponseModel = bookingDateResponseModelFromJson(jsonString);

// import 'dart:convert';

// BookingDateResponseModel bookingDateResponseModelFromJson(String str) => BookingDateResponseModel.fromJson(json.decode(str));

// String bookingDateResponseModelToJson(BookingDateResponseModel data) => json.encode(data.toJson());

// class BookingDateResponseModel {
  // final List<String> sevendates;

  // BookingDateResponseModel({required this.sevendates});

  // factory BookingDateResponseModel.fromJson(Map<String, dynamic> json) {
  //   return BookingDateResponseModel(
  //     sevendates: List<String>.from(json['sevendates'] ?? []),
  //   );
  // }
  // List<DateTime>? sevendates;

  // BookingDateResponseModel({
  //     this.sevendates,
  // });

  // factory BookingDateResponseModel.fromJson(Map<String, dynamic> json) => BookingDateResponseModel(
  //     sevendates: json["sevendates"] == null ? [] : List<DateTime>.from(json["sevendates"]!.map((x) => DateTime.parse(x))),
  // );

  // Map<String, dynamic> toJson() => {
  //     "sevendates": sevendates == null ? [] : List<dynamic>.from(sevendates!.map((x) => "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
  // };
// }
