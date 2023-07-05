// To parse this JSON data, do
//
//     final demoGraphic = demoGraphicFromJson(jsonString);

import 'dart:convert';

DemoGraphic demoGraphicFromJson(String str) => DemoGraphic.fromJson(json.decode(str));

String demoGraphicToJson(DemoGraphic data) => json.encode(data.toJson());

class DemoGraphic {
    List<Result> results;

    DemoGraphic({
        required this.results,
    });

    factory DemoGraphic.fromJson(Map<String, dynamic> json) => DemoGraphic(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String uuid;
    String display;
    List<Identifier> identifiers;
    Person person;
    bool voided;
    AuditInfo auditInfo;
    List<Link> links;
    String resourceVersion;

    Result({
        required this.uuid,
        required this.display,
        required this.identifiers,
        required this.person,
        required this.voided,
        required this.auditInfo,
        required this.links,
        required this.resourceVersion,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        uuid: json["uuid"],
        display: json["display"],
        identifiers: List<Identifier>.from(json["identifiers"].map((x) => Identifier.fromJson(x))),
        person: Person.fromJson(json["person"]),
        voided: json["voided"],
        auditInfo: AuditInfo.fromJson(json["auditInfo"]),
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": display,
        "identifiers": List<dynamic>.from(identifiers.map((x) => x.toJson())),
        "person": person.toJson(),
        "voided": voided,
        "auditInfo": auditInfo.toJson(),
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

class AuditInfo {
    ChangedBy creator;
    String dateCreated;
    ChangedBy changedBy;
    String dateChanged;

    AuditInfo({
        required this.creator,
        required this.dateCreated,
        required this.changedBy,
        required this.dateChanged,
    });

    factory AuditInfo.fromJson(Map<String, dynamic> json) => AuditInfo(
        creator: ChangedBy.fromJson(json["creator"]),
        dateCreated: json["dateCreated"],
        changedBy: ChangedBy.fromJson(json["changedBy"]),
        dateChanged: json["dateChanged"],
    );

    Map<String, dynamic> toJson() => {
        "creator": creator.toJson(),
        "dateCreated": dateCreated,
        "changedBy": changedBy.toJson(),
        "dateChanged": dateChanged,
    };
}

class ChangedBy {
    String uuid;
    Display display;
    List<Link> links;

    ChangedBy({
        required this.uuid,
        required this.display,
        required this.links,
    });

    factory ChangedBy.fromJson(Map<String, dynamic> json) => ChangedBy(
        uuid: json["uuid"],
        display: displayValues.map[json["display"]]!,
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": displayValues.reverse[display],
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
    };
}

enum Display { ADMIN, MRN, REGISTRATION_DESK, PHONE, MARITAL_STATUS, EDUCATION }

final displayValues = EnumValues({
    "admin": Display.ADMIN,
    "education": Display.EDUCATION,
    "maritalStatus": Display.MARITAL_STATUS,
    "MRN": Display.MRN,
    "phone": Display.PHONE,
    "Registration Desk": Display.REGISTRATION_DESK
});

class Link {
    Rel rel;
    String uri;

    Link({
        required this.rel,
        required this.uri,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        rel: relValues.map[json["rel"]]!,
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "rel": relValues.reverse[rel],
        "uri": uri,
    };
}

enum Rel { SELF, FULL }

final relValues = EnumValues({
    "full": Rel.FULL,
    "self": Rel.SELF
});

class Identifier {
    String display;
    String uuid;
    String identifier;
    ChangedBy identifierType;
    ChangedBy location;
    bool preferred;
    bool voided;
    List<Link> links;
    String resourceVersion;

    Identifier({
        required this.display,
        required this.uuid,
        required this.identifier,
        required this.identifierType,
        required this.location,
        required this.preferred,
        required this.voided,
        required this.links,
        required this.resourceVersion,
    });

    factory Identifier.fromJson(Map<String, dynamic> json) => Identifier(
        display: json["display"],
        uuid: json["uuid"],
        identifier: json["identifier"],
        identifierType: ChangedBy.fromJson(json["identifierType"]),
        location: ChangedBy.fromJson(json["location"]),
        preferred: json["preferred"],
        voided: json["voided"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "display": display,
        "uuid": uuid,
        "identifier": identifier,
        "identifierType": identifierType.toJson(),
        "location": location.toJson(),
        "preferred": preferred,
        "voided": voided,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

class Person {
    String uuid;
    String display;
    String gender;
    int age;
    String birthdate;
    bool birthdateEstimated;
    bool dead;
    dynamic deathDate;
    dynamic causeOfDeath;
    Name preferredName;
    Address? preferredAddress;
    List<Name> names;
    List<Address> addresses;
    List<Attribute> attributes;
    bool voided;
    AuditInfo auditInfo;
    dynamic birthtime;
    bool deathdateEstimated;
    dynamic causeOfDeathNonCoded;
    List<Link> links;
    String resourceVersion;

    Person({
        required this.uuid,
        required this.display,
        required this.gender,
        required this.age,
        required this.birthdate,
        required this.birthdateEstimated,
        required this.dead,
        this.deathDate,
        this.causeOfDeath,
        required this.preferredName,
        this.preferredAddress,
        required this.names,
        required this.addresses,
        required this.attributes,
        required this.voided,
        required this.auditInfo,
        this.birthtime,
        required this.deathdateEstimated,
        this.causeOfDeathNonCoded,
        required this.links,
        required this.resourceVersion,
    });

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        uuid: json["uuid"],
        display: json["display"],
        gender: json["gender"],
        age: json["age"],
        birthdate: json["birthdate"],
        birthdateEstimated: json["birthdateEstimated"],
        dead: json["dead"],
        deathDate: json["deathDate"],
        causeOfDeath: json["causeOfDeath"],
        preferredName: Name.fromJson(json["preferredName"]),
        preferredAddress: json["preferredAddress"] == null ? null : Address.fromJson(json["preferredAddress"]),
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
        attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
        voided: json["voided"],
        auditInfo: AuditInfo.fromJson(json["auditInfo"]),
        birthtime: json["birthtime"],
        deathdateEstimated: json["deathdateEstimated"],
        causeOfDeathNonCoded: json["causeOfDeathNonCoded"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": display,
        "gender": gender,
        "age": age,
        "birthdate": birthdate,
        "birthdateEstimated": birthdateEstimated,
        "dead": dead,
        "deathDate": deathDate,
        "causeOfDeath": causeOfDeath,
        "preferredName": preferredName.toJson(),
        "preferredAddress": preferredAddress?.toJson(),
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "voided": voided,
        "auditInfo": auditInfo.toJson(),
        "birthtime": birthtime,
        "deathdateEstimated": deathdateEstimated,
        "causeOfDeathNonCoded": causeOfDeathNonCoded,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

class Address {
    Address1 display;
    String uuid;
    bool preferred;
    Address1 address1;
    dynamic address2;
    CityVillage cityVillage;
    StateProvince stateProvince;
    dynamic country;
    dynamic postalCode;
    String? countyDistrict;
    dynamic address3;
    dynamic address4;
    dynamic address5;
    dynamic address6;
    dynamic startDate;
    dynamic endDate;
    dynamic latitude;
    dynamic longitude;
    bool voided;
    dynamic address7;
    dynamic address8;
    dynamic address9;
    dynamic address10;
    dynamic address11;
    dynamic address12;
    dynamic address13;
    dynamic address14;
    dynamic address15;
    List<Link> links;
    String resourceVersion;

    Address({
        required this.display,
        required this.uuid,
        required this.preferred,
        required this.address1,
        this.address2,
        required this.cityVillage,
        required this.stateProvince,
        this.country,
        this.postalCode,
        this.countyDistrict,
        this.address3,
        this.address4,
        this.address5,
        this.address6,
        this.startDate,
        this.endDate,
        this.latitude,
        this.longitude,
        required this.voided,
        this.address7,
        this.address8,
        this.address9,
        this.address10,
        this.address11,
        this.address12,
        this.address13,
        this.address14,
        this.address15,
        required this.links,
        required this.resourceVersion,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        display: address1Values.map[json["display"]]!,
        uuid: json["uuid"],
        preferred: json["preferred"],
        address1: address1Values.map[json["address1"]]!,
        address2: json["address2"],
        cityVillage: cityVillageValues.map[json["cityVillage"]]!,
        stateProvince: stateProvinceValues.map[json["stateProvince"]]!,
        country: json["country"],
        postalCode: json["postalCode"],
        countyDistrict: json["countyDistrict"],
        address3: json["address3"],
        address4: json["address4"],
        address5: json["address5"],
        address6: json["address6"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        voided: json["voided"],
        address7: json["address7"],
        address8: json["address8"],
        address9: json["address9"],
        address10: json["address10"],
        address11: json["address11"],
        address12: json["address12"],
        address13: json["address13"],
        address14: json["address14"],
        address15: json["address15"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "display": address1Values.reverse[display],
        "uuid": uuid,
        "preferred": preferred,
        "address1": address1Values.reverse[address1],
        "address2": address2,
        "cityVillage": cityVillageValues.reverse[cityVillage],
        "stateProvince": stateProvinceValues.reverse[stateProvince],
        "country": country,
        "postalCode": postalCode,
        "countyDistrict": countyDistrict,
        "address3": address3,
        "address4": address4,
        "address5": address5,
        "address6": address6,
        "startDate": startDate,
        "endDate": endDate,
        "latitude": latitude,
        "longitude": longitude,
        "voided": voided,
        "address7": address7,
        "address8": address8,
        "address9": address9,
        "address10": address10,
        "address11": address11,
        "address12": address12,
        "address13": address13,
        "address14": address14,
        "address15": address15,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

enum Address1 { DAR_ES_SALAAM }

final address1Values = EnumValues({
    "Dar es Salaam": Address1.DAR_ES_SALAAM
});

enum CityVillage { MWENGE_VILLAGE, TEGETA_A_VILLAGE }

final cityVillageValues = EnumValues({
    "Mwenge Village": CityVillage.MWENGE_VILLAGE,
    "Tegeta a Village": CityVillage.TEGETA_A_VILLAGE
});

enum StateProvince { KINONDONI, UBUNGO }

final stateProvinceValues = EnumValues({
    "Kinondoni": StateProvince.KINONDONI,
    "Ubungo": StateProvince.UBUNGO
});

class Attribute {
    String display;
    String uuid;
    String value;
    ChangedBy attributeType;
    bool voided;
    List<Link> links;
    String resourceVersion;

    Attribute({
        required this.display,
        required this.uuid,
        required this.value,
        required this.attributeType,
        required this.voided,
        required this.links,
        required this.resourceVersion,
    });

    factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        display: json["display"],
        uuid: json["uuid"],
        value: json["value"],
        attributeType: ChangedBy.fromJson(json["attributeType"]),
        voided: json["voided"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "display": display,
        "uuid": uuid,
        "value": value,
        "attributeType": attributeType.toJson(),
        "voided": voided,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

class Name {
    String display;
    String uuid;
    String givenName;
    dynamic middleName;
    String familyName;
    dynamic familyName2;
    bool voided;
    List<Link> links;
    String resourceVersion;

    Name({
        required this.display,
        required this.uuid,
        required this.givenName,
        this.middleName,
        required this.familyName,
        this.familyName2,
        required this.voided,
        required this.links,
        required this.resourceVersion,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        display: json["display"],
        uuid: json["uuid"],
        givenName: json["givenName"],
        middleName: json["middleName"],
        familyName: json["familyName"],
        familyName2: json["familyName2"],
        voided: json["voided"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "display": display,
        "uuid": uuid,
        "givenName": givenName,
        "middleName": middleName,
        "familyName": familyName,
        "familyName2": familyName2,
        "voided": voided,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
