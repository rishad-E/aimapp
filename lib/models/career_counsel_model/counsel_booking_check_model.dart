
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
    String? formattedTime;
    String? formattedDate;
    String? startTime;
    String? endTime;
    String? status;
    String? channel;
    dynamic slotId;
    String? userId;
    int? slot;

    Data({
        this.formattedTime,
        this.formattedDate,
        this.startTime,
        this.endTime,
        this.status,
        this.channel,
        this.slotId,
        this.userId,
        this.slot,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        formattedTime: json["formattedTime"],
        formattedDate: json["formattedDate"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        status: json["status"],
        channel: json["channel"],
        slotId: json["slotId"],
        userId: json["user_id"],
        slot: json["slot"],
    );

    Map<String, dynamic> toJson() => {
        "formattedTime": formattedTime,
        "formattedDate": formattedDate,
        "startTime": startTime,
        "endTime": endTime,
        "status": status,
        "channel": channel,
        "slotId": slotId,
        "user_id": userId,
        "slot": slot,
    };
}