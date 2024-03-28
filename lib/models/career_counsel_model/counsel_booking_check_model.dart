// // To parse this JSON data, do
// //
// //     final counselCallBookedModel = counselCallBookedModelFromJson(jsonString);

// import 'dart:convert';

// CounselCallBookedModel counselCallBookedModelFromJson(String str) => CounselCallBookedModel.fromJson(json.decode(str));

// String counselCallBookedModelToJson(CounselCallBookedModel data) => json.encode(data.toJson());

class CounselCallBookedModel {
    int? status;
    String? bookingStatus;
    Data? data;

    CounselCallBookedModel({
        this.status,
        this.bookingStatus,
        this.data,
    });

    factory CounselCallBookedModel.fromJson(Map<String, dynamic> json) => CounselCallBookedModel(
        status: json["status"],
        bookingStatus: json["Booking Status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Booking Status": bookingStatus,
        "data": data?.toJson(),
    };
}

class Data {
    String? appointTime;
    String? appointDate;
    String? linkActivate;
    String? callTime;
    String? startTime;
    String? endTime;
    String? channel;
    int? slot;

    Data({
        this.appointTime,
        this.appointDate,
        this.linkActivate,
        this.callTime,
        this.startTime,
        this.endTime,
        this.channel,
        this.slot,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        appointTime: json["appointTime"],
        appointDate: json["appointDate"],
        linkActivate: json["link_activate"],
        callTime: json["call_time"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        channel: json["channel"],
        slot: json["slot"],
    );

    Map<String, dynamic> toJson() => {
        "appointTime": appointTime,
        "appointDate": appointDate,
        "link_activate": linkActivate,
        "call_time": callTime,
        "startTime": startTime,
        "endTime": endTime,
        "channel": channel,
        "slot": slot,
    };
}
