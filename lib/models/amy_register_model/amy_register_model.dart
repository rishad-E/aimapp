// To parse this JSON data, do
//
//     final amyRegisterModel = amyRegisterModelFromJson(jsonString);

// import 'dart:convert';

// AmyRegisterModel amyRegisterModelFromJson(String str) => AmyRegisterModel.fromJson(json.decode(str));

// String amyRegisterModelToJson(AmyRegisterModel data) => json.encode(data.toJson());

class AmyRegisterModel {
    String? status;
    List<Option>? options;
    String? botReply;
    int? updQuesIndex;

    AmyRegisterModel({
        this.status,
        this.options,
        this.botReply,
        this.updQuesIndex,
    });

    factory AmyRegisterModel.fromJson(Map<String, dynamic> json) => AmyRegisterModel(
        status: json["status"],
        options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
        botReply: json["bot_reply"],
        updQuesIndex: json["upd_ques_index"],
    );

}

class Option {
    int? id;
    String? item;

    Option({
        this.id,
        this.item,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        item: json["item"],
    );

}
