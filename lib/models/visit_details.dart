// To parse this JSON data, do
//
//     final visitDetails = visitDetailsFromJson(jsonString);

import 'dart:convert';

VisitDetails visitDetailsFromJson(String str) => VisitDetails.fromJson(json.decode(str));

String visitDetailsToJson(VisitDetails data) => json.encode(data.toJson());

class VisitDetails {
    List<Result> results;

    VisitDetails({
        required this.results,
    });

    factory VisitDetails.fromJson(Map<String, dynamic> json) => VisitDetails(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String uuid;
    VisitType visitType;
    ResultLocation location;
    String startDatetime;
    List<Attribute> attributes;
    String stopDatetime;
    Patient patient;
    List<EncounterElement> encounters;

    Result({
        required this.uuid,
        required this.visitType,
        required this.location,
        required this.startDatetime,
        required this.attributes,
        required this.stopDatetime,
        required this.patient,
        required this.encounters,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        uuid: json["uuid"],
        visitType: VisitType.fromJson(json["visitType"]),
        location: ResultLocation.fromJson(json["location"]),
        startDatetime: json["startDatetime"],
        attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
        stopDatetime: json["stopDatetime"],
        patient: Patient.fromJson(json["patient"]),
        encounters: List<EncounterElement>.from(json["encounters"].map((x) => EncounterElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "visitType": visitType.toJson(),
        "location": location.toJson(),
        "startDatetime": startDatetime,
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "stopDatetime": stopDatetime,
        "patient": patient.toJson(),
        "encounters": List<dynamic>.from(encounters.map((x) => x.toJson())),
    };
}

class Attribute {
    String display;
    String uuid;
    AttributeType attributeType;
    String value;
    bool voided;
    List<Link> links;
    String resourceVersion;

    Attribute({
        required this.display,
        required this.uuid,
        required this.attributeType,
        required this.value,
        required this.voided,
        required this.links,
        required this.resourceVersion,
    });

    factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        display: json["display"],
        uuid: json["uuid"],
        attributeType: AttributeType.fromJson(json["attributeType"]),
        value: json["value"],
        voided: json["voided"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "display": display,
        "uuid": uuid,
        "attributeType": attributeType.toJson(),
        "value": value,
        "voided": voided,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

class AttributeType {
    String uuid;
    String? display;
    List<Link> links;
    bool? voided;
    Type? type;

    AttributeType({
        required this.uuid,
        this.display,
        required this.links,
        this.voided,
        this.type,
    });

    factory AttributeType.fromJson(Map<String, dynamic> json) => AttributeType(
        uuid: json["uuid"],
        display: json["display"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        voided: json["voided"],
        type: typeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": display,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "voided": voided,
        "type": typeValues.reverse[type],
    };
}

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

enum Type { ORDER }

final typeValues = EnumValues({
    "order": Type.ORDER
});

class EncounterElement {
    String uuid;
    Form? form;
    EncounterLocation? location;
    List<Ob> obs;
    List<Order> orders;
    List<DiagnosisElement> diagnoses;
    List<EncounterProvider> encounterProviders;
    String encounterDatetime;
    VisitType encounterType;
    bool voided;
    dynamic voidReason;

    EncounterElement({
        required this.uuid,
        this.form,
        this.location,
        required this.obs,
        required this.orders,
        required this.diagnoses,
        required this.encounterProviders,
        required this.encounterDatetime,
        required this.encounterType,
        required this.voided,
        this.voidReason,
    });

    factory EncounterElement.fromJson(Map<String, dynamic> json) => EncounterElement(
        uuid: json["uuid"],
        form: json["form"] == null ? null : Form.fromJson(json["form"]),
        location: json["location"] == null ? null : EncounterLocation.fromJson(json["location"]),
        obs: List<Ob>.from(json["obs"].map((x) => Ob.fromJson(x))),
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        diagnoses: List<DiagnosisElement>.from(json["diagnoses"].map((x) => DiagnosisElement.fromJson(x))),
        encounterProviders: List<EncounterProvider>.from(json["encounterProviders"].map((x) => EncounterProvider.fromJson(x))),
        encounterDatetime: json["encounterDatetime"],
        encounterType: VisitType.fromJson(json["encounterType"]),
        voided: json["voided"],
        voidReason: json["voidReason"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "form": form?.toJson(),
        "location": location?.toJson(),
        "obs": List<dynamic>.from(obs.map((x) => x.toJson())),
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "diagnoses": List<dynamic>.from(diagnoses.map((x) => x.toJson())),
        "encounterProviders": List<dynamic>.from(encounterProviders.map((x) => x.toJson())),
        "encounterDatetime": encounterDatetime,
        "encounterType": encounterType.toJson(),
        "voided": voided,
        "voidReason": voidReason,
    };
}

class DiagnosisElement {
    String uuid;
    DiagnosisDiagnosis diagnosis;
    dynamic condition;
    AttributeType encounter;
    String certainty;
    int rank;
    bool voided;
    String display;
    AttributeType patient;
    List<Link> links;
    String resourceVersion;

    DiagnosisElement({
        required this.uuid,
        required this.diagnosis,
        this.condition,
        required this.encounter,
        required this.certainty,
        required this.rank,
        required this.voided,
        required this.display,
        required this.patient,
        required this.links,
        required this.resourceVersion,
    });

    factory DiagnosisElement.fromJson(Map<String, dynamic> json) => DiagnosisElement(
        uuid: json["uuid"],
        diagnosis: DiagnosisDiagnosis.fromJson(json["diagnosis"]),
        condition: json["condition"],
        encounter: AttributeType.fromJson(json["encounter"]),
        certainty: json["certainty"],
        rank: json["rank"],
        voided: json["voided"],
        display: json["display"],
        patient: AttributeType.fromJson(json["patient"]),
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "diagnosis": diagnosis.toJson(),
        "condition": condition,
        "encounter": encounter.toJson(),
        "certainty": certainty,
        "rank": rank,
        "voided": voided,
        "display": display,
        "patient": patient.toJson(),
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

class DiagnosisDiagnosis {
    AttributeType coded;

    DiagnosisDiagnosis({
        required this.coded,
    });

    factory DiagnosisDiagnosis.fromJson(Map<String, dynamic> json) => DiagnosisDiagnosis(
        coded: AttributeType.fromJson(json["coded"]),
    );

    Map<String, dynamic> toJson() => {
        "coded": coded.toJson(),
    };
}

class EncounterProvider {
    String uuid;
    AttributeType provider;
    AttributeType encounterRole;
    bool voided;
    List<Link> links;
    String resourceVersion;

    EncounterProvider({
        required this.uuid,
        required this.provider,
        required this.encounterRole,
        required this.voided,
        required this.links,
        required this.resourceVersion,
    });

    factory EncounterProvider.fromJson(Map<String, dynamic> json) => EncounterProvider(
        uuid: json["uuid"],
        provider: AttributeType.fromJson(json["provider"]),
        encounterRole: AttributeType.fromJson(json["encounterRole"]),
        voided: json["voided"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "provider": provider.toJson(),
        "encounterRole": encounterRole.toJson(),
        "voided": voided,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

class VisitType {
    String uuid;
    String display;
    String name;
    String? description;
    bool retired;
    List<Link> links;
    String resourceVersion;

    VisitType({
        required this.uuid,
        required this.display,
        required this.name,
        this.description,
        required this.retired,
        required this.links,
        required this.resourceVersion,
    });

    factory VisitType.fromJson(Map<String, dynamic> json) => VisitType(
        uuid: json["uuid"],
        display: json["display"],
        name: json["name"],
        description: json["description"],
        retired: json["retired"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": display,
        "name": name,
        "description": description,
        "retired": retired,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

class Form {
    String uuid;
    String display;
    String name;
    dynamic description;
    AttributeType encounterType;
    String version;
    dynamic build;
    bool published;
    List<AttributeType> formFields;
    bool retired;
    List<dynamic> resources;
    List<Link> links;
    String resourceVersion;

    Form({
        required this.uuid,
        required this.display,
        required this.name,
        this.description,
        required this.encounterType,
        required this.version,
        this.build,
        required this.published,
        required this.formFields,
        required this.retired,
        required this.resources,
        required this.links,
        required this.resourceVersion,
    });

    factory Form.fromJson(Map<String, dynamic> json) => Form(
        uuid: json["uuid"],
        display: json["display"],
        name: json["name"],
        description: json["description"],
        encounterType: AttributeType.fromJson(json["encounterType"]),
        version: json["version"],
        build: json["build"],
        published: json["published"],
        formFields: List<AttributeType>.from(json["formFields"].map((x) => AttributeType.fromJson(x))),
        retired: json["retired"],
        resources: List<dynamic>.from(json["resources"].map((x) => x)),
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": display,
        "name": name,
        "description": description,
        "encounterType": encounterType.toJson(),
        "version": version,
        "build": build,
        "published": published,
        "formFields": List<dynamic>.from(formFields.map((x) => x.toJson())),
        "retired": retired,
        "resources": List<dynamic>.from(resources.map((x) => x)),
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

class EncounterLocation {
    String uuid;
    NameEnum display;
    NameEnum name;
    Description description;
    dynamic address1;
    dynamic address2;
    dynamic cityVillage;
    dynamic stateProvince;
    dynamic country;
    dynamic postalCode;
    dynamic latitude;
    dynamic longitude;
    dynamic countyDistrict;
    dynamic address3;
    dynamic address4;
    dynamic address5;
    dynamic address6;
    List<AttributeType> tags;
    AttributeType parentLocation;
    List<dynamic> childLocations;
    bool retired;
    List<AttributeType> attributes;
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

    EncounterLocation({
        required this.uuid,
        required this.display,
        required this.name,
        required this.description,
        this.address1,
        this.address2,
        this.cityVillage,
        this.stateProvince,
        this.country,
        this.postalCode,
        this.latitude,
        this.longitude,
        this.countyDistrict,
        this.address3,
        this.address4,
        this.address5,
        this.address6,
        required this.tags,
        required this.parentLocation,
        required this.childLocations,
        required this.retired,
        required this.attributes,
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

    factory EncounterLocation.fromJson(Map<String, dynamic> json) => EncounterLocation(
        uuid: json["uuid"],
        display: nameEnumValues.map[json["display"]]!,
        name: nameEnumValues.map[json["name"]]!,
        description: descriptionValues.map[json["description"]]!,
        address1: json["address1"],
        address2: json["address2"],
        cityVillage: json["cityVillage"],
        stateProvince: json["stateProvince"],
        country: json["country"],
        postalCode: json["postalCode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        countyDistrict: json["countyDistrict"],
        address3: json["address3"],
        address4: json["address4"],
        address5: json["address5"],
        address6: json["address6"],
        tags: List<AttributeType>.from(json["tags"].map((x) => AttributeType.fromJson(x))),
        parentLocation: AttributeType.fromJson(json["parentLocation"]),
        childLocations: List<dynamic>.from(json["childLocations"].map((x) => x)),
        retired: json["retired"],
        attributes: List<AttributeType>.from(json["attributes"].map((x) => AttributeType.fromJson(x))),
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
        "uuid": uuid,
        "display": nameEnumValues.reverse[display],
        "name": nameEnumValues.reverse[name],
        "description": descriptionValues.reverse[description],
        "address1": address1,
        "address2": address2,
        "cityVillage": cityVillage,
        "stateProvince": stateProvince,
        "country": country,
        "postalCode": postalCode,
        "latitude": latitude,
        "longitude": longitude,
        "countyDistrict": countyDistrict,
        "address3": address3,
        "address4": address4,
        "address5": address5,
        "address6": address6,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "parentLocation": parentLocation.toJson(),
        "childLocations": List<dynamic>.from(childLocations.map((x) => x)),
        "retired": retired,
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
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

enum Description { FOR_GENERAL_OUTPATIENT_TREATMENT }

final descriptionValues = EnumValues({
    "For general outpatient treatment": Description.FOR_GENERAL_OUTPATIENT_TREATMENT
});

enum NameEnum { ROOM_04_GENERAL, ROOM_08_GENERAL, ROOM_02_FAMILY_PLANNING }

final nameEnumValues = EnumValues({
    "Room 02 (Family Planning)": NameEnum.ROOM_02_FAMILY_PLANNING,
    "Room 04 (General)": NameEnum.ROOM_04_GENERAL,
    "Room 08 (General)": NameEnum.ROOM_08_GENERAL
});

class Ob {
    dynamic accessionNumber;
    ObsDatetime obsDatetime;
    String? comment;
    Concept concept;
    String display;
    ObEncounter encounter;
    dynamic groupMembers;
    dynamic order;
    ObPerson person;
    String uuid;
    dynamic value;
    dynamic valueCodedName;
    dynamic valueModifier;
    bool voided;

    Ob({
        this.accessionNumber,
        required this.obsDatetime,
        this.comment,
        required this.concept,
        required this.display,
        required this.encounter,
        this.groupMembers,
        this.order,
        required this.person,
        required this.uuid,
        required this.value,
        this.valueCodedName,
        this.valueModifier,
        required this.voided,
    });

    factory Ob.fromJson(Map<String, dynamic> json) => Ob(
        accessionNumber: json["accessionNumber"],
        obsDatetime: obsDatetimeValues.map[json["obsDatetime"]]!,
        comment: json["comment"],
        concept: Concept.fromJson(json["concept"]),
        display: json["display"],
        encounter: ObEncounter.fromJson(json["encounter"]),
        groupMembers: json["groupMembers"],
        order: json["order"],
        person: ObPerson.fromJson(json["person"]),
        uuid: json["uuid"],
        value: json["value"],
        valueCodedName: json["valueCodedName"],
        valueModifier: json["valueModifier"],
        voided: json["voided"],
    );

    Map<String, dynamic> toJson() => {
        "accessionNumber": accessionNumber,
        "obsDatetime": obsDatetimeValues.reverse[obsDatetime],
        "comment": comment,
        "concept": concept.toJson(),
        "display": display,
        "encounter": encounter.toJson(),
        "groupMembers": groupMembers,
        "order": order,
        "person": person.toJson(),
        "uuid": uuid,
        "value": value,
        "valueCodedName": valueCodedName,
        "valueModifier": valueModifier,
        "voided": voided,
    };
}

class Concept {
    String uuid;
    String display;
    String? units;
    double? lowNormal;
    double? hiNormal;
    List<Concept>? setMembers;

    Concept({
        required this.uuid,
        required this.display,
        this.units,
        this.lowNormal,
        this.hiNormal,
        this.setMembers,
    });

    factory Concept.fromJson(Map<String, dynamic> json) => Concept(
        uuid: json["uuid"],
        display: json["display"],
        units: json["units"],
        lowNormal: json["lowNormal"]?.toDouble(),
        hiNormal: json["hiNormal"]?.toDouble(),
        setMembers: json["setMembers"] == null ? [] : List<Concept>.from(json["setMembers"]!.map((x) => Concept.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": display,
        "units": units,
        "lowNormal": lowNormal,
        "hiNormal": hiNormal,
        "setMembers": setMembers == null ? [] : List<dynamic>.from(setMembers!.map((x) => x.toJson())),
    };
}

class ObEncounter {
    String uuid;
    EncounterDisplay display;
    EncounterDatetime encounterDatetime;
    AttributeType patient;
    AttributeType location;
    AttributeType? form;
    AttributeType encounterType;
    List<AttributeType> obs;
    List<AttributeType> orders;
    bool voided;
    AttributeType visit;
    List<AttributeType> encounterProviders;
    List<dynamic> diagnoses;
    List<Link> links;
    String resourceVersion;

    ObEncounter({
        required this.uuid,
        required this.display,
        required this.encounterDatetime,
        required this.patient,
        required this.location,
        this.form,
        required this.encounterType,
        required this.obs,
        required this.orders,
        required this.voided,
        required this.visit,
        required this.encounterProviders,
        required this.diagnoses,
        required this.links,
        required this.resourceVersion,
    });

    factory ObEncounter.fromJson(Map<String, dynamic> json) => ObEncounter(
        uuid: json["uuid"],
        display: encounterDisplayValues.map[json["display"]]!,
        encounterDatetime: encounterDatetimeValues.map[json["encounterDatetime"]]!,
        patient: AttributeType.fromJson(json["patient"]),
        location: AttributeType.fromJson(json["location"]),
        form: json["form"] == null ? null : AttributeType.fromJson(json["form"]),
        encounterType: AttributeType.fromJson(json["encounterType"]),
        obs: List<AttributeType>.from(json["obs"].map((x) => AttributeType.fromJson(x))),
        orders: List<AttributeType>.from(json["orders"].map((x) => AttributeType.fromJson(x))),
        voided: json["voided"],
        visit: AttributeType.fromJson(json["visit"]),
        encounterProviders: List<AttributeType>.from(json["encounterProviders"].map((x) => AttributeType.fromJson(x))),
        diagnoses: List<dynamic>.from(json["diagnoses"].map((x) => x)),
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": encounterDisplayValues.reverse[display],
        "encounterDatetime": encounterDatetimeValues.reverse[encounterDatetime],
        "patient": patient.toJson(),
        "location": location.toJson(),
        "form": form?.toJson(),
        "encounterType": encounterType.toJson(),
        "obs": List<dynamic>.from(obs.map((x) => x.toJson())),
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "voided": voided,
        "visit": visit.toJson(),
        "encounterProviders": List<dynamic>.from(encounterProviders.map((x) => x.toJson())),
        "diagnoses": List<dynamic>.from(diagnoses.map((x) => x)),
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

enum EncounterDisplay { CONSULTATION_05072023, VISIT_NOTE_04072023, VITALS_04072023, GENERIC_PRESCRIPTION_10052023 }

final encounterDisplayValues = EnumValues({
    "Consultation 05/07/2023": EncounterDisplay.CONSULTATION_05072023,
    "Generic Prescription 10/05/2023": EncounterDisplay.GENERIC_PRESCRIPTION_10052023,
    "Visit Note 04/07/2023": EncounterDisplay.VISIT_NOTE_04072023,
    "Vitals 04/07/2023": EncounterDisplay.VITALS_04072023
});

enum EncounterDatetime { THE_20230705_T13_05220000000, THE_20230704_T10_34100000000, THE_20230704_T10_07070000000, THE_20230510_T16_37110000000, THE_20230510_T13_35570000000 }

final encounterDatetimeValues = EnumValues({
    "2023-05-10T13:35:57.000+0000": EncounterDatetime.THE_20230510_T13_35570000000,
    "2023-05-10T16:37:11.000+0000": EncounterDatetime.THE_20230510_T16_37110000000,
    "2023-07-04T10:07:07.000+0000": EncounterDatetime.THE_20230704_T10_07070000000,
    "2023-07-04T10:34:10.000+0000": EncounterDatetime.THE_20230704_T10_34100000000,
    "2023-07-05T13:05:22.000+0000": EncounterDatetime.THE_20230705_T13_05220000000
});

enum ObsDatetime { THE_20230705_T13_05220000000, THE_20230704_T10_34090000000, THE_20230704_T10_07070000000, THE_20230510_T16_37100000000, THE_20230510_T13_35570000000 }

final obsDatetimeValues = EnumValues({
    "2023-05-10T13:35:57.000+0000": ObsDatetime.THE_20230510_T13_35570000000,
    "2023-05-10T16:37:10.000+0000": ObsDatetime.THE_20230510_T16_37100000000,
    "2023-07-04T10:07:07.000+0000": ObsDatetime.THE_20230704_T10_07070000000,
    "2023-07-04T10:34:09.000+0000": ObsDatetime.THE_20230704_T10_34090000000,
    "2023-07-05T13:05:22.000+0000": ObsDatetime.THE_20230705_T13_05220000000
});

class ObPerson {
    String uuid;
    PatientDisplay display;
    List<AttributeType> identifiers;
    PersonPerson person;
    bool voided;
    List<Link> links;
    String resourceVersion;

    ObPerson({
        required this.uuid,
        required this.display,
        required this.identifiers,
        required this.person,
        required this.voided,
        required this.links,
        required this.resourceVersion,
    });

    factory ObPerson.fromJson(Map<String, dynamic> json) => ObPerson(
        uuid: json["uuid"],
        display: patientDisplayValues.map[json["display"]]!,
        identifiers: List<AttributeType>.from(json["identifiers"].map((x) => AttributeType.fromJson(x))),
        person: PersonPerson.fromJson(json["person"]),
        voided: json["voided"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": patientDisplayValues.reverse[display],
        "identifiers": List<dynamic>.from(identifiers.map((x) => x.toJson())),
        "person": person.toJson(),
        "voided": voided,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

enum PatientDisplay { THE_1081066000202023_LOY_SANFORD }

final patientDisplayValues = EnumValues({
    "108106-6-00020/2023 - LOY SANFORD": PatientDisplay.THE_1081066000202023_LOY_SANFORD
});

class PersonPerson {
    String uuid;
    PurpleDisplay display;
    Gender gender;
    int age;
    Birthdate birthdate;
    bool birthdateEstimated;
    bool dead;
    dynamic deathDate;
    dynamic causeOfDeath;
    AttributeType preferredName;
    dynamic preferredAddress;
    List<AttributeType> attributes;
    bool voided;
    dynamic birthtime;
    bool deathdateEstimated;
    List<Link> links;
    String resourceVersion;

    PersonPerson({
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
        required this.attributes,
        required this.voided,
        this.birthtime,
        required this.deathdateEstimated,
        required this.links,
        required this.resourceVersion,
    });

    factory PersonPerson.fromJson(Map<String, dynamic> json) => PersonPerson(
        uuid: json["uuid"],
        display: purpleDisplayValues.map[json["display"]]!,
        gender: genderValues.map[json["gender"]]!,
        age: json["age"],
        birthdate: birthdateValues.map[json["birthdate"]]!,
        birthdateEstimated: json["birthdateEstimated"],
        dead: json["dead"],
        deathDate: json["deathDate"],
        causeOfDeath: json["causeOfDeath"],
        preferredName: AttributeType.fromJson(json["preferredName"]),
        preferredAddress: json["preferredAddress"],
        attributes: List<AttributeType>.from(json["attributes"].map((x) => AttributeType.fromJson(x))),
        voided: json["voided"],
        birthtime: json["birthtime"],
        deathdateEstimated: json["deathdateEstimated"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": purpleDisplayValues.reverse[display],
        "gender": genderValues.reverse[gender],
        "age": age,
        "birthdate": birthdateValues.reverse[birthdate],
        "birthdateEstimated": birthdateEstimated,
        "dead": dead,
        "deathDate": deathDate,
        "causeOfDeath": causeOfDeath,
        "preferredName": preferredName.toJson(),
        "preferredAddress": preferredAddress,
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "voided": voided,
        "birthtime": birthtime,
        "deathdateEstimated": deathdateEstimated,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

enum Birthdate { THE_20010511_T00_00000000000 }

final birthdateValues = EnumValues({
    "2001-05-11T00:00:00.000+0000": Birthdate.THE_20010511_T00_00000000000
});

enum PurpleDisplay { LOY_SANFORD }

final purpleDisplayValues = EnumValues({
    "LOY SANFORD": PurpleDisplay.LOY_SANFORD
});

enum Gender { M }

final genderValues = EnumValues({
    "M": Gender.M
});

class ValueClass {
    String uuid;
    String display;
    Name name;
    AttributeType datatype;
    AttributeType conceptClass;
    bool valueSet;
    String? version;
    bool retired;
    List<AttributeType> names;
    List<AttributeType> descriptions;
    List<AttributeType> mappings;
    List<dynamic> answers;
    List<dynamic> setMembers;
    List<dynamic> attributes;
    List<Link> links;
    String resourceVersion;

    ValueClass({
        required this.uuid,
        required this.display,
        required this.name,
        required this.datatype,
        required this.conceptClass,
        required this.valueSet,
        this.version,
        required this.retired,
        required this.names,
        required this.descriptions,
        required this.mappings,
        required this.answers,
        required this.setMembers,
        required this.attributes,
        required this.links,
        required this.resourceVersion,
    });

    factory ValueClass.fromJson(Map<String, dynamic> json) => ValueClass(
        uuid: json["uuid"],
        display: json["display"],
        name: Name.fromJson(json["name"]),
        datatype: AttributeType.fromJson(json["datatype"]),
        conceptClass: AttributeType.fromJson(json["conceptClass"]),
        valueSet: json["set"],
        version: json["version"],
        retired: json["retired"],
        names: List<AttributeType>.from(json["names"].map((x) => AttributeType.fromJson(x))),
        descriptions: List<AttributeType>.from(json["descriptions"].map((x) => AttributeType.fromJson(x))),
        mappings: List<AttributeType>.from(json["mappings"].map((x) => AttributeType.fromJson(x))),
        answers: List<dynamic>.from(json["answers"].map((x) => x)),
        setMembers: List<dynamic>.from(json["setMembers"].map((x) => x)),
        attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": display,
        "name": name.toJson(),
        "datatype": datatype.toJson(),
        "conceptClass": conceptClass.toJson(),
        "set": valueSet,
        "version": version,
        "retired": retired,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "descriptions": List<dynamic>.from(descriptions.map((x) => x.toJson())),
        "mappings": List<dynamic>.from(mappings.map((x) => x.toJson())),
        "answers": List<dynamic>.from(answers.map((x) => x)),
        "setMembers": List<dynamic>.from(setMembers.map((x) => x)),
        "attributes": List<dynamic>.from(attributes.map((x) => x)),
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

class Name {
    String display;
    String uuid;
    String name;
    Locale locale;
    bool localePreferred;
    String? conceptNameType;
    List<Link> links;
    String resourceVersion;

    Name({
        required this.display,
        required this.uuid,
        required this.name,
        required this.locale,
        required this.localePreferred,
        this.conceptNameType,
        required this.links,
        required this.resourceVersion,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        display: json["display"],
        uuid: json["uuid"],
        name: json["name"],
        locale: localeValues.map[json["locale"]]!,
        localePreferred: json["localePreferred"],
        conceptNameType: json["conceptNameType"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "display": display,
        "uuid": uuid,
        "name": name,
        "locale": localeValues.reverse[locale],
        "localePreferred": localePreferred,
        "conceptNameType": conceptNameType,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

enum Locale { EN }

final localeValues = EnumValues({
    "en": Locale.EN
});

class Order {
    String uuid;
    String orderNumber;
    String? accessionNumber;
    AttributeType patient;
    AttributeType concept;
    String action;
    AttributeType careSetting;
    dynamic previousOrder;
    String dateActivated;
    dynamic scheduledDate;
    dynamic dateStopped;
    dynamic autoExpireDate;
    AttributeType encounter;
    AttributeType orderer;
    dynamic orderReason;
    dynamic orderReasonNonCoded;
    OrderType orderType;
    String urgency;
    String? instructions;
    dynamic commentToFulfiller;
    String display;
    dynamic specimenSource;
    dynamic laterality;
    dynamic clinicalHistory;
    dynamic frequency;
    dynamic numberOfRepeats;
    List<Link> links;
    String? type;
    String resourceVersion;

    Order({
        required this.uuid,
        required this.orderNumber,
        this.accessionNumber,
        required this.patient,
        required this.concept,
        required this.action,
        required this.careSetting,
        this.previousOrder,
        required this.dateActivated,
        this.scheduledDate,
        this.dateStopped,
        this.autoExpireDate,
        required this.encounter,
        required this.orderer,
        this.orderReason,
        this.orderReasonNonCoded,
        required this.orderType,
        required this.urgency,
        this.instructions,
        this.commentToFulfiller,
        required this.display,
        this.specimenSource,
        this.laterality,
        this.clinicalHistory,
        this.frequency,
        this.numberOfRepeats,
        required this.links,
        this.type,
        required this.resourceVersion,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        uuid: json["uuid"],
        orderNumber: json["orderNumber"],
        accessionNumber: json["accessionNumber"],
        patient: AttributeType.fromJson(json["patient"]),
        concept: AttributeType.fromJson(json["concept"]),
        action: json["action"],
        careSetting: AttributeType.fromJson(json["careSetting"]),
        previousOrder: json["previousOrder"],
        dateActivated: json["dateActivated"],
        scheduledDate: json["scheduledDate"],
        dateStopped: json["dateStopped"],
        autoExpireDate: json["autoExpireDate"],
        encounter: AttributeType.fromJson(json["encounter"]),
        orderer: AttributeType.fromJson(json["orderer"]),
        orderReason: json["orderReason"],
        orderReasonNonCoded: json["orderReasonNonCoded"],
        orderType: OrderType.fromJson(json["orderType"]),
        urgency: json["urgency"],
        instructions: json["instructions"],
        commentToFulfiller: json["commentToFulfiller"],
        display: json["display"],
        specimenSource: json["specimenSource"],
        laterality: json["laterality"],
        clinicalHistory: json["clinicalHistory"],
        frequency: json["frequency"],
        numberOfRepeats: json["numberOfRepeats"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        type: json["type"],
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "orderNumber": orderNumber,
        "accessionNumber": accessionNumber,
        "patient": patient.toJson(),
        "concept": concept.toJson(),
        "action": action,
        "careSetting": careSetting.toJson(),
        "previousOrder": previousOrder,
        "dateActivated": dateActivated,
        "scheduledDate": scheduledDate,
        "dateStopped": dateStopped,
        "autoExpireDate": autoExpireDate,
        "encounter": encounter.toJson(),
        "orderer": orderer.toJson(),
        "orderReason": orderReason,
        "orderReasonNonCoded": orderReasonNonCoded,
        "orderType": orderType.toJson(),
        "urgency": urgency,
        "instructions": instructions,
        "commentToFulfiller": commentToFulfiller,
        "display": display,
        "specimenSource": specimenSource,
        "laterality": laterality,
        "clinicalHistory": clinicalHistory,
        "frequency": frequency,
        "numberOfRepeats": numberOfRepeats,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "type": type,
        "resourceVersion": resourceVersion,
    };
}

class OrderType {
    String uuid;
    String display;
    String name;
    String javaClassName;
    bool retired;
    String? description;
    List<dynamic> conceptClasses;
    dynamic parent;
    List<Link> links;
    String resourceVersion;

    OrderType({
        required this.uuid,
        required this.display,
        required this.name,
        required this.javaClassName,
        required this.retired,
        this.description,
        required this.conceptClasses,
        this.parent,
        required this.links,
        required this.resourceVersion,
    });

    factory OrderType.fromJson(Map<String, dynamic> json) => OrderType(
        uuid: json["uuid"],
        display: json["display"],
        name: json["name"],
        javaClassName: json["javaClassName"],
        retired: json["retired"],
        description: json["description"],
        conceptClasses: List<dynamic>.from(json["conceptClasses"].map((x) => x)),
        parent: json["parent"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        resourceVersion: json["resourceVersion"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": display,
        "name": name,
        "javaClassName": javaClassName,
        "retired": retired,
        "description": description,
        "conceptClasses": List<dynamic>.from(conceptClasses.map((x) => x)),
        "parent": parent,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "resourceVersion": resourceVersion,
    };
}

class ResultLocation {
    String uuid;
    NameEnum display;
    List<VisitType> tags;
    ParentLocation parentLocation;

    ResultLocation({
        required this.uuid,
        required this.display,
        required this.tags,
        required this.parentLocation,
    });

    factory ResultLocation.fromJson(Map<String, dynamic> json) => ResultLocation(
        uuid: json["uuid"],
        display: nameEnumValues.map[json["display"]]!,
        tags: List<VisitType>.from(json["tags"].map((x) => VisitType.fromJson(x))),
        parentLocation: ParentLocation.fromJson(json["parentLocation"]),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": nameEnumValues.reverse[display],
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "parentLocation": parentLocation.toJson(),
    };
}

class ParentLocation {
    String uuid;
    String display;

    ParentLocation({
        required this.uuid,
        required this.display,
    });

    factory ParentLocation.fromJson(Map<String, dynamic> json) => ParentLocation(
        uuid: json["uuid"],
        display: json["display"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": display,
    };
}

class Patient {
    String uuid;
    PatientDisplay display;
    List<Identifier> identifiers;
    PersonPerson person;
    bool voided;

    Patient({
        required this.uuid,
        required this.display,
        required this.identifiers,
        required this.person,
        required this.voided,
    });

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        uuid: json["uuid"],
        display: patientDisplayValues.map[json["display"]]!,
        identifiers: List<Identifier>.from(json["identifiers"].map((x) => Identifier.fromJson(x))),
        person: PersonPerson.fromJson(json["person"]),
        voided: json["voided"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "display": patientDisplayValues.reverse[display],
        "identifiers": List<dynamic>.from(identifiers.map((x) => x.toJson())),
        "person": person.toJson(),
        "voided": voided,
    };
}

class Identifier {
    String display;
    String uuid;
    String identifier;
    AttributeType identifierType;
    AttributeType location;
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
        identifierType: AttributeType.fromJson(json["identifierType"]),
        location: AttributeType.fromJson(json["location"]),
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
