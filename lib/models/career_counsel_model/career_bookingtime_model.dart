
class BookingTimeResponseModel {
    List<Slot>? slots;
    DateTime? requestedDate;
    String? currentTime;

    BookingTimeResponseModel({
        this.slots,
        this.requestedDate,
        this.currentTime,
    });

    factory BookingTimeResponseModel.fromJson(Map<String, dynamic> json) => BookingTimeResponseModel(
        slots: json["slots"] == null ? [] : List<Slot>.from(json["slots"]!.map((x) => Slot.fromJson(x))),
        requestedDate: json["requested_date"] == null ? null : DateTime.parse(json["requested_date"]),
        currentTime: json["current_time"],
    );

    Map<String, dynamic> toJson() => {
        "slots": slots == null ? [] : List<dynamic>.from(slots!.map((x) => x.toJson())),
        "requested_date": "${requestedDate!.year.toString().padLeft(4, '0')}-${requestedDate!.month.toString().padLeft(2, '0')}-${requestedDate!.day.toString().padLeft(2, '0')}",
        "current_time": currentTime,
    };
}

class Slot {
    String? slotStartTime;
    String? slotEndTime;

    Slot({
        this.slotStartTime,
        this.slotEndTime,
    });

    factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        slotStartTime: json["slot_start_time"],
        slotEndTime: json["slot_end_time"],
    );

    Map<String, dynamic> toJson() => {
        "slot_start_time": slotStartTime,
        "slot_end_time": slotEndTime,
    };
}
