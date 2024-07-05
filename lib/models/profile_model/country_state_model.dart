

class GetStatesCountryModel {
    Country? country;
    List<StateData>? stateDatas;

    GetStatesCountryModel({
        this.country,
        this.stateDatas,
    });

    factory GetStatesCountryModel.fromJson(Map<String, dynamic> json) => GetStatesCountryModel(
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
        stateDatas: json["stateDatas"] == null ? [] : List<StateData>.from(json["stateDatas"]!.map((x) => StateData.fromJson(x))),
    );


}

class Country {
    int? id;
    String? name;
    String? iso3;
    String? iso2;
    String? phonecode;
    String? currency;
    String? capital;
    int? activeStatus;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? lmsId;

    Country({
        this.id,
        this.name,
        this.iso3,
        this.iso2,
        this.phonecode,
        this.currency,
        this.capital,
        this.activeStatus,
        this.createdAt,
        this.updatedAt,
        this.lmsId,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        iso3: json["iso3"],
        iso2: json["iso2"],
        phonecode: json["phonecode"],
        currency: json["currency"],
        capital: json["capital"],
        activeStatus: json["active_status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
    );

 
}

class StateData {
    int? id;
    String? name;
    int? countryId;
    int? lmsId;

    StateData({
        this.id,
        this.name,
        this.countryId,
        this.lmsId,
    });

    factory StateData.fromJson(Map<String, dynamic> json) => StateData(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
        lmsId: json["lms_id"],
    );

 
}
