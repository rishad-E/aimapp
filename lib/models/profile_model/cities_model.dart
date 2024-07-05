

class GetCityModel {
    List<City>? cities;

    GetCityModel({
        this.cities,
    });

    factory GetCityModel.fromJson(Map<String, dynamic> json) => GetCityModel(
        cities: json["cities"] == null ? [] : List<City>.from(json["cities"]!.map((x) => City.fromJson(x))),
    );

}

class City {
    int? id;
    String? name;
    int? stateId;
    int? lmsId;

    City({
        this.id,
        this.name,
        this.stateId,
        this.lmsId,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        stateId: json["state_id"],
        lmsId: json["lms_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state_id": stateId,
        "lms_id": lmsId,
    };
}
